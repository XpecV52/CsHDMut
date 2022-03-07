/*******************************************************************************
 * W_Magnum44Fire 
 *******************************************************************************/
class W_Magnum44Fire extends W_SingleFire;

defaultproperties
{
    DamageType=Class'KFMod.DamTypeMagnum44Pistol'
    DamageMin=135
    DamageMax=135
    Momentum=15000.000000
    bPawnRapidFireAnim=false
    bAttachSmokeEmitter=True
    TransientSoundVolume=1.8
    FireLoopAnim=
    FireEndAnim=
    FireAnimRate=1.000000
    FireSoundRef="KF_RevolverSnd.Revolver_Fire_M"
    StereoFireSoundRef="KF_RevolverSnd.Revolver_Fire_S"
    NoAmmoSoundRef="KF_HandcannonSnd.50AE_DryFire"
    AmmoClass=Class'KFMod.Magnum44Ammo'
    AmmoPerFire=1
    BotRefireRate=0.650000
    FlashEmitterClass=Class'ROEffects.MuzzleFlash1stKar'
    aimerror=40.000000
    FireAimedAnim=Iron_Fire

    Spread=0.009
    SpreadStyle=SS_Random

    FireRate=0.15
    RecoilRate=0.07
    maxVerticalRecoilAngle=1200
    maxHorizontalRecoilAngle=200
    bWaitForRelease=true
    TweenTime=0.025

    //** View shake **//
    ShakeOffsetMag=(X=6.0,Y=1.0,Z=8.0)
    ShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    ShakeOffsetTime=2.5
    ShakeRotMag=(X=75.0,Y=75.0,Z=400.0)
    ShakeRotRate=(X=12500.0,Y=12500.0,Z=10000.0)
    ShakeRotTime=3.5
}
