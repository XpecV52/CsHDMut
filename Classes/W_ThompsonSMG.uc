/*******************************************************************************
 * W_ThompsonSMG 
 *******************************************************************************/
class W_ThompsonSMG extends ThompsonSMG
    config(User);

defaultproperties
{
    FireModeClass=class'W_ThompsonFire'
    PickupClass=class'W_ThompsonPickup'
}