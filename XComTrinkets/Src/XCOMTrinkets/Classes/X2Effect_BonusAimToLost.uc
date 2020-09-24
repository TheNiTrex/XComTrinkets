class X2Effect_BonusAimToLost extends X2Effect_Persistent;

var int BonusAim;

function GetToHitModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers) {    
    
	local ShotModifierInfo ModInfo;

	// Do a none check, since abilties can target Non-Units (Such as targetable explosives), 
	// and check if the Targeted Unit is Lost
    if (Target != none && Target.GetMyTemplate().CharacterGroupName == 'TheLost') { 

		ModInfo.ModType = eHit_Success;
		ModInfo.Reason = FriendlyName;
		ModInfo.Value = BonusAim;
		ShotModifiers.AddItem(ModInfo);
	
	}
}

defaultproperties
{
    bDisplayInSpecialDamageMessageUI = true // Controls if the unique damage pop-up occurs
}