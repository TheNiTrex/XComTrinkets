class X2Effect_BonusDmgToPsi extends X2Effect_Persistent;

var int BonusDmg;

function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState) {

    local XComGameState_Unit TargetUnit;
	local X2Effect_ApplyWeaponDamage DamageEffect;
    
    TargetUnit = XComGameState_Unit(TargetDamageable);
    
	// Check if the ability actually hits before applying, otherwise the damage will be applied even w/ a miss
	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult) || CurrentDamage <= 0)
		return 0;

	// only limit this when actually applying damage (not previewing)
	if( NewGameState != none ) {

		// only add the bonus damage when the damage effect is applying the weapon's base damage
		DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));
    
		if( DamageEffect == none || DamageEffect.bIgnoreBaseDamage ) {

			return 0;

		}
	}

	// Do a none check, since abilties can target Non-Units (Such as targetable explosives), 
	// and check if the Targeted Unit is Psionic
    if (TargetUnit != none && TargetUnit.IsPsionic()) { 
		
		return BonusDmg;

	}

    return 0; 
}

defaultproperties
{
    bDisplayInSpecialDamageMessageUI = true // Controls if the unique damage pop-up occurs
}