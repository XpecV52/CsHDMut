class CsHDMonstersCollection extends KFMonstersCollection
    config;

defaultproperties
{
	MonsterClasses(0)=(MClassName="CsHDMut.ZED_Clot",MID="A")
	MonsterClasses(1)=(MClassName="CsHDMut.ZED_Crawler",MID="B")
	MonsterClasses(2)=(MClassName="CsHDMut.ZED_Gorefast",MID="C")
	MonsterClasses(3)=(MClassName="CsHDMut.ZED_Stalker",MID="D")
	MonsterClasses(4)=(MClassName="CsHDMut.ZED_Scrake",MID="E")
	MonsterClasses(5)=(MClassName="CsHDMut.ZED_Fleshpound",MID="F")
	MonsterClasses(6)=(MClassName="CsHDMut.ZED_Bloat",MID="G")
	MonsterClasses(7)=(MClassName="CsHDMut.ZED_Siren",MID="H")
	MonsterClasses(8)=(MClassName="CsHDMut.ZED_Husk",MID="I")

	StandardMonsterClasses(0)=(MClassName="CsHDMut.ZED_Clot",MID="A")
	StandardMonsterClasses(1)=(MClassName="CsHDMut.ZED_Crawler",MID="B")
	StandardMonsterClasses(2)=(MClassName="CsHDMut.ZED_Gorefast",MID="C")
	StandardMonsterClasses(3)=(MClassName="CsHDMut.ZED_Stalker",MID="D")
	StandardMonsterClasses(4)=(MClassName="CsHDMut.ZED_Scrake",MID="E")
	StandardMonsterClasses(5)=(MClassName="CsHDMut.ZED_Fleshpound",MID="F")
	StandardMonsterClasses(6)=(MClassName="CsHDMut.ZED_Bloat",MID="G")
	StandardMonsterClasses(7)=(MClassName="CsHDMut.ZED_Siren",MID="H")
	StandardMonsterClasses(8)=(MClassName="CsHDMut.ZED_Husk",MID="I")


    FinalSquads(0)=(ZedClass=("CsHDMut.ZED_Clot"),NumZeds=(4))
    FinalSquads(1)=(ZedClass=("CsHDMut.ZED_Clot","CsHDMut.ZED_Crawler"),NumZeds=(3,3))
    FinalSquads(2)=(ZedClass=("CsHDMut.ZED_Clot","CsHDMut.ZED_Stalker","CsHDMut.ZED_Crawler"),NumZeds=(3,3,3))

	ShortSpecialSquads(2)=(ZedClass=("CsHDMut.ZED_Crawler","CsHDMut.ZED_Gorefast","CsHDMut.ZED_Stalker","CsHDMut.ZED_Scrake"),NumZeds=(2,2,1,1))
	ShortSpecialSquads(3)=(ZedClass=("CsHDMut.ZED_Bloat","CsHDMut.ZED_Siren","CsHDMut.ZED_Fleshpound"),NumZeds=(1,2,1))

	NormalSpecialSquads(3)=(ZedClass=("CsHDMut.ZED_Crawler","CsHDMut.ZED_Gorefast","CsHDMut.ZED_Stalker","CsHDMut.ZED_Scrake"),NumZeds=(2,2,1,1))
	NormalSpecialSquads(4)=(ZedClass=("CsHDMut.ZED_Fleshpound"),NumZeds=(1))
	NormalSpecialSquads(5)=(ZedClass=("CsHDMut.ZED_Bloat","CsHDMut.ZED_Siren","CsHDMut.ZED_Fleshpound"),NumZeds=(1,1,1))
	NormalSpecialSquads(6)=(ZedClass=("CsHDMut.ZED_Bloat","CsHDMut.ZED_Siren","CsHDMut.ZED_Fleshpound"),NumZeds=(1,1,2))

	LongSpecialSquads(4)=(ZedClass=("CsHDMut.ZED_Crawler","CsHDMut.ZED_Gorefast","CsHDMut.ZED_Stalker","CsHDMut.ZED_Scrake"),NumZeds=(2,2,1,2))
	LongSpecialSquads(6)=(ZedClass=("CsHDMut.ZED_Fleshpound"),NumZeds=(2))
	LongSpecialSquads(7)=(ZedClass=("CsHDMut.ZED_Bloat","CsHDMut.ZED_Siren","CsHDMut.ZED_Fleshpound"),NumZeds=(2,2,2))
	LongSpecialSquads(8)=(ZedClass=("CsHDMut.ZED_Bloat","CsHDMut.ZED_Siren","CsHDMut.ZED_Scrake","CsHDMut.ZED_Fleshpound"),NumZeds=(2,2,2,2))
    LongSpecialSquads(9)=(ZedClass=("CsHDMut.ZED_Bloat","CsHDMut.ZED_Siren","CsHDMut.ZED_Scrake","CsHDMut.ZED_Fleshpound"),NumZeds=(2,2,2,2))

    FallbackMonsterClass="CsHDMut.ZED_Stalker"
    EndGameBossClass="CsHDMut.ZED_Patriarch"
}
