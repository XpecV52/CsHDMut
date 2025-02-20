/*******************************************************************************
 * W_GoldenDualDeagle 
 *******************************************************************************/
class W_GoldenDualDeagle extends GoldenDualDeagle
    config;

var class<KFWeapon> SingleClass;

simulated function PostBeginPlay()
{
    super(KFWeapon).PostBeginPlay();
    SingleClass = class'CsHDMut'.static.SingleVariantOf(Class);
       
}

function bool HandlePickupQuery(Pickup Item)
{
    
    if(Item.InventoryType == SingleClass)
    {
        
        if((LastHasGunMsgTime < Level.TimeSeconds) && PlayerController(Instigator.Controller) != none)
        {
            LastHasGunMsgTime = Level.TimeSeconds + 0.50;
            PlayerController(Instigator.Controller).ReceiveLocalizedMessage(class'KFMainMessages', 1);
        }
        return true;
    }
    return super(KFWeapon).HandlePickupQuery(Item);
       
}

function GiveTo(Pawn Other, optional Pickup Item)
{
    local Inventory Inv;
    local int OldAmmo;
    local bool bNoPickup;

    MagAmmoRemaining = 0;
    for(Inv = Other.Inventory;Inv != none;Inv = Inv.Inventory)
    {
        
        if(Inv.Class == SingleClass)
        {
            
            if(WeaponPickup(Item) != none)
            {
                WeaponPickup(Item).AmmoAmount[0] += Weapon(Inv).AmmoAmount(0);
            }
            
            else
            {
                OldAmmo = Weapon(Inv).AmmoAmount(0);
                bNoPickup = true;
            }
            MagAmmoRemaining = KFWeapon(Inv).MagAmmoRemaining;
            Inv.Destroyed();
            Inv.Destroy();
            
        }
    }
    if((KFWeaponPickup(Item) != none) && Item.bDropped)
    {
        MagAmmoRemaining = Clamp(MagAmmoRemaining + KFWeaponPickup(Item).MagAmmoRemaining, 0, MagCapacity);
    }
    else
    {
        MagAmmoRemaining = Clamp(MagAmmoRemaining + SingleClass.default.MagCapacity, 0, MagCapacity);
    }
    super(Weapon).GiveTo(Other, Item);
    if(bNoPickup)
    {
        AddAmmo(OldAmmo, 0);
        Clamp(Ammo[0].AmmoAmount, 0, MaxAmmo(0));
    }
       
}

function DropFrom(Vector StartLocation)
{
    local int M;
    local KFWeaponPickup WP;
    local KFWeapon W;
    local int AmmoThrown, OtherAmmo;

    if(!bCanThrow)
    {
        return;
    }
    AmmoThrown = AmmoAmount(0);
    ClientWeaponThrown();
    
    for(M = 0;M < 2;M++)
    {
        if(FireMode[M].bIsFiring)
        {
            StopFire(M);
        }
        
    }
    if(Instigator != none)
    {
        DetachFromPawn(Instigator);
    }
    if(Instigator.Health > 0)
    {
        OtherAmmo = AmmoThrown / 2;
        AmmoThrown -= OtherAmmo;
        W = Spawn(SingleClass);
        W.GiveTo(Instigator);
        W.Ammo[0].AmmoAmount = OtherAmmo;
        W.MagAmmoRemaining = MagAmmoRemaining / 2;
        MagAmmoRemaining = Max(MagAmmoRemaining - W.MagAmmoRemaining, 0);
    }
    WP = KFWeaponPickup(Spawn(SingleClass.default.PickupClass,,, StartLocation));
    
    if(WP != none)
    {
        WP.InitDroppedPickupFor(self);
        WP.Velocity = Velocity;
        WP.AmmoAmount[0] = AmmoThrown;
        WP.MagAmmoRemaining = MagAmmoRemaining;
        
        if(Instigator.Health > 0)
        {
            WP.bThrown = true;
        }
    }
    Destroyed();
    Destroy();
       
}

simulated function bool PutDown()
{
    
    if(Instigator.PendingWeapon.Class == SingleClass)
    {
        bIsReloading = false;
    }
    return super(KFWeapon).PutDown();
       
}

defaultproperties
{
    FireModeClass=class'W_GoldenDualDeagleFire'
    PickupClass=class'W_GoldenDualDeaglePickup'
}