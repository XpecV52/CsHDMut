/*******************************************************************************
 * W_M4AssaultRifle 
 *******************************************************************************/
class W_M4AssaultRifle extends M4AssaultRifle
    config(User);

defaultproperties
{
    FireModeClass=class'W_M4Fire'
    PickupClass=class'W_M4Pickup'
}