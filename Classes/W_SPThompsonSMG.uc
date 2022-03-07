/*******************************************************************************
 * W_SPThompsonSMG 
 *******************************************************************************/
class W_SPThompsonSMG extends SPThompsonSMG
    config(User);

defaultproperties
{
    FireModeClass=class'W_SPThompsonFire'
    PickupClass=class'W_SPThompsonPickup'
}