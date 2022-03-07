/*******************************************************************************
 * W_M4203AssaultRifle 
 *******************************************************************************/
class W_M4203AssaultRifle extends M4203AssaultRifle
    config(User);

defaultproperties
{
    FireModeClass=class'W_M4203BulletFire'
    PickupClass=class'W_M4203Pickup'
}