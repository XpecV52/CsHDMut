/*******************************************************************************
 * W_MK23Fire 
 *******************************************************************************/
class W_MK23Fire extends W_SingleFire;


defaultproperties
{
    DamageType=Class'KFMod.DamTypeMK23Pistol'
    DamageMin=90
    DamageMax=90
    Momentum=18000.000000
    bPawnRapidFireAnim=True
    bAttachSmokeEmitter=True
    TransientSoundVolume=1.8
    FireLoopAnim=
    FireEndAnim=
    FireSoundRef="KF_MK23Snd.MK23_Fire_M"
    StereoFireSoundRef="KF_MK23Snd.MK23_Fire_S"
    NoAmmoSoundRef="KF_HandcannonSnd.50AE_DryFire"
    AmmoClass=Class'KFMod.MK23Ammo'
    AmmoPerFire=1
    BotRefireRate=0.650000
    FlashEmitterClass=Class'KFMod.MuzzleFlashMK'
    aimerror=30.000000
    FireAimedAnim=Fire_Iron

    Spread=0.01
    SpreadStyle=SS_Random

    FireRate=0.18
    RecoilRate=0.07
    maxVerticalRecoilAngle=500
    maxHorizontalRecoilAngle=100
    bWaitForRelease=true
    TweenTime=0.025

    //** View shake **//
    ShakeRotMag=(X=75.000000,Y=75.000000,Z=290.000000)
    ShakeRotRate=(X=10080.000000,Y=10080.000000,Z=10000.000000)
    ShakeRotTime=3.500000
    ShakeOffsetMag=(X=6.000000,Y=1.000000,Z=8.000000)
    ShakeOffsetRate=(X=1000.000000,Y=1000.000000,Z=1000.000000)
    ShakeOffsetTime=2.500000

    ShellEjectClass=class'ROEffects.KFShellEject9mm'
    ShellEjectBoneName=Shell_Eject
}
