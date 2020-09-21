class X2Effect_CritImmunity extends X2Effect_Persistent;

function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult) { 
	
	if (CurrentResult == eHit_Crit) { // If the current hit is a Crit

		NewHitResult = eHit_Success; // Turn it into a regular hit

		return true;

	}

	return false; 

}

defaultproperties {

	DuplicateResponse = eDupe_Ignore
	EffectName = "HomeSweetHome"

}