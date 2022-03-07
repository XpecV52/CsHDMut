/*******************************************************************************
 * W_SCARMK17AssaultRifle 
 *******************************************************************************/
class W_SCARMK17AssaultRifle extends SCARMK17AssaultRifle
    config(User);

defaultproperties
{
    FireModeClass=class'W_SCARMK17Fire'
    PickupClass=class'W_SCARMK17Pickup'
}