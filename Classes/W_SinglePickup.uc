/*******************************************************************************
 * W_SinglePickup 
 *******************************************************************************/
class W_SinglePickup extends SinglePickup
    config;

function Inventory SpawnCopy(Pawn Other)
{
    local Inventory Inv;

    Inv = Other.Inventory;
    J0x14:
    
    if(Inv != none)
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
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x14;
    }
    InventoryType = default.InventoryType;
    return super(Pickup).SpawnCopy(Other);
       
}

defaultproperties
{
    InventoryType=class'W_Single'
}