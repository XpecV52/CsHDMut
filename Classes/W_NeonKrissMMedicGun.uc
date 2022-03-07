class W_NeonKrissMMedicGun extends W_KrissMMedicGun
    config;


defaultproperties
{
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_NeonKris'
	SkinRefs(0)="KF_Weapons_Neon_Trip_T.1stPerson.Kriss_Neon_SHDR"
	HudImageRef="KillingFloor2HUD.WeaponSelect.NeonKris_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.NeonKris"
    FireModeClass(0)=Class'CsHDMut.W_NeonKrissMFire'
    Description="Neon KrissM"
    PickupClass=Class'CsHDMut.W_NeonKrissMPickup'
    AttachmentClass=Class'KFMod.NeonKrissMAttachment'
    ItemName="Neon KrissM"
}

// defaultproperties
// {
//     FireModeClass[0]=class'W_KrissMFire'
//     FireModeClass[1]=class'W_KrissMAltFire'
//     PickupClass=class'W_KrissMPickup'
// }