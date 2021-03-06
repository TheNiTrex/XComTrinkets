class X2Item_Trinkets extends X2Item config(Trinkets);

	// Controls if these Trinkets are added into the Secondary Weapon Slot:
	var config bool bXT_SecondaryWeaponTemplatesEnabled;
	
	var config int TRINKET_MOBILITY_VALUE; 

	var config int EXALTBANDANA_TRADINGPOST_VALUE;

	// Battle Trophy UI Labels:
	var config int INOPERABLEBIOCHIP_DEFENSE_VALUE;
	var config int BROKENDATAPAD_HACK_VALUE;

	// World Item UI Labels:
	var config int FALLENCOMRADEDOGTAG_WILL_VALUE;
	var config int SKIRMISHERRADIO_OFFENSE_VALUE;
	var config int TEMPLARCHARM_DODGE_VALUE;


static function array<X2DataTemplate> CreateTemplates() {

	local array<X2DataTemplate> Trinkets;

	// Create Trinket Weapon Templates:

	// Relics:
	Trinkets.AddItem(CreateOldWarMedal());
	Trinkets.AddItem(CreateOldWarBullet()); 
	Trinkets.AddItem(CreateEXALTBandana()); 
	Trinkets.AddItem(CreateCrystallizedMeld());

	//Battle Trophies:
	Trinkets.AddItem(CreateSectoidFinger());
	Trinkets.AddItem(CreateInoperableBiochip());
	Trinkets.AddItem(CreateEleriumFragment());
	Trinkets.AddItem(CreateBrokenDatapad());

	// World Items:
	Trinkets.AddItem(CreateAVENGERScrap()); 
	Trinkets.AddItem(CreateFallenComradeDogTag());
	Trinkets.AddItem(CreateSkirmisherRadio());
	Trinkets.AddItem(CreateTemplarCharm());
	Trinkets.AddItem(CreateReaperRecipeBook());

	return Trinkets;

}

// ##############
// ###-RELICS-###
// ##############

static function X2DataTemplate CreateOldWarMedal() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'OldWarMedal');

	Template.strImage = "img:///UILibrary_Trinkets.OldMedal";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;
		
		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('Vigilance');

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = true;
	
	return Template;

}


static function X2DataTemplate CreateOldWarBullet() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'OldWarBullet');

	Template.strImage = "img:///UILibrary_Trinkets.OldWarBullet";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('UndeadlyAim');

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = true;

	return Template;

}


static function X2DataTemplate CreateEXALTBandana() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'EXALTBandana');

	Template.strImage = "img:///UILibrary_Trinkets.XALTBandana2";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('CottonMask');

	Template.TradingPostValue = default.EXALTBANDANA_TRADINGPOST_VALUE;
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = true;

	return Template;

}

static function X2DataTemplate CreateCrystallizedMeld() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'CrystallizedMeld');

	Template.strImage = "img:///UILibrary_Trinkets.CrystallizedMeld";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('Gambler');

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = true;

	return Template;

}

// #######################
// ###-BATTLE-TROPHIES-###
// #######################

static function X2DataTemplate CreateSectoidFinger() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'SectoidFinger');

	Template.strImage = "img:///UILibrary_Trinkets.SectoidFinger";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('Voodoo');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = false;

	return Template;

}


static function X2DataTemplate CreateInoperableBiochip() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'InoperableBiochip');

	Template.strImage = "img:///UILibrary_Trinkets.InoperableChip";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('HardToTrack');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.WeapFragmentA';

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.DefenseLabel, eStat_Defense, class'X2Item_Trinkets'.default.INOPERABLEBIOCHIP_DEFENSE_VALUE, true);

	return Template;

}

static function X2DataTemplate CreateEleriumFragment() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'EleriumFragment');

	Template.strImage = "img:///UILibrary_Trinkets.EleriumShard";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('GlassArmor');

	Template.LootStaticMesh = StaticMesh'UI_3D.Loot.WeapFragmentA';

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = false;

	return Template;

}

static function X2DataTemplate CreateBrokenDatapad() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'BrokenDatapad');

	Template.strImage = "img:///UILibrary_Trinkets.BrokenDataCache";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = false;
	
	Template.Abilities.AddItem('Tinkerer');
		
	Template.SetUIStatMarkup(class'XLocalizedData'.default.TechBonusLabel, eStat_Hacking, class'X2Item_Trinkets'.default.BROKENDATAPAD_HACK_VALUE, true);

	return Template;

}

// ###################
// ###-WORLD-ITEMS-###
// ###################

static function X2DataTemplate CreateAVENGERScrap() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'AVENGERScrap');

	Template.strImage = "img:///UILibrary_Trinkets.AVENGERScrap";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('HomeSweetHome');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = false;

	return Template;

}

static function X2DataTemplate CreateFallenComradeDogTag() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'FallenComradeDogTag');

	Template.strImage = "img:///UILibrary_Trinkets.TrinketDogtags";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('Heroism');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysRecovered = false; // If set to true, this item will always be looted if dropped
		
	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, class'X2Item_Trinkets'.default.FALLENCOMRADEDOGTAG_WILL_VALUE, true);

	return Template;

}

static function X2DataTemplate CreateSkirmisherRadio() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'SkirmisherRadio');

	Template.strImage = "img:///UILibrary_Trinkets.SkirmisherRadio";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;
		
		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('Sonar');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = false;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.OffenseStat, eStat_Offense, class'X2Item_Trinkets'.default.SKIRMISHERRADIO_OFFENSE_VALUE, true);

	return Template;

}

static function X2DataTemplate CreateTemplarCharm() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'TemplarCharm');

	Template.strImage = "img:///UILibrary_Trinkets.TemplarCharm";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('ArmorOfFaith');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = false;
		
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, class'X2Item_Trinkets'.default.TEMPLARCHARM_DODGE_VALUE, true);

	return Template;

}

static function X2DataTemplate CreateReaperRecipeBook() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'ReaperRecipeBook');

	Template.strImage = "img:///UILibrary_Trinkets.Reaper_Cookbook";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	if (default.bXT_SecondaryWeaponTemplatesEnabled == true) {

		Template.ItemCat = 'weapon';
		Template.WeaponCat = 'empty';
		Template.InventorySlot = eInvSlot_SecondaryWeapon;

		Template.Abilities.AddItem('TrinketMobility');

		Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Item_Trinkets'.default.TRINKET_MOBILITY_VALUE, true);

	} else {

		Template.WeaponCat = 'utility';
		Template.ItemCat = 'utility';
		Template.InventorySlot = eInvSlot_Utility;

	}

	Template.Abilities.AddItem('Stalker');

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = false;
	Template.bAlwaysUnique = false;

	return Template;

}