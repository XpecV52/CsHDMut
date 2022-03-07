/*******************************************************************************
 * W_DualDeagle 
 *******************************************************************************/
class W_DualDeagle extends DualDeagle
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
    Inv = Other.Inventory;
    J0x1B:
    
    if(Inv != none)
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
            
            goto J0xEE;
        }
        Inv = Inv.Inventory;
        J0xEE:
        // [Loop Continue]
        goto J0x1B;
    }
    // End:0x13D
    if((KFWeaponPickup(Item) != none) && Item.bDropped)
    {
        MagAmmoRemaining = Clamp(MagAmmoRemaining + KFWeaponPickup(Item).MagAmmoRemaining, 0, MagCapacity);
    }
    // End:0x160
    else
    {
        MagAmmoRemaining = Clamp(MagAmmoRemaining + SingleClass.default.MagCapacity, 0, MagCapacity);
    }
    super(Weapon).GiveTo(Other, Item);
    // End:0x19F
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

    // End:0x0D
    if(!bCanThrow)
    {
        return;
    }
    AmmoThrown = AmmoAmount(0);
    ClientWeaponThrown();
    M = 0;
    J0x27:
    // End:0x60 [Loop If]
    if(M < 2)
    {
        // End:0x56
        if(FireMode[M].bIsFiring)
        {
            StopFire(M);
        }
        ++ M;
        // [Loop Continue]
        goto J0x27;
    }
    // End:0x76
    if(Instigator != none)
    {
        DetachFromPawn(Instigator);
    }
    C
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
    FireModeClass=class'W_DualDeagleFire'
    PickupClass=class'W_DualDeaglePickup'
}