/*******************************************************************************
 * W_Single 
 *******************************************************************************/
class W_Single extends Single
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
    FireModeClass=class'W_SingleFire'
    PickupClass=class'W_SinglePickup'
}