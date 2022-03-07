/*******************************************************************************
 * W_ThompsonDrumSMG 
 *******************************************************************************/
class W_ThompsonDrumSMG extends ThompsonDrumSMG
    config(User);

defaultproperties
{
    FireModeClass=class'W_ThompsonDrumFire'
    PickupClass=class'W_ThompsonDrumPickup'
}