/*******************************************************************************
 * W_DualDeagleFire 
 *******************************************************************************/
class W_DualDeagleFire extends W_DualiesFire;

defaultproperties
{
    FireAnim2="FireLeft"
    FireAimedAnim=FireRight_Iron
    FireAimedAnim2=FireLeft_Iron
    DamageType=Class'KFMod.DamTypeDualDeagle'
    DamageMin=125
    DamageMax=125
    Momentum=20000.000000
    bPawnRapidFireAnim=True
    bAttachSmokeEmitter=True
    TransientSoundVolume=1.8
    FireAnim="FireRight"
    FireLoopAnim=
    FireEndAnim=
    FireAnimRate=1.000000
    FireSound=Sound'KF_HandcannonSnd.50AE_Fire'
    StereoFireSoundRef="KF_HandcannonSnd.50AE_FireST"
    NoAmmoSound=Sound'KF_HandcannonSnd.50AE_DryFire'
    FireForce="AssaultRifleFire"
    AmmoClass=Class'KFMod.DeagleAmmo'
    AmmoPerFire=1
    BotRefireRate=0.250000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stKar'
    aimerror=40.000000

    SpreadStyle=SS_Random
    Spread=0.01
    bWaitForRelease=true

    FireRate=0.13000
    RecoilRate=0.07

    maxVerticalRecoilAngle=1200
    maxHorizontalRecoilAngle=200
    TweenTime=0.025

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=1.0,Z=8.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.5
    ShakeRotMag=(X=75.0,Y=75.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=10000.0)
    ShakeRotTime=3.5

    ShellEjectClass=class'ROEffects.KFShellEjectHandCannon'
    ShellEjectBoneName=Shell_eject_left
    ShellEject2BoneName=Shell_eject_right
}
