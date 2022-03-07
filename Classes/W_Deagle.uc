
class W_Deagle extends Deagle
    config;

simulated function bool PutDown()
{
    if(Instigator.PendingWeapon.Class == class'CsHDMut'.static.DualVariantOf(Class))
    {
        bIsReloading = false;
    }
    return super(KFWeapon).PutDown();
}

defaultproperties
{
    FireModeClass=class'W_DeagleFire'
    PickupClass=class'W_DeaglePickup'
}