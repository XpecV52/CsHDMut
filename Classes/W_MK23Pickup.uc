/*******************************************************************************
 * W_MK23Pickup 
 *******************************************************************************/
class W_MK23Pickup extends MK23Pickup
    config;

function Inventory SpawnCopy(Pawn Other)
{
    local Inventory Inv;

    
    for(Inv = Other.Inventory;Inv != none;Inv = Inv.Inventory)
    {
        
        if(Inv.Class == InventoryType)
        {
            
            if(Inventory != none)
            {
                Inventory.Destroy();
            }
            InventoryType = class'CsHDMut'.static.DualVariantOf(InventoryType);
            AmmoAmount[0] += KFWeapon(Inv).AmmoAmount(0);
            MagAmmoRemaining += KFWeapon(Inv).MagAmmoRemaining;
            Inv.Destroyed();
            Inv.Destroy();
            return super(Pickup).SpawnCopy(Other);
        }
    }
    InventoryType = default.InventoryType;
    return super(Pickup).SpawnCopy(Other);
       
}

defaultproperties
{
    InventoryType=class'W_MK23Pistol'
}