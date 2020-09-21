class X2Ability_Trinkets extends X2Ability
	dependson (XComGameStateContext_Ability) config(GameCore);

	var bool AbilityApplied;

	var config config(Trinkets) int TRINKET_MOBILITY_BONUS;

	// Relics:
	var config config(Trinkets) int OLDWARMEDAL_SIGHTRADIUS_BONUS;

	// Battle Trophies:
	var config config(Trinkets) int VOODOO_DMG;
	var config config(Trinkets) int BLOODSOAKEDTROOPERRAG_DEFENSE_BONUS;
	var config config(Trinkets) int ELERIUMSHARD_SHIELDHP_BONUS;
	var config config(Trinkets) int BROKENDATAPAD_HACK_BONUS;

	// World Items:
	var config config(Trinkets) int FALLENCOMRADEDOGTAG_WILL_BONUS;
	var config config(Trinkets) int SKIRMISHERRADIO_CRITCHANCE_BONUS;
	var config config(Trinkets) int TEMPLARCHARM_DODGE_BONUS;

static function array<X2DataTemplate> CreateTemplates() {

	local array<X2DataTemplate> TrinketStats;

	// Create Trinket Ability Templates:

	TrinketStats.AddItem(TrinketMobilityStats());

	// Relics:
	TrinketStats.AddItem(OldWarMedalStats());
	TrinketStats.AddItem(TrophyEXALTScarfStats());
	TrinketStats.AddItem(CrystallizedMeldStats());

	// Battle Trophies:
	TrinketStats.AddItem(SectoidFingerStats());
	TrinketStats.AddItem(BloodSoakedTrooperRagStats());
	TrinketStats.AddItem(EleriumShardStats());
	TrinketStats.AddItem(BrokenDatapadStats());

	// World Items:
	TrinketStats.AddItem(HomeSweetHome());
	TrinketStats.AddItem(FallenFriendDogTagStats());
	TrinketStats.AddItem(SkirmisherRadioStats());
	TrinketStats.AddItem(TemplarCharmStats());

	return TrinketStats;

}

static function X2AbilityTemplate TrinketMobilityStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TrinketMobilityStats');

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bIsPassive = true;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.EffectName = 'TrinketMobilityStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.TRINKET_MOBILITY_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

// ##############
// ###-RELICS-###
// ##############

static function X2AbilityTemplate OldWarMedalStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'OldWarMedalStats');

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
	PersistentStatChangeEffect.EffectName = 'OldWorldMedalStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_SightRadius, default.OLDWARMEDAL_SIGHTRADIUS_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate TrophyEXALTScarfStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;
	local X2Effect_DamageImmunity ImmunityEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TrophyEXALTScarfStats');

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
	PersistentStatChangeEffect.EffectName = 'TrophyEXALTScarfStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	// Add immunity to poison
	ImmunityEffect = new class'X2Effect_DamageImmunity';
	ImmunityEffect.EffectName = 'TrophyEXALTScarfImmunity';
	ImmunityEffect.ImmuneTypes.AddItem('Poison');
	ImmunityEffect.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	ImmunityEffect.BuildPersistentEffect(1, true, false, false);
	ImmunityEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(ImmunityEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate CrystallizedMeldStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	local array<ECharStatType> RandomStatTypes;
	local int Index;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'CrystallizedMeldStats');

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

	RandomStatTypes.AddItem(eStat_SightRadius);
	RandomStatTypes.AddItem(eStat_Defense);
	RandomStatTypes.AddItem(eStat_Hacking);
	RandomStatTypes.AddItem(eStat_Will);
	RandomStatTypes.AddItem(eStat_CritChance);
	RandomStatTypes.AddItem(eStat_Dodge);

	// Throw Stat Types into an iterator and roll for each
	for (Index = 0; Index < RandomStatTypes.length; ++Index) {

		PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
		PersistentStatChangeEffect.EffectName = 'CrystallizedMeldStats';
		PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
		PersistentStatChangeEffect.AddPersistentStatChange(RandomStatTypes[Index], 10);
		PersistentStatChangeEffect.ApplyChanceFn = ApplyChance_CrystallizedMeldStats;
		PersistentStatChangeEffect.DuplicateResponse = eDupe_Ignore; // Ignore duplicate Effects, prevents units from getting multiple boosts
		Template.AddTargetEffect(PersistentStatChangeEffect);

	}

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

// #######################
// ###-BATTLE-TROPHIES-###
// #######################

static function X2AbilityTemplate SectoidFingerStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	//local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	local X2Condition_UnitProperty TargetCondition;
	local X2Effect_BonusWeaponDamage BonusEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SectoidFingerStats');

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

	// Use Target Condition to exclude Non-Psionic Units from the Effect
	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeNonPsionic = true;
	// +Damage against Psionic Units
	BonusEffect = new class'X2Effect_BonusWeaponDamage';
	BonusEffect.BonusDmg = default.VOODOO_DMG;
	BonusEffect.BuildPersistentEffect(1, true, false, false);
	BonusEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, true,, Template.AbilitySourceName);
	BonusEffect.TargetConditions.AddItem(TargetCondition);
	Template.AddTargetEffect(BonusEffect);

	//PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	//PersistentStatChangeEffect.EffectName = 'SectoidFingerStats';
	//PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	//PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, default.SECTOIDFINGER_PSIOFFENSE_BONUS);
	//Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate BloodSoakedTrooperRagStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BloodSoakedTrooperRagStats');

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
	PersistentStatChangeEffect.EffectName = 'BloodSoakedTrooperRagStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Defense, default.BLOODSOAKEDTROOPERRAG_DEFENSE_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate EleriumShardStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'EleriumShardStats');

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
	PersistentStatChangeEffect.EffectName = 'EleriumShardStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, default.ELERIUMSHARD_SHIELDHP_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate BrokenDatapadStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'BrokenDatapadStats');

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
	PersistentStatChangeEffect.EffectName = 'BrokenDatapadStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Hacking, default.BROKENDATAPAD_HACK_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

// ###################
// ###-WORLD-ITEMS-###
// ###################

static function X2AbilityTemplate HomeSweetHome() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;

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

static function X2AbilityTemplate FallenFriendDogTagStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;
	//local X2Effect_DamageImmunity ImmunityEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FallenFriendDogTagStats');

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
	PersistentStatChangeEffect.EffectName = 'FallenFriendDogTagStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, default.FALLENCOMRADEDOGTAG_WILL_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate SkirmisherRadioStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SkirmisherRadioStats');

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
	PersistentStatChangeEffect.EffectName = 'SkirmisherRadioStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, default.TEMPLARCHARM_DODGE_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function X2AbilityTemplate TemplarCharmStats() {

	local X2AbilityTemplate Template;	
	local X2AbilityTrigger Trigger;
	local X2AbilityTarget_Self	TargetStyle;
	local X2Effect_PersistentStatChange PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TemplarCharmStats');

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
	PersistentStatChangeEffect.EffectName = 'TemplarCharmStats';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_CritChance, default.SKIRMISHERRADIO_CRITCHANCE_BONUS);
	Template.AddTargetEffect(PersistentStatChangeEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;	

}

static function name ApplyChance_CrystallizedMeldStats(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState) {

	local int RandRoll;

	RandRoll = `SYNC_RAND_STATIC(100);

	if (RandRoll <= 17) {
		
		return 'AA_Success';

	} else {

		return 'AA_EffectChanceFailed';

	}
}
