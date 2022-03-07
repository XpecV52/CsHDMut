/*******************************************************************************
 * W_Dual44MagnumFire 
 *******************************************************************************/
class W_Dual44MagnumFire extends W_DualiesFire;


defaultproperties
{
    FireAnim2="FireLeft"
    FireAimedAnim=FireRight_Iron
    FireAimedAnim2=FireLeft_Iron
    DamageType=Class'KFMod.DamTypeDual44Magnum'
    DamageMin=135
    DamageMax=135
    Momentum=15000.000000
    bPawnRapidFireAnim=True
    bAttachSmokeEmitter=True
    TransientSoundVolume=1.8
    FireAnim="FireRight"
    FireLoopAnim=
    FireEndAnim=
    FireAnimRate=1.000000
    FireSound=none
    StereoFireSound=none
    NoAmmoSound=none
    FireSoundRef="KF_RevolverSnd.Revolver_Fire_M"
    StereoFireSoundRef="KF_RevolverSnd.Revolver_Fire_S"
    NoAmmoSoundRef="KF_HandcannonSnd.50AE_DryFire"
    FireForce="AssaultRifleFire"
    AmmoClass=Class'KFMod.Magnum44Ammo'
    AmmoPerFire=1
    BotRefireRate=0.250000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stKar'
    aimerror=40.000000

    SpreadStyle=SS_Random
    Spread=0.009
    bWaitForRelease=true

    FireRate=0.075
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

    ShellEjectClass=none
}
