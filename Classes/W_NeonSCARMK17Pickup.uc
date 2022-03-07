/*******************************************************************************
 * W_NeonSCARMK17Pickup 
 *******************************************************************************/
class W_NeonSCARMK17Pickup extends W_SCARMK17Pickup
    config;


defaultproperties
{
    Skins(0)=Shader'KF_Weapons_Neon_Trip_T.3rdPerson.Scar_Neon_SHDR_3P'
    ItemName="Neon SCAR"
	Description="Neon SCAR"
	ItemShortName="Neon SCAR"

	InventoryType=class'W_NeonSCARMK17AssaultRifle'
	PickupMessage="You got the Neon SCAR"
	PickupForce="AssaultRiflePickup"
	PickupSound=Sound'KF_SCARSnd.SCAR_Pickup'
}
