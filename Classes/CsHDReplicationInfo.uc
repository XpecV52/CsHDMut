class CsHDReplicationInfo extends ReplicationInfo;

var float AdditionalScale;

replication
{
    reliable if(bNetInitial && Role == ROLE_Authority)
        AdditionalScale;

    reliable if(Role < ROLE_Authority)
        ServerDamagePawn, ServerDealDamage, 
        ServerHealTarget, ServerUpdateHit;
}

simulated function ServerDamagePawn(KFPawn injured, int Damage, Pawn instigatedBy, Vector HitLocDiff, Vector Momentum, class<DamageType> DamageType, array<int> PointsHit)
{
    if(injured == none)
    {
        return;
    }
    injured.ProcessLocationalDamage(Damage, instigatedBy, injured.Location + HitLocDiff, Momentum, DamageType, PointsHit);
  
}

simulated function bool IsHeadshotClient(Actor Other, Vector HitLoc, Vector ray)
{
    if(KFMonster(Other) != none)
    {
        if(ZED_Clot(Other) != none)
        {
            return ZED_Clot(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
        }
        else
        {
            if(ZED_Gorefast(Other) != none)
            {
                return ZED_Gorefast(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
            }
            else
            {
                if(ZED_Bloat(Other) != none)
                {
                    return ZED_Bloat(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
                }
                else
                {
                    if(ZED_Crawler(Other) != none)
                    {
                        return ZED_Crawler(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
                    }
                    else
                    {
                        if(ZED_Stalker(Other) != none)
                        {
                            return ZED_Stalker(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
                        }
                        else
                        {
                            if(ZED_Siren(Other) != none)
                            {
                                return ZED_Siren(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
                            }
                            else
                            {
                                if(ZED_Husk(Other) != none)
                                {
                                    return ZED_Husk(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
                                }
                                else
                                {
                                    if(ZED_Scrake(Other) != none)
                                    {
                                        return ZED_Scrake(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
                                    }
                                    else
                                    {
                                        if(ZED_Fleshpound(Other) != none)
                                        {
                                            return ZED_Fleshpound(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
                                        }
                                        else
                                        {
                                            if(ZED_Patriarch(Other) != none)
                                            {
                                                return ZED_Patriarch(Other).IsHeadshotClient(HitLoc, ray, AdditionalScale);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return false;
}

simulated function ServerDealDamage(Actor Other, int Damage, Pawn instigatedBy, Vector HitLocDiff, Vector Momentum, class<DamageType> DamageType, optional bool bIsHeadshot)
{
    if(Other == none)
    {
        return;
    }
    if(KFMonster(Other) != none)
    {
        if(ZED_Clot(Other) != none)
        {
            ZED_Clot(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
        }
        else
        {
            if(ZED_Gorefast(Other) != none)
            {
                ZED_Gorefast(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
            }
            else
            {
                if(ZED_Bloat(Other) != none)
                {
                    ZED_Bloat(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
                }
                else
                {
                    if(ZED_Crawler(Other) != none)
                    {
                        ZED_Crawler(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
                    }
                    else
                    {
                        if(ZED_Stalker(Other) != none)
                        {
                            ZED_Stalker(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
                        }
                        else
                        {
                            if(ZED_Siren(Other) != none)
                            {
                                ZED_Siren(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
                            }
                            else
                            {
                                if(ZED_Husk(Other) != none)
                                {
                                    ZED_Husk(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
                                }
                                else
                                {
                                    if(ZED_Scrake(Other) != none)
                                    {
                                        ZED_Scrake(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
                                    }
                                    else
                                    {
                                        if(ZED_Fleshpound(Other) != none)
                                        {
                                            ZED_Fleshpound(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
                                        }
                                        else
                                        {
                                            if(ZED_Patriarch(Other) != none)
                                            {
                                                ZED_Patriarch(Other).TakeDamageClient(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType, bIsHeadshot);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    else
    {
        Other.TakeDamage(Damage, instigatedBy, Other.Location + HitLocDiff, Momentum, DamageType);
    }
}

simulated function ServerUpdateHit(Actor TPActor, Actor HitActor, Vector ClientHitLoc, Vector HitNormal, optional Vector HitLocDiff)
{
    local KFWeaponAttachment WeapAttach;

    WeapAttach = KFWeaponAttachment(TPActor);
    if(WeapAttach != none)
    {
        if(HitLocDiff == vect(0.0, 0.0, 0.0))
        {
            WeapAttach.UpdateHit(HitActor, ClientHitLoc, HitNormal);
        }
        else
        {
            WeapAttach.UpdateHit(HitActor, HitActor.Location + HitLocDiff, HitNormal);
        }
    }
}

simulated function ServerHealTarget(class<HealingProjectile> Dart, Actor Other, Vector HitLocDiff)
{
    local KFPlayerReplicationInfo PRI;
    local KFHumanPawn Healed;
    local float HealSum;
    local int MedicReward;

    Healed = KFHumanPawn(Other);
    if(Healed == none)
    {
        return;
    }
    if((((Controller(Owner) != none) && Healed.Health > 0) && float(Healed.Health) < Healed.HealthMax) && Healed.bCanBeHealed)
    {
        MedicReward = Dart.default.HealBoostAmount;
        PRI = KFPlayerReplicationInfo(Controller(Owner).PlayerReplicationInfo);
        if((PRI != none) && PRI.ClientVeteranSkill != none)
        {
            MedicReward *= PRI.ClientVeteranSkill.static.GetHealPotency(PRI);
        }
        HealSum = float(MedicReward);
        if(((float(Healed.Health) + Healed.healthToGive) + float(MedicReward)) > Healed.HealthMax)
        {
            MedicReward = int(Healed.HealthMax - (float(Healed.Health) + Healed.healthToGive));
            if(MedicReward < 0)
            {
                MedicReward = 0;
            }
        }
        Healed.GiveHealth(int(HealSum), int(Healed.HealthMax));
        if(PRI != none)
        {
            MedicReward = int((FMin(float(MedicReward), Healed.HealthMax) / Healed.HealthMax) * float(60));
            PRI.ReceiveRewardForHealing(MedicReward, Healed);
            if(KFHumanPawn(Controller(Owner).Pawn) != none)
            {
                KFHumanPawn(Controller(Owner).Pawn).AlphaAmount = 255;
            }
            if(KFMedicGun(Controller(Owner).Pawn.Weapon) != none)
            {
                KFMedicGun(Controller(Owner).Pawn.Weapon).ClientSuccessfulHeal(Healed.GetPlayerName());
            }
        }
    }
}
