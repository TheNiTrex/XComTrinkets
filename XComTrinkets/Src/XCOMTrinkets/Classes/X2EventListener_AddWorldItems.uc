class X2EventListener_AddWorldItems extends X2EventListener;

static function array<X2DataTemplate> CreateTemplates() {

    local array<X2DataTemplate> Templates;

    Templates.AddItem(CreateHasPlayerMetFactionConditionListener());

    return Templates;

}

static function X2EventListenerTemplate CreateHasPlayerMetFactionConditionListener() {

    local X2EventListenerTemplate Template;

    `CREATE_X2TEMPLATE(class'X2EventListenerTemplate', Template, 'HasPlayerMetFactionConditionListener');

    // Should the Event Listener listen for the event during tactical missions?
    Template.RegisterInTactical = false;

    // Should listen to the event while on Avenger?
    Template.RegisterInStrategy = true;

    Template.AddEvent('NewCrewNotification', AddWorldItems);

    return Template;

}

static protected function EventListenerReturn AddWorldItems(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData) {
	
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameStateHistory History;
	local XComGameState NewGameState;
	local X2ItemTemplateManager TemplateManager;
	local XComGameState_Unit BarracksUnit;
	local name ClassName;

	History = `XCOMHISTORY;
	XComHQ = `XCOMHQ;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Trinket World Items");

	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));

	NewGameState.AddStateObject(XComHQ);

	TemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Fetch the unit that triggered the event
	BarracksUnit = XComGameState_Unit(EventData);
	// Fetch the unit's class name
	ClassName = BarracksUnit.GetSoldierClassTemplateName();

	switch (ClassName) {

		case 'Skirmisher':

			PutWorldItemIntoInventory(TemplateManager.FindItemTemplate('SkirmisherRadio'), NewGameState, XComHQ);

			break;

		case 'Templar':

			PutWorldItemIntoInventory(TemplateManager.FindItemTemplate('TemplarCharm'), NewGameState, XComHQ);

			break;

		case 'Reaper':

			PutWorldItemIntoInventory(TemplateManager.FindItemTemplate('ReaperRecipeBook'), NewGameState, XComHQ);

			break;

		default: // If the unit isn't a faction hero, there's nothing to do, so wrap-up the Game State
			
			History.CleanupPendingGameState(NewGameState);

			break;

		}

    return ELR_NoInterrupt;

}

static function PutWorldItemIntoInventory(X2ItemTemplate WorldItem, XComGameState NewGameState, XComGameState_HeadquartersXCom XComHQ) {

	local XComGameState_Item NewItemState;

	NewItemState = WorldItem.CreateInstanceFromTemplate(NewGameState);
	XComHQ.PutItemInInventory(NewGameState, NewItemState);
	`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);

	return;

}