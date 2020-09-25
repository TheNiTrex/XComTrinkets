class X2Ability_Trinkets extends X2Ability
	dependson (XComGameStateContext_Ability) config(GameCore);

	var config config(Trinkets) int TRINKET_MOBILITY_VALUE;

	// Relic Stat Values:
	var config config(Trinkets) int VIGILANCE_SIGHTRADIUS_VALUE;
	var config config(Trinkets) int UNDEADLYAIM_AIM_VALUE;
	var config config(Trinkets) int GAMBLER_RANDOMSTATVALUE_VALUE;

	// Battle Trophy Stat Values:
	var config config(Trinkets) int VOODOO_DAMAGE_VALUE;
	var config config(Trinkets) int HARDTOTRACK_DEFENSE_VALUE;
	var config config(Trinkets) int GLASSARMOR_SHIELDHP_VALUE;
	var config config(Trinkets) int TINKERER_HACK_VALUE;

	// World Item Stat Values:
	var config config(Trinkets) int HEROISM_WILL_VALUE;
	var config config(Trinkets) int SONAR_OFFENSE_VALUE;
	var config config(Trinkets) int ARMOROFFAITH_DODGE_VALUE;
	var config config(Trinkets) int STALKER_CRITCHANCE_VALUE;

static function array<X2DataTemplate> CreateTemplates() {

	local array<X2DataTemplate> TrinketStats;

	// Create Trinket Ability Templates:

	TrinketStats.AddItem(TrinketMobility());

	// Relic Abilities:
	TrinketStats.AddItem(Vigilance());
	TrinketStats.AddItem(UndeadlyAim());
	TrinketStats.AddItem(CottonMask());
	TrinketStats.AddItem(Gambler());

	// Battle Trophy Abilties:
	TrinketStats.AddItem(Voodoo());
	TrinketStats.AddItem(HardToTrack());
	TrinketStats.AddItem(GlassArmor());
	TrinketStats.AddItem(Tinkerer());

	// World Item Abilities:
	TrinketStats.AddItem(HomeSweetHome());
	TrinketStats.AddItem(Heroism());
	TrinketStats.AddItem(Sonar());
	TrinketStats.AddItem(ArmorOfFaith());
	TrinketStats.AddItem(Stalker());

	return TrinketStats;

}

static function X2AbilityTemplate TrinketMobility() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TrinketMobility');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;
	Template.bDisplayInUITacticalText = false;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'TrinketMobilityStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.TRINKET_MOBILITY_VALUE);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

// ##############
// ###-RELICS-###
// ##############

static function X2AbilityTemplate Vigilance() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Vigilance');

	Template.IconImage = "img:///UILibrary_Trinkets.OldMedalIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'Vigilance';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_SightRadius, default.VIGILANCE_SIGHTRADIUS_VALUE);
	//BuffCat, string, string, string
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate UndeadlyAim() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_BonusAimToLost BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'UndeadlyAim');

	Template.IconImage = "img:///UILibrary_Trinkets.OldWarBulletIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// +Aim against Lost Units
	BonusEffect = new class'X2Effect_BonusAimToLost';
	BonusEffect.BonusAim = default.UNDEADLYAIM_AIM_VALUE;
	BonusEffect.BuildPersistentEffect(1, true, false, false);
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);
	Template.AddTargetEffect(BonusEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate CottonMask() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;
	local X2Effect_DamageImmunity ImmunityEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CottonMask');

	Template.IconImage = "img:///UILibrary_Trinkets.XALT_BandanaIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'CottonMask';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	// Add immunity to poison
	ImmunityEffect = new class'X2Effect_DamageImmunity';
	ImmunityEffect.EffectName = 'TrophyEXALTScarfImmunity';
	ImmunityEffect.ImmuneTypes.AddItem('Poison');
	ImmunityEffect.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	ImmunityEffect.BuildPersistentEffect(1, true, false, false);
	ImmunityEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);	
	Template.AddTargetEffect(ImmunityEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate Gambler() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local array<ECharStatType> RandomStatTypes;
	local int Index;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Gambler');

	Template.IconImage = "img:///UILibrary_Trinkets.CrystallizedMeldIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	RandomStatTypes.AddItem(eStat_Defense);
	RandomStatTypes.AddItem(eStat_Will);
	RandomStatTypes.AddItem(eStat_Dodge);
	RandomStatTypes.AddItem(eStat_CritChance);
	RandomStatTypes.AddItem(eStat_SightRadius);
	RandomStatTypes.AddItem(eStat_Offense);
	RandomStatTypes.AddItem(eStat_Hacking);

	// Throw Stat Types into an iterator and roll for each
	for (Index = 0; Index < RandomStatTypes.length; ++Index) {

		PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
		PersistentStatChangeEffect.EffectName = 'Gambler';
		PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
		PersistentStatChangeEffect.AddPersistentStatChange(RandomStatTypes[Index], default.GAMBLER_RANDOMSTATVALUE_VALUE);
		PersistentStatChangeEffect.ApplyChanceFn = ApplyChance_Gambler;
		PersistentStatChangeEffect.DuplicateResponse = eDupe_Ignore; // Ignore duplicate Effects, prevents units from getting multiple boosts
		PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);
		Template.AddTargetEffect(PersistentStatChangeEffect);

	}

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

// #######################
// ###-BATTLE-TROPHIES-###
// #######################

static function X2AbilityTemplate Voodoo() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_BonusDmgToPsi BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Voodoo');

	Template.IconImage = "img:///UILibrary_Trinkets.SectoidFingerIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	// +Damage against Psionic Units
	BonusEffect = new class'X2Effect_BonusDmgToPsi';
	BonusEffect.BonusDmg = default.VOODOO_DAMAGE_VALUE;
	BonusEffect.BuildPersistentEffect(1, true, false, false);
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);
	Template.AddTargetEffect(BonusEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate HardToTrack() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HardToTrack');

	Template.IconImage = "img:///UILibrary_Trinkets.ADVENTChipIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'HardToTrack';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Defense, default.HARDTOTRACK_DEFENSE_VALUE);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate GlassArmor() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'GlassArmor');

	Template.IconImage = "img:///UILibrary_Trinkets.EleriumShardIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'GlassArmor';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, default.GLASSARMOR_SHIELDHP_VALUE);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate Tinkerer() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Tinkerer');

	Template.IconImage = "img:///UILibrary_Trinkets.BrokenDataCacheIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'Tinkerer';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Hacking, default.TINKERER_HACK_VALUE);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

// ###################
// ###-WORLD-ITEMS-###
// ###################

static function X2AbilityTemplate HomeSweetHome() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_CritImmunity	CritImmunity;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'HomeSweetHome');

	Template.IconImage = "img:///UILibrary_Trinkets.AvengerScrapIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	CritImmunity = new class'X2Effect_CritImmunity';
	CritImmunity.BuildPersistentEffect(1, true, false, false);
	CritImmunity.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true, , Template.AbilitySourceName);
	Template.AddTargetEffect(CritImmunity);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate Heroism() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Heroism');

	Template.IconImage = "img:///UILibrary_Trinkets.dogtagsIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'Heroism';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, default.HEROISM_WILL_VALUE);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate Sonar() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Sonar');

	Template.IconImage = "img:///UILibrary_Trinkets.SkirmisherRadioIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'Sonar';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, default.SONAR_OFFENSE_VALUE);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate ArmorOfFaith() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ArmorOfFaith');

	Template.IconImage = "img:///UILibrary_Trinkets.tEMPLARcHARMIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'ArmorOfFaith';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.ARMOROFFAITH_DODGE_VALUE);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate Stalker() {

	local X2AbilityTemplate Template;
	local X2AbilityTarget_Self TargetStyle;	
	local X2AbilityTrigger Trigger;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'Stalker');

	Template.IconImage = "img:///UILibrary_Trinkets.ReaperCookbookIcon";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = true;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'Stalker';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_CritChance, default.STALKER_CRITCHANCE_VALUE);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);	
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;

}

static function name ApplyChance_Gambler(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState) {

	local int RandRoll;

	RandRoll = `SYNC_RAND_STATIC(100);

	if (RandRoll <= 14) {
		
		return 'AA_Success';

	} else {

		return 'AA_EffectChanceFailed';

	}
}