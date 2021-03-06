//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_XCOMTrinkets.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_XCOMTrinkets extends X2DownloadableContentInfo;

	var config array<LootTable> LootTables, LootEntry;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame() {

	AddTrinkets();

}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState) {

	// Item Templates are added at campaign start if Template.StartingItem is set to True, only need to add World Item Trinkets

	AddWorldItems(StartState);

}

static event OnPostTemplatesCreated() {

    AddLootTables();

}

static function AddTrinkets() {

	local XComGameState NewGameState;
	local XComGameState_Item NewItemState;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local X2ItemTemplateManager TemplateManager;
	local X2ItemTemplate Trinket;

	local array<name> TrinketTemplateNames;
	local name TrinketTemplateName;

	History = `XCOMHISTORY;
	XComHQ = `XCOMHQ;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding Trinkets");

	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));

	NewGameState.AddStateObject(XComHQ);

	TemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Add Trinket Template Names to list:
	TrinketTemplateNames.AddItem('OldWarMedal');
	TrinketTemplateNames.AddItem('OldWarBullet'); 
	TrinketTemplateNames.AddItem('EXALTBandana'); 
	TrinketTemplateNames.AddItem('CrystallizedMeld');
	TrinketTemplateNames.AddItem('SectoidFinger');
	TrinketTemplateNames.AddItem('InoperableBiochip');
	TrinketTemplateNames.AddItem('EleriumFragment');
	TrinketTemplateNames.AddItem('BrokenDatapad');
	TrinketTemplateNames.AddItem('AVENGERScrap'); 
	TrinketTemplateNames.AddItem('FallenComradeDogTag');
	TrinketTemplateNames.AddItem('SkirmisherRadio');
	TrinketTemplateNames.AddItem('TemplarCharm');
	TrinketTemplateNames.AddItem('ReaperRecipeBook');

	// Iterate through list and create each Trinket Template:
	foreach TrinketTemplateNames(TrinketTemplateName) {

		Trinket = TemplateManager.FindItemTemplate(TrinketTemplateName);

		if (Trinket != none) { // Failsafe

			NewItemState = Trinket.CreateInstanceFromTemplate(NewGameState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);

		} else { // Should never trigger, but just good practice
	
			History.CleanupPendingGameState(NewGameState);

		}
	} 
}

static function AddWorldItems(XComGameState StartState) {

	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameStateHistory History;
	local StateObjectReference UnitRef;
	local XComGameState_Item NewItemState;
	local X2ItemTemplateManager TemplateManager;
	local XComGameState_Unit BarracksUnit;
	local name ClassName;
	local X2ItemTemplate WorldItem;

	XComHQ = `XCOMHQ;
	History = `XCOMHISTORY;

	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(StartState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));

	TemplateManager = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	foreach XComHQ.Crew(UnitRef) {

		BarracksUnit = XComGameState_Unit(History.GetGameStateForObjectID(UnitRef.ObjectID));
		BarracksUnit = XComGameState_Unit(StartState.ModifyStateObject(class'XComGameState_Unit', BarracksUnit.ObjectID));

		// Fetch the unit's class name
		ClassName = BarracksUnit.GetSoldierClassTemplateName();

		if (BarracksUnit != none && ClassName == 'Skirmisher' || ClassName == 'Templar' || ClassName == 'Reaper') {

			switch (ClassName) {

				case 'Skirmisher':

					WorldItem = TemplateManager.FindItemTemplate('SkirmisherRadio');

					break;

				case 'Templar':

					WorldItem = TemplateManager.FindItemTemplate('TemplarCharm');

					break;

				case 'Reaper':

					WorldItem = TemplateManager.FindItemTemplate('ReaperRecipeBook');

					break;

			}
			
			NewItemState = WorldItem.CreateInstanceFromTemplate(StartState);
			XComHQ.PutItemInInventory(StartState, NewItemState);

		}
	}
}

static function AddLootTables() { // Use CHL to add Trinket Loot

    local X2LootTableManager LootManager;
    local LootTable LootBag;
    local LootTableEntry Entry;
    
    LootManager = X2LootTableManager(class'Engine'.static.FindClassDefaultObject("X2LootTableManager"));

    foreach default.LootEntry(LootBag) {

        if (LootManager.default.LootTables.Find('TableName', LootBag.TableName) != INDEX_NONE) {

            foreach LootBag.Loots(Entry) {

                class'X2LootTableManager'.static.AddEntryStatic(LootBag.TableName, Entry, false);

            }
        }    
    }
}

static event OnPreMission(XComGameState NewGameState, XComGameState_MissionSite MissionState) { // Adding TacticalCleanup TacticalEventListener

	local XComGameState_TacticalCleanup EndMissionListener;
	
	EndMissionListener = XComGameState_TacticalCleanup(class'XComGameStateHistory'.static.GetGameStateHistory().GetSingleGameStateObjectForClass(class'XComGameState_TacticalCleanup', true));

	if (EndMissionListener == none) {

		EndMissionListener = XComGameState_TacticalCleanup(NewGameState.CreateStateObject(class'XComGameState_TacticalCleanup'));
		NewGameState.AddStateObject(EndMissionListener);

	}

	EndMissionListener.RegisterToListen();

}

static function bool AbilityTagExpandHandler(string InString, out string OutString) { // Dynamic Localization

    local name TagText;
    
    TagText = name(InString);
		
	switch (TagText) {

		case 'VIGILANCE_SIGHTRADIUS_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.VIGILANCE_SIGHTRADIUS_VALUE);

			return true;

		case 'UNDEADLYAIM_AIM_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.UNDEADLYAIM_AIM_VALUE);

			return true;

		case 'VOODOO_DAMAGE_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.VOODOO_DAMAGE_VALUE);

			return true;

		case 'HARDTOTRACK_DEFENSE_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.HARDTOTRACK_DEFENSE_VALUE);

			return true;

		case 'GLASSARMOR_SHIELDHP_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.GLASSARMOR_SHIELDHP_VALUE);

			return true;

		case 'TINKERER_HACK_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.TINKERER_HACK_VALUE);

			return true;

		case 'HEROISM_WILL_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.HEROISM_WILL_VALUE);

			return true;

		case 'SONAR_OFFENSE_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.SONAR_OFFENSE_VALUE);

			return true;

		case 'ARMOROFFAITH_DODGE_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.ARMOROFFAITH_DODGE_VALUE);

			return true;

		case 'STALKER_CRITCHANCE_VALUE':

			OutString = string(class'X2Ability_Trinkets'.default.STALKER_CRITCHANCE_VALUE);

			return true;

	}
}