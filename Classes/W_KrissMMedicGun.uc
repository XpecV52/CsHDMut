/*******************************************************************************
 * W_KrissMMedicGun 
 *******************************************************************************/
class W_KrissMMedicGun extends KrissMMedicGun
    config;

defaultproperties
{
    FireModeClass[0]=class'W_KrissMFire'
    FireModeClass[1]=class'W_KrissMAltFire'
    PickupClass=class'W_KrissMPickup'
}