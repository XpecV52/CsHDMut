/*******************************************************************************
 * W_NeonAK47Pickup 
 *******************************************************************************/
class W_NeonAK47Pickup extends W_AK47pickup
    config;
#exec OBJ LOAD FILE=KF_Weapons_Neon_Trip_T.utx


defaultproperties
{
    Skins(0)=Shader'KF_Weapons_Neon_Trip_T.3rdPerson.AK47_Neon_SHDR_3P'
    ItemName="Neon AK47"
    Description="It's a neon AK47."
	ItemShortName="Neon AK47"

	InventoryType=class'W_NeonAK47AssaultRifle'
	PickupMessage="You got the Neon AK47"
	PickupForce="AssaultRiflePickup"
	PickupSound=Sound'KF_AK47Snd.AK47_Pickup'
}
