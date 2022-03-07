class W_NeonSCARMK17AssaultRifle extends W_SCARMK17AssaultRifle
    config(User);

// defaultproperties
// {
//     FireModeClass=class'W_NeonSCARMK17Fire'
//     PickupClass=class'W_NeonSCARMK17Pickup'
// }


defaultproperties
{
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_NeonScar'
    SkinRefs(0)="KF_Weapons_Neon_Trip_T.1stPerson.Scar_Neon_SHDR"
	SkinRefs(1)="KF_Weapons2_Trip_T.Special.Aimpoint_sight_shdr"
	HudImageRef="KillingFloor2HUD.WeaponSelect.NeonScar_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.NeonScar"
    FireModeClass(0)=Class'CsHDMut.W_NeonSCARMK17Fire'
    Description="Neon SCAR"
    PickupClass=Class'CsHDMut.W_NeonSCARMK17Pickup'
    AttachmentClass=Class'KFMod.NeonSCARMK17Attachment'
    ItemName="Neon SCAR"
	}