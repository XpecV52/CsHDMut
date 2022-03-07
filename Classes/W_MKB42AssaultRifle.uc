/*******************************************************************************
 * W_MKB42AssaultRifle 
 *******************************************************************************/
class W_MKB42AssaultRifle extends MKB42AssaultRifle
    config(User);

defaultproperties
{
    FireModeClass=class'W_MKB42Fire'
    PickupClass=class'W_MKB42Pickup'
}