class XComGameState_TacticalCleanup extends XComGameState_BaseObject;

var bool bRegistered;

function RegisterToListen() {

	local Object ThisObj;
	ThisObj = self;

	if (!bRegistered) {

		`log("TacticalCleanup TacticalEventListener Loaded",, 'XCOMTrinkets');

		bRegistered = true;
		`XEVENTMGR.RegisterForEvent(ThisObj, 'TacticalGameEnd', CleanupTacticalGame, ELD_OnStateSubmitted, , , true);

	} else {

		`log("TacticalCleanup TacticalEventListener already present",, 'XCOMTrinkets');

	}
}

function EventListenerReturn CleanupTacticalGame(Object EventData, Object EventSource, XComGameState GivenGameState, Name Event, Object CallbackData) {

	local XComGameStateHistory History;
	local XComGameState NewGameState;
	local XComGameState_HeadquartersXCom XComHQ;
	local X2ItemTemplateManager ItemTemplateManager;
	local XComGameState_Item ItemState;
	local X2ItemTemplate ItemTemplate;
	local XComGameState_Unit Unit;
	local int i;

	`log("Recovering Soldier DogTag(s)",, 'XCOMTrinkets');

	History = `XCOMHISTORY;
	
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Cleanup Tactical Mission Loot");

	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));

	NewGameState.AddStateObject(XComHQ);

	ItemTemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	ItemTemplate = ItemTemplateManager.FindItemTemplate('FallenComradeDogTag');

	for (i = 0; i < XComHQ.Squad.Length; ++i) {

	Unit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectId(XComHQ.Squad[i].ObjectID));

		// If the Unit State is of the base Soldier Template, is dead, and their dead body has been recovered,
		// Add +1 Dog Tags to the XComHQ Inventory:
		if(Unit.GetMyTemplateName() == 'Soldier' && Unit.IsDead() && Unit.bBodyRecovered) {

			ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(ItemState);
			ItemState.Quantity = 1;
			ItemState.OwnerStateObject = XComHQ.GetReference();
			XComHQ.PutItemInInventory(NewGameState, ItemState, true);

		} else { // Failsafe

		History.CleanupPendingGameState(NewGameState);

		}
	}
	
	`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);

	return ELR_NoInterrupt;

}


function bool HasAnyTriadObjective(XComGameState_BattleData Battle) {

	local int ObjectiveIndex;

	for( ObjectiveIndex = 0; ObjectiveIndex < Battle.MapData.ActiveMission.MissionObjectives.Length; ++ObjectiveIndex ) {

		if( Battle.MapData.ActiveMission.MissionObjectives[ObjectiveIndex].bIsTriadObjective ) {

			return true;

		}
	}

	return false;

}