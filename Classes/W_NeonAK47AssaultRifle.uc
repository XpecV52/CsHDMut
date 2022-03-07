/*******************************************************************************
 * W_GoldenAK47AssaultRifle 
 *******************************************************************************/
class W_NeonAK47AssaultRifle extends W_AK47AssaultRifle
    config(User);

defaultproperties
{
	TraderInfoTexture=texture'KillingFloor2HUD.Trader_Weapon_Icons.Trader_NeonAK47'
	SkinRefs(0)="KF_Weapons_Neon_Trip_T.1stPerson.AK47_Neon_SHDR"
	HudImageRef="KillingFloor2HUD.WeaponSelect.NeonAK47_unselected"
	SelectedHudImageRef="KillingFloor2HUD.WeaponSelect.NeonAK47"
    FireModeClass(0)=Class'W_NeonAK47Fire'
    Description="Neon AK47"
    PickupClass=Class'CsHDMut.W_NeonAK47Pickup'
    AttachmentClass=Class'KFMod.NeonAK47Attachment'
    ItemName="Neon AK47"
}