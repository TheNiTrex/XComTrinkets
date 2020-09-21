class X2Item_Trinkets extends X2Item config(Trinkets);

	var config int TRINKET_MOBILITY_BONUS;

	// Battle Trophies:
	var config int BLOODSOAKEDTROOPERRAG_DEFENSE_BONUS;
	var config int BROKENDATAPAD_HACK_BONUS;

	// World Items:
	var config int FALLENCOMRADEDOGTAG_WILL_BONUS;
	var config int TEMPLARCHARM_DODGE_BONUS;


static function array<X2DataTemplate> CreateTemplates() {

	local array<X2DataTemplate> Trinkets;

	// Create Trinket Weapon Templates:

	// Relics:
	Trinkets.AddItem(CreateOldWarMedal());
	Trinkets.AddItem(CreateOldWarBullet()); 
	Trinkets.AddItem(CreateTrophyEXALTScarf()); 
	Trinkets.AddItem(CreateCrystallizedMeld());

	//Battle Trophies:
	Trinkets.AddItem(CreateSectoidFinger());
	Trinkets.AddItem(CreateBloodSoakedTrooperRag());
	Trinkets.AddItem(CreateEleriumFragment());
	Trinkets.AddItem(CreateBrokenDatapad());

	// World Items:
	Trinkets.AddItem(CreateAVENGERScrap()); 
	Trinkets.AddItem(CreateFallenFriendDogTag());
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
	Template.EquipSound = "StrategyUI_Grenade_Equip"; // Choose sound

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('OldWarMedalStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label
	
	return Template;
}


static function X2DataTemplate CreateOldWarBullet() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'OldWarBullet');

	Template.strImage = "img:///UILibrary_Trinkets.OldWarBullet";
	Template.EquipSound = "StrategyUI_Grenade_Equip"; // Choose sound

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('BetweenTheEyes');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label

	return Template;
}


static function X2DataTemplate CreateTrophyEXALTScarf() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'TrophyEXALTScarf'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.XALTBandana2";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('TrophyEXALTScarfStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label

	return Template;
}

static function X2DataTemplate CreateCrystallizedMeld() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'CrystallizedMeld'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.CrystallizedMeld";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('CrystallizedMeldStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label

	return Template;
}

// #######################
// ###-BATTLE-TROPHIES-###
// #######################

static function X2DataTemplate CreateSectoidFinger() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'SectoidFinger'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.SectoidFinger";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('SectoidFingerStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label

	return Template;
}


static function X2DataTemplate CreateBloodSoakedTrooperRag() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'BloodSoakedTrooperRag'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.BloodSoakedRag";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('BloodSoakedTrooperRagStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DefenseLabel, eStat_Defense, class'X2Ability_Trinkets'.default.BLOODSOAKEDTROOPERRAG_DEFENSE_BONUS); // UI Label

	return Template;
}

static function X2DataTemplate CreateEleriumFragment() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'EleriumFragment'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.EleriumShard";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('EleriumShardStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label

	return Template;
}

static function X2DataTemplate CreateBrokenDatapad() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'BrokenDatapad'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.BrokenDataCache";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('BrokenDatapadStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label
	Template.SetUIStatMarkup(class'XLocalizedData'.default.TechBonusLabel, eStat_Hacking, class'X2Ability_Trinkets'.default.BROKENDATAPAD_HACK_BONUS, true); // UI Label

	return Template;
}

// ###################
// ###-WORLD-ITEMS-###
// ###################

static function X2DataTemplate CreateAVENGERScrap() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'AVENGERScrap'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.AVENGERScrap";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('HomeSweetHome');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label

	return Template;
}

static function X2DataTemplate CreateFallenFriendDogTag() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'FallenFriendDogTag'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.TrinketDogtags";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('FallenFriendDogTagStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label
	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, class'X2Ability_Trinkets'.default.FALLENCOMRADEDOGTAG_WILL_BONUS, true); // UI Label

	return Template;
}

static function X2DataTemplate CreateSkirmisherRadio() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'SkirmisherRadio'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.SkirmisherRadio";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('SkirmisherRadioStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label

	return Template;
}

static function X2DataTemplate CreateTemplarCharm() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'TemplarCharm'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.TemplarCharm";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('TemplarCharmStats');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, class'X2Ability_Trinkets'.default.TEMPLARCHARM_DODGE_BONUS, true); // UI Label

	return Template;
}

static function X2DataTemplate CreateReaperRecipeBook() {

	local X2WeaponTemplate Template;

	`CREATE_X2TEMPLATE(class'X2WEAPONTEMPLATE', Template, 'ReaperRecipeBook'); // Choose sound

	Template.strImage = "img:///UILibrary_Trinkets.Reaper_Cookbook";
	Template.EquipSound = "StrategyUI_Grenade_Equip";

	Template.Abilities.AddItem('TrinketStats');
	Template.Abilities.AddItem('Phantom');

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'empty';
	Template.InventorySlot = eInvSlot_SecondaryWeapon;

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Trinkets'.default.TRINKET_MOBILITY_BONUS, true); // UI Label

	return Template;
}