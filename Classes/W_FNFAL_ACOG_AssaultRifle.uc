/*******************************************************************************
 * W_FNFAL_ACOG_AssaultRifle 
 *******************************************************************************/
class W_FNFAL_ACOG_AssaultRifle extends FNFAL_ACOG_AssaultRifle
    config(User);

defaultproperties
{
    FireModeClass=class'W_FNFALFire'
    PickupClass=class'W_FNFAL_ACOG_Pickup'
}