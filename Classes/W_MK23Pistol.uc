/*******************************************************************************
 * W_MK23Pistol 
 *******************************************************************************/
class W_MK23Pistol extends MK23Pistol
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
    FireModeClass=class'W_MK23Fire'
    PickupClass=class'W_MK23Pickup'
}