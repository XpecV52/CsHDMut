/*******************************************************************************
 * W_GoldenDeagle 
 *******************************************************************************/
class W_GoldenDeagle extends GoldenDeagle
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
    FireModeClass=class'W_GoldenDeagleFire'
    PickupClass=class'W_GoldenDeaglePickup'
}