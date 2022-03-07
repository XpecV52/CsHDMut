/*******************************************************************************
 * W_DualMK23Fire 
 *******************************************************************************/
class W_DualMK23Fire extends W_DualiesFire;
defaultproperties
{
    DamageType=Class'KFMod.DamTypeDualMK23Pistol'
    DamageMin=90
    DamageMax=90
    Momentum=18000.000000
    maxVerticalRecoilAngle=500
    maxHorizontalRecoilAngle=100
    FireSound=none
    StereoFireSound=none
    NoAmmoSound=none
    FireSoundRef="KF_MK23Snd.MK23_Fire_M"
    StereoFireSoundRef="KF_MK23Snd.MK23_Fire_S"
    NoAmmoSoundRef="KF_HandcannonSnd.50AE_DryFire"
    FireRate=0.120000
    AmmoClass=Class'KFMod.MK23Ammo'
    ShakeRotMag=(Z=290.000000)
    ShakeRotRate=(X=10080.000000,Y=10080.000000)
    ShakeRotTime=3.500000
    ShakeOffsetMag=(Y=1.000000,Z=8.000000)
    ShakeOffsetTime=2.500000
    FlashEmitterClass=Class'KFMod.MuzzleFlashMK'
    ShellEjectClass=class'KFMod.MK23Shell'
    aimerror=40.000000
    Spread=0.010000

    ShellEjectBoneName=Shell_eject_left
    ShellEject2BoneName=Shell_eject_right
}