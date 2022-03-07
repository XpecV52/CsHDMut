/*******************************************************************************
 * W_SPSniperRifle 
 *******************************************************************************/
class W_SPSniperRifle extends SPSniperRifle
    config(User);

defaultproperties
{
    FireModeClass=class'W_SPSniperFire'
    PickupClass=class'W_SPSniperPickup'
}