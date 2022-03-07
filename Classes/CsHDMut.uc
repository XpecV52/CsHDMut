class CsHDMut extends Mutator
    config(HitX);

struct SPickupPair
{
    var class<Pickup> PickupClass;
    var class<Pickup> Replacement;
};

var array<SPickupPair> W_Array;
var array< class<KFVeterancyTypes> > Vet_Array;
var config float AdditionalScale;

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.FriendlyName, "additionalScale", "Additional scale", 0, 1, "Text", "3;0.00:2.00");
}

/* simulated static function String GetItemName( string FullName )
{
    return "FUCK OFF";
} */

static event string GetDescriptionText(string Property)
{
    switch(Property)
    {
        case "additionalScale":
            return "Additional scale of specimen head hitboxes, ranging from the original size to the increased size of the server-side approximation.";
    
        default:
            return super(Info).GetDescriptionText(Property);
    }
}

simulated function PostBeginPlay()
{
    local KFGameType GT;
    local class<CsHDMonstersCollection> MColl;
    local byte i;
    local int index;

    super(Actor).PostBeginPlay();
    if(Role == ROLE_Authority)
    {
        GT = KFGameType(Level.Game);
        if(GT != none)
        {
            MColl = class'CsHDMonstersCollection';
            GT.MonsterCollection = MColl;
            if(!ClassIsChildOf(GT.PlayerControllerClass, class'CsHDPlayerController'))
            {
                GT.PlayerControllerClass = class'CsHDPlayerController';
                GT.PlayerControllerClassName = string(class'CsHDPlayerController');
            }
        }
    }
    SetTimer(0.1, false);
}

function BroadcastMessage(string Msg)
{
  local Controller P;
  local PlayerController Player;

  for ( P = Level.ControllerList; P != none; P = P.nextController ) 
  {
    Player = PlayerController(P);
    if ( Player != none ) 
    {
       Player.ClientMessage(Msg);
      }
  }
}

simulated function Timer()
{
    local KFGameType KF;
	local int i,j;

    super(Actor).Timer();
    ModifyLevelRules();

    KF = KFGameType(Level.Game);
	if ( KF!=None )
	{
		for( i=0; i<KF.InitSquads.Length; i++ )
		{
			for( j=0; j<KF.InitSquads[i].MSquad.Length; j++ )
				KF.InitSquads[i].MSquad[j] = GetReplaceClass(KF.InitSquads[i].MSquad[j]);
		}
		for( i=0; i<KF.MonsterCollection.default.SpecialSquads.Length; i++ )
		{
			for( j=0; j<KF.MonsterCollection.default.SpecialSquads[i].ZedClass.Length; j++ )
				ReplaceMonsterStr(KF.MonsterCollection.default.SpecialSquads[i].ZedClass[j]);
		}
		for( i=0; i<KF.MonsterCollection.default.FinalSquads.Length; i++ )
		{
			for( j=0; j<KF.MonsterCollection.default.FinalSquads[i].ZedClass.Length; j++ )
            {
				ReplaceMonsterStr(KF.MonsterCollection.default.FinalSquads[i].ZedClass[j]);
            }
		}
		KF.FallbackMonster = class'CsHDMut.ZED_Stalker';
		KF.MonsterCollection.default.EndGameBossClass = string(Class'ZED_Patriarch');
	}
}

final function Class<KFMonster> GetReplaceClass( Class<KFMonster> MC )
{
    if(ClassIsChildOf(MC,Class'ZombieClot'))
        return Class'ZED_Clot';
    else if(ClassIsChildOf(MC,Class'ZombieCrawler'))
        return Class'ZED_Crawler';
    else if(ClassIsChildOf(MC,Class'ZombieStalker'))
        return Class'ZED_Stalker';
    else if(ClassIsChildOf(MC,Class'ZombieGorefast'))
        return Class'ZED_Gorefast';
    else if(ClassIsChildOf(MC,Class'ZombieBloat'))
        return Class'ZED_Bloat';
    else if(ClassIsChildOf(MC,Class'ZombieHusk'))
        return Class'ZED_Husk';
    else if(ClassIsChildOf(MC,Class'ZombieSiren'))
        return Class'ZED_Siren';
    else if(ClassIsChildOf(MC,Class'ZombieScrake'))
        return Class'ZED_Scrake';
    else if(ClassIsChildOf(MC,Class'ZombieFleshPound'))
        return Class'ZED_Fleshpound';
    else if(ClassIsChildOf(MC,Class'ZombieBoss'))
        return Class'ZED_Patriarch';
}
final function ReplaceMonsterStr( out string MC )
{
	if( MC~="KFChar.ZombieClot"
    || MC~="KFChar.ZombieClot_STANDARD"
    || MC~="KFChar.ZombieClot.CIRCUS"
    || MC~="KFChar.ZombieClot_HALLOWEEN"
    || MC~="KFChar.ZombieClot_XMas")
		MC = "CsHDMut.ZED_Clot";
	else if( MC~="KFChar.ZombieBloat"
    || MC~="KFChar.ZombieBloat_STANDARD"
    || MC~="KFChar.ZombieBloat_CIRCUS"
    || MC~="KFChar.ZombieBloat_HALLOWEEN"
    || MC~="KFChar.ZombieBloat_XMas")
		MC = "CsHDMut.ZED_Bloat";
	else if( MC~="KFChar.ZombieCrawler" 
    || MC~="KFChar.ZombieCrawler_STANDARD"
    || MC~="KFChar.ZombieCrawler_CIRCUS"
    || MC~="KFChar.ZombieCrawler_HALLOWEEN"
    || MC~="KFChar.ZombieCrawler_XMas")
		MC = "CsHDMut.ZED_Crawler";
	else if( MC~="KFChar.ZombieStalker" 
    || MC~="KFChar.ZombieStalker_STANDARD"
    || MC~="KFChar.ZombieStalker_CIRCUS"
    || MC~="KFChar.ZombieStalker_HALLOWEEN"
    || MC~="KFChar.ZombieStalker_XMas")
		MC = "CsHDMut.ZED_Stalker";
	else if( MC~="KFChar.ZombieSiren" 
    || MC~="KFChar.ZombieSiren_STANDARD"
    || MC~="KFChar.ZombieSiren_CIRCUS"
    || MC~="KFChar.ZombieSiren_HALLOWEEN"
    || MC~="KFChar.ZombieSiren_XMas")
		MC = "CsHDMut.ZED_Siren";
    else if( MC~="KFChar.ZombieHusk" 
    || MC~="KFChar.ZombieHusk_STANDARD"
    || MC~="KFChar.ZombieHusk_CIRCUS"
    || MC~="KFChar.ZombieHusk_HALLOWEEN"
    || MC~="KFChar.ZombieHusk_XMas")
		MC = "CsHDMut.ZED_Husk";
	else if( MC~="KFChar.ZombieScrake" 
    || MC~="KFChar.ZombieScrake_STANDARD"
    || MC~="KFChar.ZombieScrake_CIRCUS"
    || MC~="KFChar.ZombieScrake_HALLOWEEN"
    || MC~="KFChar.ZombieScrake_XMas")
		MC = "CsHDMut.ZED_Scrake";
	else if( MC~="KFChar.ZombieFleshPound" 
    || MC~="KFChar.ZombieFleshPound_STANDARD"
    || MC~="KFChar.ZombieFleshPound_CIRCUS"
    || MC~="KFChar.ZombieFleshPound_HALLOWEEN"
    || MC~="KFChar.ZombieFleshPound_XMas")
		MC = "CsHDMut.ZED_Fleshpound";
	else if( MC~="KFChar.ZombieGorefast" 
    || MC~="KFChar.ZombieGorefast_STANDARD"
    || MC~="KFChar.ZombieGorefast_CIRCUS"
    || MC~="KFChar.ZombieGorefast_HALLOWEEN"
    || MC~="KFChar.ZombieGorefast_XMas")
		MC = "CsHDMut.ZED_Gorefast";
	else if( MC~="KFChar.ZombieBoss" 
    || MC~="KFChar.ZombieBoss_STANDARD"
    || MC~="KFChar.ZombieBoss_CIRCUS"
    || MC~="KFChar.ZombieBoss_HALLOWEEN"
    || MC~="KFChar.ZombieBoss_XMas")
		MC = "CsHDMut.ZED_Patriarch";
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
    local byte i;

    if((KFWeaponPickup(Other) != none) && Left(string(Other.Class), 6) ~= "KFMod.")
    {
        for(i = 0; i < default.W_Array.Length ; i++)
        {
            if(default.W_Array[i].PickupClass == Other.Class)
            {
                ReplaceWith(Other, string(default.W_Array[i].Replacement));
                return false;
            }
        }
    }
    else
    {
        if(Other.Class == class'KFRandomItemSpawn')
        {
            ReplaceWith(Other, "CsHDMut.CsHDRandomItemSpawn");
            return false;
        }
        else
        {
            if(Other.Class == class'CsHDReplicationInfo')
            {
                CsHDReplicationInfo(Other).AdditionalScale = AdditionalScale;
            }
        }
    }
    return true;
}

static function class<KFVeterancyTypes> GetVetReplacement(class<KFVeterancyTypes> VetSkill)
{
    local byte i;

    for(i = 0;i < default.Vet_Array.Length ; i++)
    {
        if(ClassIsChildOf(default.Vet_Array[i], VetSkill))
        {
            return default.Vet_Array[i];
        }
    }
    return VetSkill;
}

static function class<Pickup> GetPickupReplacement(class<Pickup> PickupClass)
{
    local byte i;

    if(PickupClass != none)
    {
        if(PickupClass==class'GoldenDeaglePickup'
        ||PickupClass==class'GoldenDeaglePickup'
        ||PickupClass==class'GoldenAK47pickup'
        ||PickupClass==class'NeonAK47Pickup'
        ||PickupClass==class'NeonKrissMPickup'
        ||PickupClass==class'NeonSCARMK17Pickup'
        ||PickupClass==class'CamoM4Pickup'
        ||PickupClass==class'CamoMP5MPickup'
        )
            return none;
        for(i = 0;i < default.W_Array.Length;i++)
        {
            if(default.W_Array[i].PickupClass == PickupClass)
            {
                return default.W_Array[i].Replacement;
            }
        }
    }
    return PickupClass;
}

static function ModifyPickupArray(out array< class<Pickup> > PickupArray)
{
    local byte i;

    for(i = 0;i < PickupArray.Length;i++)
    {
        if(PickupArray[i] != none)
        {
            PickupArray[i] = GetPickupReplacement(PickupArray[i]);
        }
    }
}

simulated function ModifyLevelRules()
{
    local KFLevelRules LR;

    foreach DynamicActors(class'KFLevelRules', LR)
    {
        if(LR != none)
        {
            ModifyPickupArray(LR.MediItemForSale);
            ModifyPickupArray(LR.SuppItemForSale);
            ModifyPickupArray(LR.ShrpItemForSale);
            ModifyPickupArray(LR.CommItemForSale);
            ModifyPickupArray(LR.BersItemForSale);
            ModifyPickupArray(LR.FireItemForSale);
            ModifyPickupArray(LR.DemoItemForSale);
            ModifyPickupArray(LR.NeutItemForSale);
        }        
    }    
}

static function bool IsSingleHandgun(class<Inventory> Inv)
{
    if(((((class<Single>(Inv) != none) || class<Deagle>(Inv) != none) || class<MK23Pistol>(Inv) != none) || class<Magnum44Pistol>(Inv) != none) || class<FlareRevolver>(Inv) != none)
    {
        return true;
    }
    return false;
}

static function bool IsDualHandguns(class<Inventory> Inv)
{
    if(class<Dualies>(Inv) != none)
    {
        return true;
    }
    return false;
}

static function class<KFWeapon> SingleVariantOf(class<Inventory> Inv)
{
    if(Inv == class'W_Dualies')
    {
        return class'W_Single';
    }
    else
    {
        if(Inv == class'W_DualDeagle')
        {
            return class'W_Deagle';
        }
        else
        {
            if(Inv == class'W_GoldenDualDeagle')
            {
                return class'W_GoldenDeagle';
            }
            else
            {
                if(Inv == class'W_DualMK23Pistol')
                {
                    return class'W_MK23Pistol';
                }
                else
                {
                    if(Inv == class'W_Dual44Magnum')
                    {
                        return class'W_Magnum44Pistol';
                    }
                    else
                    {
                        if(Inv == class'DualFlareRevolver')
                        {
                            return class'FlareRevolver';
                        }
                    }
                }
            }
        }
    }
    return none;
}

static function class<KFWeapon> DualVariantOf(class<Inventory> Inv)
{
    if(Inv == class'W_Single')
    {
        return class'W_Dualies';
    }
    else
    {
        if(Inv == class'W_Deagle')
        {
            return class'W_DualDeagle';
        }
        else
        {
            if(Inv == class'W_GoldenDeagle')
            {
                return class'W_GoldenDualDeagle';
            }
            else
            {
                if(Inv == class'W_MK23Pistol')
                {
                    return class'W_DualMK23Pistol';
                }
                else
                {
                    if(Inv == class'W_Magnum44Pistol')
                    {
                        return class'W_Dual44Magnum';
                    }
                    else
                    {
                        if(Inv == class'FlareRevolver')
                        {
                            return class'DualFlareRevolver';
                        }
                    }
                }
            }
        }
    }
    return none;
}

static function class<KFWeaponPickup> SinglePickupOf(class<KFWeaponPickup> WP)
{
    if(WP == class'W_DualiesPickup')
    {
        return class'W_SinglePickup';
    }
    else
    {
        if(WP == class'W_DualDeaglePickup')
        {
            return class'W_DeaglePickup';
        }
        else
        {
            if(WP == class'W_GoldenDualDeaglePickup')
            {
                return class'W_GoldenDeaglePickup';
            }
            else
            {
                if(WP == class'W_DualMK23Pickup')
                {
                    return class'W_MK23Pickup';
                }
                else
                {
                    if(WP == class'W_Dual44MagnumPickup')
                    {
                        return class'W_Magnum44Pickup';
                    }
                    else
                    {
                        if(WP == class'DualFlareRevolverPickup')
                        {
                            return class'FlareRevolverPickup';
                        }
                    }
                }
            }
        }
    }
    return none;
}

static function class<KFWeaponPickup> DualPickupOf(class<KFWeaponPickup> Sp)
{
    if(Sp == class'W_SinglePickup')
    {
        return class'W_DualiesPickup';
    }
    else
    {
        if(Sp == class'W_DeaglePickup')
        {
            return class'W_DualDeaglePickup';
        }
        else
        {
            if(Sp == class'W_GoldenDeaglePickup')
            {
                return class'W_GoldenDualDeaglePickup';
            }
            else
            {
                if(Sp == class'W_MK23Pickup')
                {
                    return class'W_DualMK23Pickup';
                }
                else
                {
                    if(Sp == class'W_Magnum44Pickup')
                    {
                        return class'W_Dual44MagnumPickup';
                    }
                    else
                    {
                        if(Sp == class'FlareRevolverPickup')
                        {
                            return class'DualFlareRevolverPickup';
                        }
                    }
                }
            }
        }
    }
    return none;
}

defaultproperties
{
    W_Array(0)=(PickupClass=Class'KFMod.MP7MPickup',Replacement=class'W_MP7MPickup')
    W_Array(1)=(PickupClass=Class'KFMod.MP5MPickup',Replacement=class'W_MP5MPickup')
    W_Array(2)=(PickupClass=Class'KFMod.CamoMP5MPickup',Replacement=class'W_CamoMP5MPickup')
    W_Array(3)=(PickupClass=Class'KFMod.KrissMPickup',Replacement=class'W_KrissMPickup')
    W_Array(4)=(PickupClass=Class'KFMod.NeonKrissMPickup',Replacement=class'W_NeonKrissMPickup')
    W_Array(5)=(PickupClass=Class'KFMod.M7A3MPickup',Replacement=class'W_M7A3MPickup')
    W_Array(6)=(PickupClass=Class'KFMod.SinglePickup',Replacement=class'W_SinglePickup')
    W_Array(7)=(PickupClass=Class'KFMod.DualiesPickup',Replacement=class'W_DualiesPickup')
    W_Array(8)=(PickupClass=Class'KFMod.Magnum44Pickup',Replacement=class'W_Magnum44Pickup')
    W_Array(9)=(PickupClass=Class'KFMod.Dual44MagnumPickup',Replacement=class'W_Dual44MagnumPickup')
    W_Array(10)=(PickupClass=Class'KFMod.MK23Pickup',Replacement=class'W_MK23Pickup')
    W_Array(11)=(PickupClass=Class'KFMod.DualMK23Pickup',Replacement=class'W_DualMK23Pickup')
    W_Array(12)=(PickupClass=Class'KFMod.DeaglePickup',Replacement=class'W_DeaglePickup')
    W_Array(13)=(PickupClass=Class'KFMod.DualDeaglePickup',Replacement=class'W_DualDeaglePickup')
    W_Array(14)=(PickupClass=Class'KFMod.GoldenDeaglePickup',Replacement=class'W_GoldenDeaglePickup')
    W_Array(15)=(PickupClass=Class'KFMod.GoldenDualDeaglePickup',Replacement=class'W_GoldenDualDeaglePickup')
    W_Array(16)=(PickupClass=Class'KFMod.WinchesterPickup',Replacement=class'W_WinchesterPickup')
    W_Array(17)=(PickupClass=Class'KFMod.SPSniperPickup',Replacement=class'W_SPSniperPickup')
    W_Array(18)=(PickupClass=Class'KFMod.M14EBRPickup',Replacement=class'W_M14EBRPickup')
    W_Array(19)=(PickupClass=Class'KFMod.CrossbowPickup',Replacement=class'W_XBowPickup')
    W_Array(20)=(PickupClass=Class'KFMod.M99Pickup',Replacement=class'W_M99AMRPickup')
    W_Array(21)=(PickupClass=Class'KFMod.ThompsonPickup',Replacement=class'W_ThompsonPickup')
    W_Array(22)=(PickupClass=Class'KFMod.SPThompsonPickup',Replacement=class'W_SPThompsonPickup')
    W_Array(23)=(PickupClass=Class'KFMod.ThompsonDrumPickup',Replacement=class'W_ThompsonDrumPickup')
    W_Array(24)=(PickupClass=Class'KFMod.BullpupPickup',Replacement=class'W_BullpupPickup')
    W_Array(25)=(PickupClass=Class'KFMod.AK47Pickup',Replacement=class'W_AK47Pickup')
    W_Array(26)=(PickupClass=Class'KFMod.GoldenAK47pickup',Replacement=class'W_GoldenAK47Pickup')
    W_Array(27)=(PickupClass=Class'KFMod.NeonAK47pickup',Replacement=class'W_NeonAK47Pickup')
    W_Array(28)=(PickupClass=Class'KFMod.M4Pickup',Replacement=class'W_M4Pickup')
    W_Array(29)=(PickupClass=Class'KFMod.CamoM4Pickup',Replacement=class'W_CamoM4Pickup')
    W_Array(30)=(PickupClass=Class'KFMod.MKb42Pickup',Replacement=class'W_MKB42Pickup')
    W_Array(31)=(PickupClass=Class'KFMod.SCARMK17Pickup',Replacement=class'W_SCARMK17Pickup')
    W_Array(32)=(PickupClass=Class'KFMod.NeonSCARMK17Pickup',Replacement=class'W_NeonSCARMK17Pickup')
    W_Array(33)=(PickupClass=Class'KFMod.FNFAL_ACOG_Pickup',Replacement=class'W_FNFAL_ACOG_Pickup')
    W_Array(34)=(PickupClass=Class'KFMod.MAC10Pickup',Replacement=class'W_MAC10Pickup')
    W_Array(35)=(PickupClass=Class'KFMod.M4203Pickup',Replacement=class'W_M4203Pickup')
    //W_Array(29)=(PickupClass=Class'KFMod.GoldenDeaglePickup',Replacement=class'W_GoldenDeaglePickup')
    //W_Array(30)=(PickupClass=Class'KFMod.GoldenDualDeaglePickup',Replacement=class'W_GoldenDualDeaglePickup')
    Vet_Array(0)=class'Vet_FieldMedic'
    Vet_Array(1)=class'Vet_SupportSpec'
    Vet_Array(2)=class'Vet_Sharpshooter'
    Vet_Array(3)=class'Vet_Commando'
    Vet_Array(4)=class'Vet_Berserker'
    Vet_Array(5)=class'Vet_Firebug'
    Vet_Array(6)=class'Vet_Demolitions'
    bAddToServerPackages=true
    GroupName="KFCX"
    FriendlyName="KFCX"
    Description="CLIENTSIDE HITBOX"
    bAlwaysRelevant=true
    RemoteRole=ROLE_SimulatedProxy
}