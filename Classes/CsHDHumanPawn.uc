class CsHDHumanPawn extends KFHumanPawn
    config(User);

simulated function PostBeginPlay()
{
    super(KFPawn).PostBeginPlay();
    if(Role < ROLE_Authority)
    {
        if(AuxCollisionCylinder == none)
        {
            AuxCollisionCylinder = Spawn(class'KFBulletWhipAttachment', self);
            AuxCollisionCylinder.bHardAttach = true;
            AuxCollisionCylinder.SetLocation(Location);
            AuxCollisionCylinder.SetPhysics(PHYS_None);
            AuxCollisionCylinder.SetBase(self);
        }
        SavedAuxCollision = AuxCollisionCylinder.bCollideActors;
    }
}

function ServerBuyWeapon( Class<Weapon> WClass, float ItemWeight )
{
    local Inventory I, J;
    local float Price;
    local bool bIsDualWeapon, bHasDual9mms, bHasDualHCs, bHasDualRevolvers;

    if ( !CanBuyNow() || Class<KFWeapon>(WClass) == none || Class<KFWeaponPickup>(WClass.Default.PickupClass) == none )
    {
        return;
    }

    if ( Class<KFWeapon>(WClass).Default.AppID > 0 && Class<KFWeapon>(WClass).Default.UnlockedByAchievement != -1 )
    {

        if ( KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements) == none ||
            (!KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).PlayerOwnsWeaponDLC(Class<KFWeapon>(WClass).Default.AppID) &&
             KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).Achievements[Class<KFWeapon>(WClass).Default.UnlockedByAchievement].bCompleted != 1 ))
        {
            return;
        }

    }
    else if ( Class<KFWeapon>(WClass).Default.AppID > 0 )
    {
        if ( KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements) == none ||
            !KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).PlayerOwnsWeaponDLC(Class<KFWeapon>(WClass).Default.AppID))
        {
            return;
        }
    }
    else if ( Class<KFWeapon>(WClass).Default.UnlockedByAchievement != -1  )
    {
        if ( KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements) == none ||
             KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).Achievements[Class<KFWeapon>(WClass).Default.UnlockedByAchievement].bCompleted != 1 )
        {
            return;
        }
    }

    Price = class<KFWeaponPickup>(WClass.Default.PickupClass).Default.Cost;

    if ( KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill != none )
    {
        Price *= KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill.static.GetCostScaling(KFPlayerReplicationInfo(PlayerReplicationInfo), WClass.Default.PickupClass);
    }

    for ( I=Inventory; I!=None; I=I.Inventory )
    {
        if( I.Class==WClass )
        {
            Return; // Already has weapon.
        }

        if ( I.Class == class'W_Dualies' )
        {
            bHasDual9mms = true;
        }
        else if ( I.Class == class'W_DualDeagle' || I.Class == class'W_GoldenDualDeagle' )
        {
            bHasDualHCs = true;
        }
        else if ( I.Class == class'W_Dual44Magnum' )
        {
            bHasDualRevolvers = true;
        }
    }

    if ( WClass == class'W_DualDeagle' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'W_Deagle' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
        bHasDualHCs = true;
    }

    if ( WClass == class'W_GoldenDualDeagle' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'W_GoldenDeagle' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
        bHasDualHCs = true;
    }

    if ( WClass == class'W_Dual44Magnum' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'W_Magnum44Pistol' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
        bHasDualRevolvers = true;
    }

    if ( WClass == class'W_DualMK23Pistol' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'W_MK23Pistol' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
    }

    if ( WClass == class'DualFlareRevolver' )
    {
        for ( J = Inventory; J != None; J = J.Inventory )
        {
            if ( J.class == class'FlareRevolver' )
            {
                Price = Price / 2;
                break;
            }
        }

        bIsDualWeapon = true;
    }

    bIsDualWeapon = bIsDualWeapon || WClass == class'W_Dualies';

    if ( !CanCarry(ItemWeight) )
    {
        Return;
    }

    if ( PlayerReplicationInfo.Score < Price )
    {
        Return; // Not enough CASH.
    }

    I = Spawn(WClass);

    if ( I != none )
    {
        if ( KFGameType(Level.Game) != none )
        {
            KFGameType(Level.Game).WeaponSpawned(I);
        }

        KFWeapon(I).UpdateMagCapacity(PlayerReplicationInfo);
        KFWeapon(I).FillToInitialAmmo();
        KFWeapon(I).SellValue = Price * 0.75;
        I.GiveTo(self);
        PlayerReplicationInfo.Score -= Price;

        if ( bIsDualWeapon )
        {
            KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).OnDualsAddedToInventory(bHasDual9mms, bHasDualHCs, bHasDualRevolvers);
        }

        ClientForceChangeWeapon(I);
    }

    SetTraderUpdate();
}

function ServerSellWeapon(class<Weapon> WClass)
{
    local Inventory Inv;
    local KFWeapon NewSingle;
    local float Price;

    if((!CanBuyNow() || class<KFWeapon>(WClass) == none) || class<KFWeaponPickup>(WClass.default.PickupClass) == none)
    {
        SetTraderUpdate();
        return;
    }
    for(Inv = Inventory;Inv != none;Inv = Inv.Inventory)
    {
        if(Inv.Class == WClass)
        {
            if((KFWeapon(Inv) != none) && KFWeapon(Inv).SellValue != -1)
            {
                Price = float(KFWeapon(Inv).SellValue);
            }
            else
            {
                Price = float(int(float(class<KFWeaponPickup>(WClass.default.PickupClass).default.cost) * 0.750));
                if(KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill != none)
                {
                    Price *= KFPlayerReplicationInfo(PlayerReplicationInfo).ClientVeteranSkill.static.GetCostScaling(KFPlayerReplicationInfo(PlayerReplicationInfo), WClass.default.PickupClass);
                }
            }
            if(class'CsHDMut'.static.IsDualHandguns(Inv.Class))
            {
                NewSingle = Spawn(class'CsHDMut'.static.SingleVariantOf(Inv.Class));
                NewSingle.GiveTo(self);
                Price /= float(2);
                NewSingle.SellValue = int(Price);
            }
            if((Inv == Weapon) || Inv == PendingWeapon)
            {
                ClientCurrentWeaponSold();
            }
            PlayerReplicationInfo.Score += Price;
            Inv.Destroyed();
            Inv.Destroy();
            SetTraderUpdate();
            if(KFGameType(Level.Game) != none)
            {
                KFGameType(Level.Game).WeaponDestroyed(WClass);
            }
            return;
        }
    }
}

function GiveWeapon(string aClassName )
{
    local class<Weapon> WeaponClass;
    local Inventory I;
    local Weapon NewWeapon;
    local bool bHasDual9mms, bHasDualHCs, bHasDualRevolvers;

    WeaponClass = class<Weapon>(DynamicLoadObject(aClassName, class'Class'));

    for ( I = Inventory; I != none; I = I.Inventory )
    {
        if( I.Class == WeaponClass )
        {
            Return; // Already has weapon.
        }

        if ( I.Class == class'W_Dualies' )
        {
            bHasDual9mms = true;
        }
        else if ( I.Class == class'W_DualDeagle' || I.Class == class'W_GoldenDualDeagle' )
        {
            bHasDualHCs = true;
        }
        else if ( I.Class == class'W_Dual44Magnum' )
        {
            bHasDualRevolvers = true;
        }
    }

    newWeapon = Spawn(WeaponClass);
    if ( newWeapon != none )
    {
        newWeapon.GiveTo(self);

        if ( WeaponClass == class'W_Dualies' || WeaponClass == class'W_DualDeagle' || WeaponClass == class'W_GoldenDualDeagle' || WeaponClass == class'W_Dual44Magnum' )
        {
            KFSteamStatsAndAchievements(PlayerReplicationInfo.SteamStatsAndAchievements).OnDualsAddedToInventory(bHasDual9mms, bHasDualHCs, bHasDualRevolvers);
        }

        if ( KFGameType(Level.Game) != none )
        {
            KFGameType(Level.Game).WeaponSpawned(newWeapon);
        }
    }
}

defaultproperties
{
    RequiredEquipment[1]="CsHDMut.W_Single"
}