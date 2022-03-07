/*******************************************************************************
 * W_Magnum44Pistol 
 *******************************************************************************/
class W_Magnum44Pistol extends Magnum44Pistol
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
    FireModeClass=class'W_Magnum44Fire'
    PickupClass=class'W_Magnum44Pickup'
}