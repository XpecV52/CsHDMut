class W_NeonKrissMPickup extends W_KrissMPickup
    config;

defaultproperties
{
    Skins(0)=Shader'KF_Weapons_Neon_Trip_T.3rdPerson.Kriss_Neon_SHDR_3P'
    ItemName="Neon Schneidzekk Medic Gun"
	Description="Neon Schneidzekk Medic Gun"
	ItemShortName="Neon Schneidzekk"

	InventoryType=class'W_NeonKrissMMedicGun'
	PickupMessage="You got the Neon Schneidzekk Medic Gun"
	PickupForce="AssaultRiflePickup"
	PickupSound=Sound'KF_KrissSND.KF_WEP_KRISS_Handling_Pickup'
}
