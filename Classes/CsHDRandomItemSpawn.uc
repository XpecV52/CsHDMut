class CsHDRandomItemSpawn extends KFRandomItemSpawn;

simulated function PostBeginPlay()
{
    local byte i;
    for(i = 0;i < 11;i++)
    {
        default.PickupClasses[i] = class'CsHDMut'.static.GetPickupReplacement(default.PickupClasses[i]);
        
        if(class<KFWeaponPickup>(default.PickupClasses[i]) != none)
        {
            default.PickupWeight[i] = int(class<KFWeaponPickup>(default.PickupClasses[i]).default.Weight);
        }
    }
    super.PostBeginPlay();
}

defaultproperties
{
    PickupClasses[1]=Class'CsHDMut.W_BullpupPickup'
    PickupClasses[2]=Class'CsHDMut.W_DeaglePickup'
    PickupClasses[3]=Class'CsHDMut.W_WinchesterPickup'
    PickupClasses[4]=Class'KFMod.Vest'
}