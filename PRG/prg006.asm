	; This bank is used to store the object sets.
	; See prior to the call "LevelLoad_CopyObjectList.asm" in PRG030

	; NOTE: Any object set that is labelled as an address is unused
	; and can be removed to free up some space...

W503_EndO:	.include "PRG/objects/5-3End.asm"
Empty_ObjLayout:	.include "PRG/objects/Empty.asm"	; Shared Empty object set
GoodEggTestO:	.include "PRG/objects/GoodEgg.asm"
GhostExitO:	.include "PRG/objects/GhostExit.asm"
W101AO:		.include "PRG/objects/1-1A.asm"
W101BO:		.include "PRG/objects/1-1B.asm"
W102AO:		.include "PRG/objects/1-2A.asm"
W102BO:		.include "PRG/objects/1-2B.asm"
W102BAO:	.include "PRG/objects/1-2BonusA.asm"
W102BBO:	.include "PRG/objects/1-2BonusB.asm"
W1F1AO:		.include "PRG/objects/1-F1A.asm"
W1F1BO:		.include "PRG/objects/1-F1B.asm"
W1F2AO:		.include "PRG/objects/1-F2A.asm"
W1F2BO:		.include "PRG/objects/1-F2B.asm"
W1F3AO:		.include "PRG/objects/1-F3A.asm"
W1F3BO:		.include "PRG/objects/1-F3B.asm"
W1F3CO:		.include "PRG/objects/1-F3C.asm"
W103AO:		.include "PRG/objects/1-3A.asm"
W103BO:		.include "PRG/objects/1-3B.asm"
W104AO:		.include "PRG/objects/1-4A.asm"
W104BO:		.include "PRG/objects/1-4B.asm"
W105AO:		.include "PRG/objects/1-5A.asm"
W105BO:		.include "PRG/objects/1-5B.asm"
W106AO:		.include "PRG/objects/1-6A.asm"
W106BO:		.include "PRG/objects/1-6B.asm"
W107AO:		.include "PRG/objects/1-7A.asm"
W108AO:		.include "PRG/objects/1-8A.asm"
W108BO:		.include "PRG/objects/1-8B.asm"
W201AO:		.include "PRG/objects/2-1A.asm"
W201BO:		.include "PRG/objects/2-1B.asm"
W201CO:		.include "PRG/objects/2-1C.asm"
W201DO:		.include "PRG/objects/2-1D.asm"
W202AO:		.include "PRG/objects/2-2A.asm"
W202BO:		.include "PRG/objects/2-2B.asm"
W203AO:		.include "PRG/objects/2-3A.asm"
W203BO:		.include "PRG/objects/2-3B.asm"
W204AO:		.include "PRG/objects/2-4A.asm"
W204BO:		.include "PRG/objects/2-4B.asm"
W205AO:		.include "PRG/objects/2-5A.asm"
W205BO:		.include "PRG/objects/2-5B.asm"
W205CO:		.include "PRG/objects/2-5C.asm"
W2F1AO:		.include "PRG/objects/2-F1A.asm"
W2F1BO:		.include "PRG/objects/2-F1B.asm"
W2F1CO:		.include "PRG/objects/2-F1C.asm"
W2F1DO:		.include "PRG/objects/2-F1D.asm"
W2F1EO:		.include "PRG/objects/2-F1E.asm"
W2F2AO:		.include "PRG/objects/2-F2A.asm"
W2F2BO:		.include "PRG/objects/2-F2B.asm"
W2F2CO:		.include "PRG/objects/2-F2C.asm"
W2F2DO:		.include "PRG/objects/2-F2D.asm"
W2F2EO:		.include "PRG/objects/2-F2E.asm"
W2F2FO:		.include "PRG/objects/2-F2F.asm"
W2F2GO:		.include "PRG/objects/2-F2G.asm"
W2F2HO:		.include "PRG/objects/2-F2H.asm"
W301O:		.include "PRG/objects/3-1.asm"
W1G1AO:		.include "PRG/objects/1-G1A.asm"
W1G1BO:		.include "PRG/objects/1-G1B.asm"
W2G1AO:		.include "PRG/objects/2-G1A.asm"
W2G1BO:		.include "PRG/objects/2-G1B.asm"
W2G1CO:		.include "PRG/objects/2-G1C.asm"
TOADO:		.include "PRG/objects/ToadTyp.asm"
TOAD_SpecO:	.include "PRG/objects/ToadSpec.asm"
BigQBlock1O:	.include "PRG/objects/BigQ1.asm"	; World 1's Big [?] block area (empty)
BigQBlock2O:	.include "PRG/objects/BigQ2.asm"	; World 2's Big [?] block area
BigQBlock3O:	.include "PRG/objects/BigQ3.asm"	; World 3's Big [?] block area
BigQBlock4O:	.include "PRG/objects/BigQ4.asm"	; World 4's Big [?] block area
BigQBlock5O:	.include "PRG/objects/BigQ5.asm"	; World 5's Big [?] block area
BigQBlock6O:	.include "PRG/objects/BigQ6.asm"	; World 6's Big [?] block area
BigQBlock7O:	.include "PRG/objects/BigQ7.asm"	; World 7's Big [?] block area
BigQBlock8O:	.include "PRG/objects/BigQ8.asm"	; World 8's Big [?] block area
WAirship_IntroO:	.include "PRG/objects/WAIntro.asm"	; Any Airship run, jump, catch anchor intro
W4Airship_BossO:	.include "PRG/objects/W4ABoss.asm"	; World 4 Airship boss room
W5AirshipO:	.include "PRG/objects/W5A.asm"			; World 5 Airship
W1AirshipO:	.include "PRG/objects/W1A.asm"			; World 1 Airship
W2AirshipO:	.include "PRG/objects/W2A.asm"			; World 2 Airship
W3AirshipO:	.include "PRG/objects/W3A.asm"			; World 3 Airship
W4AirshipO:	.include "PRG/objects/W4A.asm"			; World 4 Airship
W6AirshipO:	.include "PRG/objects/W6A.asm"			; World 6 Airship
W7AirshipO:	.include "PRG/objects/W7A.asm"			; World 7 Airship
;W8AirshipO:	.include "PRG/objects/W8A.asm"			; World 8 Airship
W1Airship_BossO:	.include "PRG/objects/W1ABoss.asm"	; World 1 Airship boss room
W2Airship_BossO:	.include "PRG/objects/W2ABoss.asm"	; World 2 Airship boss room
W3Airship_BossO:	.include "PRG/objects/W3ABoss.asm"	; World 3 Airship boss room
W5Airship_BossO:	.include "PRG/objects/W5ABoss.asm"	; World 5 Airship boss room
W6Airship_BossO:	.include "PRG/objects/W6ABoss.asm"	; World 6 Airship boss room
W7Airship_BossO:	.include "PRG/objects/W7ABoss.asm"	; World 7 Airship boss room
W8Airship_BossO:	.include "PRG/objects/W8ABoss.asm"	; World 8 Airship boss room
CoinShipO:		.include "PRG/objects/CoinShip.asm"	; Coin Ship
CoinShip_BossO:		.include "PRG/objects/CoinBoss.asm"	; Coin Ship boss
KINGO:		.include "PRG/objects/King.asm"
W2AirshipBO:	.include "PRG/objects/W2AirshipB.asm"	; W2 Airship B
W3G1AO:	.include "PRG/objects/3-G1A.asm"	; W3 Ghost House 1A
W401AO:	.include "PRG/objects/4-1A.asm"	; W4-1
W3BBO:	.include "PRG/objects/3-BB.asm"	; W3 Boss Big Boo
W2ZROI:	.include "PRG/objects/2-ZJI.asm"	; W2 Gateway to Zero (Inbound)
W3F1AO:	.include "PRG/objects/3-F1A.asm"	; W3 Fortress 1A
WZW21AO:	.include "PRG/objects/ZW2-1A.asm"	; WZero W2 Path 1A
WZW21BO:	.include "PRG/objects/ZW2-1B.asm"	; WZero W2 Path 1B
W3F1BO:	.include "PRG/objects/3-F1B.asm"	; W3 Fortress 1B
W302O:	.include "PRG/objects/3-2.asm"	; W3-2
W302BO:	.include "PRG/objects/3-2B.asm"	; W3-2B
W3G1BO:	.include "PRG/objects/3-G1B.asm"	; W3 Ghost House 1B
W303AO:	.include "PRG/objects/3-3A.asm"	; W3-3A
W304O:	.include "PRG/objects/3-4.asm"	; W3-4
W304BO:	.include "PRG/objects/3-4B.asm"	; W3-4B
W305O:	.include "PRG/objects/3-5.asm"	; W3-5
W3F2AO:	.include "PRG/objects/3-F2A.asm"	; W3 Fortress 2A
W3F2BO:	.include "PRG/objects/3-F2B.asm"	; W3 Fortress 2B
W3BB2O:	.include "PRG/objects/3-BB2.asm"	; W3 Boss Big Boo 2
W3BB3O:	.include "PRG/objects/3-BB3.asm"	; W3 Boss Big Boo 3
DTESTO:	.include "PRG/objects/DTEST.asm"	; Desert Test
W3AirshipBO:	.include "PRG/objects/W3AB.asm"	; W3 Airship B
W402O:	.include "PRG/objects/4-2.asm"	; W4-2
W402BO:	.include "PRG/objects/4-2B.asm"	; W4-2B
W403AO:	.include "PRG/objects/4-3A.asm"	; W4-3
W403BO:	.include "PRG/objects/4-3B.asm"	; W4-3B
W702O:	.include "PRG/objects/7-2.asm"	; W7-2
W501O:	.include "PRG/objects/5-1.asm"	; W5-1
W401BO:	.include "PRG/objects/4-1B.asm"	; W4-1B
W3BOO:	.include "PRG/objects/3-BO.asm"	; W3 Boss Boomer
W3APBO:	.include "PRG/objects/W3APB.asm"	; W3 Airship Preboss
W4F1AO:	.include "PRG/objects/4-F1A.asm"	; W4 Fortress 1A
W4F1BO:	.include "PRG/objects/4-F1B.asm"	; W4 Fortress 1B
W4F1CO:	.include "PRG/objects/4-F1C.asm"	; W4 Fortress 1C
W4F1DO:	.include "PRG/objects/4-F1D.asm"	; W4 Fortress 1 Boss Reznor
W404AO:	.include "PRG/objects/4-4A.asm"	; W4-4A
W404BO:	.include "PRG/objects/W404B.asm"	; W4-4B
W4G1AO:	.include "PRG/objects/4-G1A.asm"	; W4 Ghost House 1A
W4G1BO:	.include "PRG/objects/4-G1B.asm"	; W4 Ghost House 1B
W405AO:	.include "PRG/objects/4-5A.asm"	; W4-5
W405BO:	.include "PRG/objects/4-5B.asm"	; W4-5B
W406AO:	.include "PRG/objects/4-6A.asm"	; W4-6A
W406BO:	.include "PRG/objects/4-6B.asm"	; W4-6B
W4F2AO:	.include "PRG/objects/4-F2A.asm"	; W4 Fortress 2A
W4F2BO:	.include "PRG/objects/4-F2B.asm"	; W4 Fortress 2B
W407AO:	.include "PRG/objects/4-7A.asm"	; W4-7
W407BO:	.include "PRG/objects/4-7B.asm"	; W4-7B
W407BAO:	.include "PRG/objects/4-7BonusA.asm"	; W4-7 Bonus
W4F3AO:	.include "PRG/objects/4-F3A.asm"	; W4 Fortress 3A
W4F3BO:	.include "PRG/objects/4-F3B.asm"	; W4 Fortress 3B
W4F3CO:	.include "PRG/objects/4-F3C.asm"	; W4 Fortress 3C
W4ZROI:	.include "PRG/objects/4-ZJI.asm"	; W4 Gateway to Zero (Inbound)
W5P1BO:	.include "PRG/objects/5-P1B.asm"	; W5 Pyramid 1B
TestPMO:	.include "PRG/objects/TestPM.asm"	; TestPM
W5PB1O:	.include "PRG/objects/5-PB1.asm"	; W5 Pyramid Boss Totomesu
W502O:	.include "PRG/objects/5-2.asm"		; W5-2
W501BO:	.include "PRG/objects/5-1B.asm"	; W5-1B
W502BO:	.include "PRG/objects/5-2B.asm"	; W5-2B
W503O:	.include "PRG/objects/5-3.asm"	; W5-3
W503BO:	.include "PRG/objects/5-3B.asm"	; W5-3B
W5P1O:	.include "PRG/objects/5-P1.asm"	; W5 Pyramid 1
W5P1CO:	.include "PRG/objects/5-P1C.asm"	; W5 Pyramid 1C
W504O:	.include "PRG/objects/5-4.asm"	; W5-4
W504BO:	.include "PRG/objects/5-4B.asm"	; W5-4B
W504CO:	.include "PRG/objects/5-4C.asm"	; W5-4C
W505O:	.include "PRG/objects/5-5.asm"	; W5-5
W505BO:	.include "PRG/objects/5-5B.asm"	; W5-5B
W506O:	.include "PRG/objects/5-6.asm"	; W5-6
W5P2O:	.include "PRG/objects/5-P2.asm"	; W5 Pyramid 2
W5P2BO:	.include "PRG/objects/5-P2B.asm"	; W5 Pyramid 2B
W5P2CO:	.include "PRG/objects/5-P2C.asm"	; W5 Pyramid 2C
W5PB2O:	.include "PRG/objects/5-PB2.asm"	; W5 Pyramid Boss Totomesu 2
W5G1AO:	.include "PRG/objects/5-G1A.asm"	; W5 Ghost House 1A
W5G1BO:	.include "PRG/objects/5-G1B.asm"	; W5 Ghost House 1B
W5F1AO:	.include "PRG/objects/5-F1A.asm"	; W5 Fortress 1A
W5F1BO:	.include "PRG/objects/5-F1B.asm"	; W5 Fortress 1B
W5F1CO:	.include "PRG/objects/5-F1C.asm"	; W5 Fortress 1C
W5PB3O:	.include "PRG/objects/5-PB3.asm"	; W5 Fortress Boss Totomesu
DelTestO:	.include "PRG/objects/DelTest.asm"	; DELFINOTEST
DELNBO:	.include "PRG/objects/DELNB.asm"	; DELFINON&BTEST
W603O:	.include "PRG/objects/6-3.asm"	; W6-3
W603BO:	.include "PRG/objects/6-3B.asm"	; W6-3B
W603BAO:	.include "PRG/objects/6-3BonusA.asm"	; W6-3 Bonus
W604O:	.include "PRG/objects/6-4.asm"	; W6-4
W604BO:	.include "PRG/objects/6-4B.asm"	; W6-4B
W601AO:	.include "PRG/objects/6-1A.asm"	; W6-1
W601BO:	.include "PRG/objects/6-1B.asm"	; W6-1B
W602O:	.include "PRG/objects/6-2.asm"	; W6-2
W602BAO:	.include "PRG/objects/6-2BonusA.asm"	; W6-2Bonus
W604CO:	.include "PRG/objects/6-4C.asm"	; W6-4C
W605O:	.include "PRG/objects/6-5.asm"	; W6-5
W605BO:	.include "PRG/objects/6-5B.asm"	; W6-5B
W605CO:	.include "PRG/objects/6-5C.asm"	; W6-5C
UTestO:	.include "PRG/objects/UTest.asm"	; UNDERGROUND TEST
HillsTestO:	.include "PRG/objects/HillsTest.asm"	; HILLS TEST
W6F1AO:	.include "PRG/objects/6-F1A.asm"	; W6 Fortress 1A
W6F1BO:	.include "PRG/objects/6-F1B.asm"	; W6 Fortress 1B
W6F1BossO:	.include "PRG/objects/6-F1Boss.asm"	; W6 Fortress 1 Boss
W606AO:	.include "PRG/objects/6-6A.asm"	; W6-6
W606BO:	.include "PRG/objects/6-6B.asm"	; W6-6B
W6G1AO:	.include "PRG/objects/6-G1A.asm"	; W6 Ghost House
W6G1BO:	.include "PRG/objects/6-G1B.asm"	; W6 Ghost House B
W6G1CO:	.include "PRG/objects/6-G1C.asm"	; W6 Ghost House C
W6ZROI:	.include "PRG/objects/6-ZJI.asm"	; W6 Gateway to Zero (Inbound)
W6F2AO:	.include "PRG/objects/6-F2A.asm"	; W6 Fortress 2A
W6F2BO:	.include "PRG/objects/6-F2B.asm"	; W6 Fortress 2B
W6F2CO:	.include "PRG/objects/6-F2C.asm"	; W6 Fortress 2C
W6F2BossO:	.include "PRG/objects/6-F2Boss.asm"	; W6 Fortress 2 Boss
W6AirshipBO:	.include "PRG/objects/W6AB.asm"	; W6 Airship B
W6AirshipCO:	.include "PRG/objects/W6AirshipC.asm"	; W6 Airship C
W6AirshipDO:	.include "PRG/objects/W6AirshipD.asm"	; W6 Airship D
W701O:	.include "PRG/objects/7-1.asm"	; W7-1
W701BO:	.include "PRG/objects/7-1B.asm"	; W7-1B
W701CO:	.include "PRG/objects/W701C.asm"	; W7-1C
IceTestO:	.include "PRG/objects/IceTest.asm"	; Ice Test
W703O:	.include "PRG/objects/7-3.asm"	; 7-3
W703BO:	.include "PRG/objects/7-3B.asm"	; W7-3B
W7JCT1AO:	.include "PRG/objects/7-JCT1A.asm"	; W7 Pipe Jct 1A
W7JCT1BO:	.include "PRG/objects/7-JCT1B.asm"	; W7 Pipe Jct 1B
W702BO:	.include "PRG/objects/7-2B.asm"	; W7-2B
W704O:	.include "PRG/objects/7-4.asm"	; W7-4
W704BO:	.include "PRG/objects/7-4B.asm"	; W7-4B
W705O:	.include "PRG/objects/7-5.asm"	; W7-5
W705BO:	.include "PRG/objects/7-5B.asm"	; W7-5B
W705CO:	.include "PRG/objects/7-5C.asm"	; W7-5C
W7F1AO:	.include "PRG/objects/7-F1A.asm"	; W7 Fortress 1A
W7FBO:	.include "PRG/objects/W7FB.asm"	; W7 Fortress Boss
W7F1BO:	.include "PRG/objects/7-F1B.asm"	; W7 Fortress 1B
W706O:	.include "PRG/objects/7-6.asm"	; W7-6
W706BO:	.include "PRG/objects/7-6B.asm"	; W7-6B
W7JCT2AO:	.include "PRG/objects/7-JCT2A.asm"	; W7 Pipe Jct 2A
W7JCT2BO:	.include "PRG/objects/7-JCT2B.asm"	; W7 Pipe Jct 2B
W707O:	.include "PRG/objects/W707.asm"	; W7-7
W707BO:	.include "PRG/objects/7-7B.asm"	; W7-7B
W708O:	.include "PRG/objects/7-8.asm"	; W7-8
W708BO:	.include "PRG/objects/7-8B.asm"	; W7-8B
W708CO:	.include "PRG/objects/7-8C.asm"	; W7-8C
W7F2AO:	.include "PRG/objects/7-F2A.asm"	; W7 Fortress 2A
W7F2BO:	.include "PRG/objects/7-F2B.asm"	; W7 Fortress 2B
W7F2CO:	.include "PRG/objects/7-F2C.asm"	; W7 Fortress 2C
W7F3AO:	.include "PRG/objects/7-F3A.asm"	; W7 Fortress 3A
W7F3O:	.include "PRG/objects/7-F3.asm"	; W7 Fortress Entrance
W7F3BO:	.include "PRG/objects/7-F3B.asm"	; W7 Fortress 3B
W7F3CO:	.include "PRG/objects/7-F3C.asm"	; W7 Fortress 3C
W7F3DO:	.include "PRG/objects/7-F3D.asm"	; W7 Fortress 3D
W7F3EO:	.include "PRG/objects/7-F3E.asm"	; W7 Fortress 3E
W7AirshipBPO:	.include "PRG/objects/W7AirshipBP.asm"	; W7 Airship Boss Planet
W7AirshipBPBO:	.include "PRG/objects/W7AirshipBPB.asm"	; W7 Airship Boss Planet B
W2F3AO:	.include "PRG/objects/2-F3A.asm"	; W2 Fortress 3A
W2F3BO:	.include "PRG/objects/2-F3B.asm"	; W2 Fortress 3B
W2F3CO:	.include "PRG/objects/2-F3C.asm"	; W2 Fortress 3C
W2F1FO:	.include "PRG/objects/2-F1F.asm"	; W2 Fortress 1F
W802ExO:	.include "PRG/objects/8-2Ex.asm"	; W8-2 Exit
W803O:	.include "PRG/objects/8-3.asm"	; W8-3
W803BO:	.include "PRG/objects/8-3B.asm"	; W8-3B
W804O:	.include "PRG/objects/8-4.asm"	; W8-4
W804BO:	.include "PRG/objects/8-4B.asm"	; W8-4B
W805O:	.include "PRG/objects/8-5.asm"	; W8-5
W806O:	.include "PRG/objects/8-6.asm"	; W8-6
W806BO:	.include "PRG/objects/8-6B.asm"	; W8-6B
W807O:	.include "PRG/objects/8-7.asm"	; W8-7
W807BO:	.include "PRG/objects/8-7B.asm"	; W8-7B
ExtTestO:	.include "PRG/objects/ExtTest.asm"	; ExtTest
W8BCastlAO:	.include "PRG/objects/W8BCastlA.asm"	; W8 Bowser's Castle Bitches
W8BCastlBO:	.include "PRG/objects/W8BCastlB.asm"	; W8 Bowser's B
W8BCastlCO:	.include "PRG/objects/W8BCastlC.asm"	; W8 Bowser's C
WZW4AO:	.include "PRG/objects/ZW4.asm"	; WZero W4 Path
WZW4BO:	.include "PRG/objects/ZW4B.asm"	; WZero W4 Path B
WZW6AO:	.include "PRG/objects/ZW6.asm"	; WZero W6 Path
WZW6BO:	.include "PRG/objects/ZW6B.asm"	; WZero W6 Path B
W8ZROI:	.include "PRG/objects/8-ZJI.asm"	; W8 Gateway to Zero (Inbound)
W805BO:	.include "PRG/objects/8-5B.asm"	; W8-5B
WZW8AO:	.include "PRG/objects/ZW8.asm"	; WZero W8 Path
WZW8BO:	.include "PRG/objects/ZW8B.asm"	; WZero W8 Path B
WZ1O:	.include "PRG/objects/WZ1.asm"	; WZero-1
WZ2O:	.include "PRG/objects/WZ2.asm"	; WZero-2
WZ2BO:	.include "PRG/objects/WZ2B.asm"	; W-Zero2B
WZ3O:	.include "PRG/objects/WZ3.asm"	; WZero-3
WZ4O:	.include "PRG/objects/WZ4.asm"	; WZero-4
WZ4BO:	.include "PRG/objects/WZ4B.asm"	; WZero-4B
WZ4CO:	.include "PRG/objects/WZ4C.asm"	; WZero-4C
WZ4DO:	.include "PRG/objects/WZ4D.asm"	; WZero-4D
WZ4EO:	.include "PRG/objects/WZ4E.asm"	; WZero-4E
WZFinalO:	.include "PRG/objects/WZFinal.asm"	; WZero-Final
WZFinalBO:	.include "PRG/objects/WZFinalB.asm"	; WZero-FinalB
WZFinalCO:	.include "PRG/objects/WZFinalC.asm"	; WZero-FinalC
WZFinalDO:	.include "PRG/objects/WZFinalD.asm"	; WZero-FinalD
W1BatlO:	.include "PRG/objects/W1BatlO.asm"	; W1 Challenge
W2BatlO:	.include "PRG/objects/W2Batl.asm"	; W2 Challenge
W3BatlO:	.include "PRG/objects/W3Batl.asm"	; W3 Challenge
W4BatlO:	.include "PRG/objects/W4Batl.asm"	; W4 Challenge
W5BatlO:	.include "PRG/objects/W5Batl.asm"	; W5 Challenge
W6BatlO:	.include "PRG/objects/W6Batl.asm"	; W6 Challenge
W7BatlO:	.include "PRG/objects/W7Batl.asm"	; W7 Challenge
WZBatlO:	.include "PRG/objects/WZBatl.asm"	; WZero Challenge
W708PO:	.include "PRG/objects/7-8P.asm"	; W7-8 Preface
