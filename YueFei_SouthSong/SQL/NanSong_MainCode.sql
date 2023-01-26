--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 						DerivativeCiv,			Description, 					ShortDescription, 					 Adjective, 							CivilopediaTag, 			DefaultPlayerColor,		  ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,			AlphaIconAtlas, 		 PortraitIndex,	SoundtrackTag, 	MapImage, 				DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_YFS_SONG'), 	('CIVILIZATION_CHINA'),	('TXT_KEY_CIV_YFS_SONG_DESC'), 	('TXT_KEY_CIV_YFS_SONG_SHORT_DESC'), ('TXT_KEY_CIV_YFS_SONG_ADJECTIVE'), 	('TXT_KEY_CIV5_YFS_SONG'), 	('PLAYERCOLOR_YFS_SONG'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('YFS_SONG_ATLAS'),  ('YFS_SONG_ALPHA_ATLAS'),  0, 			('CHINA'),	 	('tcmSongMap.dds'), 	('TXT_KEY_CIV5_DOM_YFS_SONG_TEXT'), ('yfsSongDOM.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================	
INSERT INTO	Civilization_BuildingClassOverrides
			(CivilizationType,			BuildingClassType,						BuildingType)
VALUES		('CIVILIZATION_YFS_SONG',	'BUILDINGCLASS_PALACE',					'BUILDING_YUYING'),	-- UW1
-- VALUES		('CIVILIZATION_YFS_SONG',	'BUILDINGCLASS_LIUSHOUSI',				'BUILDING_SONG_LIUSHOUSI');	-- UW2
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_01'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_02'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_03'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_04'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_05'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_06'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_07'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_08'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_09'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_10'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_11'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_12'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_13'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_14'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_15'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_16'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_17'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_18'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_19'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_20'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_21'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_22'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_23'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_24'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_25'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_26'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_27'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_28'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_29'),
			('CIVILIZATION_YFS_SONG', 		'TXT_KEY_CITY_NAME_YFS_SONG_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_YFS_SONG', 		'BUILDINGCLASS_PALACE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
VALUES		('CIVILIZATION_YFS_SONG',	'TECH_AGRICULTURE'),
			('CIVILIZATION_YFS_SONG',	'TECH_FISHERY');
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_YFS_SONG'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_YFS_SONG', 	'LEADER_YFS_YUEFEI');
--==========================================================================================================================
-- Civilization_UnitClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_YFS_SONG', 	'UNITCLASS_GREAT_GALLEASS',	'UNIT_U_PWS'),
			('CIVILIZATION_YFS_SONG', 	'UNITCLASS_GREAT_GENERAL',	'UNIT_JIEDUSHI'),
			('CIVILIZATION_YFS_SONG', 	'UNITCLASS_CROSSBOWMAN',	'UNIT_ZHUDUISHI'),
			('CIVILIZATION_YFS_SONG', 	'UNITCLASS_LONGSWORDSMAN',	'UNIT_BEIWEI_FOOT'),
			('CIVILIZATION_YFS_SONG', 	'UNITCLASS_CARGO_SHIP',		'UNIT_SONG_CARGOSHIP');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_YFS_SONG', 	'RELIGION_CONFUCIANISM');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_0'),	
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_1'),
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_2'),
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_3'),
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_4'),
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_5'),
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_6'),
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_7'),
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_8'),
			('CIVILIZATION_YFS_SONG', 	'TXT_KEY_SPY_NAME_YFS_SONG_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Along_River 
			(CivilizationType, 			StartAlongRiver)
VALUES		('CIVILIZATION_YFS_SONG', 	1);	
INSERT INTO Civilization_Start_Along_Ocean
			(CivilizationType, 			StartAlongOcean)
VALUES		('CIVILIZATION_YFS_SONG', 	1);
--==========================================================================================================================	
-- Colors
--==========================================================================================================================		
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_YFS_SONG_ICON',				0.733,	0.733,	0.733,	1),
			('COLOR_PLAYER_YFS_SONG_BACKGROUND',		0.525,	0.176,	0.200,	1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 						SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_YFS_SONG',			'COLOR_PLAYER_YFS_SONG_ICON', 		'COLOR_PLAYER_YFS_SONG_BACKGROUND', 			'COLOR_PLAYER_WHITE_TEXT'); 
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							 CivilopediaTag, 					ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_YFS_YUEFEI', 		'TXT_KEY_LEADER_YFS_YUEFEI', 		'TXT_KEY_LEADER_YFS_YUEFEI_PEDIA_TEXT',  'TXT_KEY_LEADER_YFS_YUEFEI_PEDIA',	'yfsYueFeiScene.xml',	10, 					4, 						4, 							9, 			5, 				4, 				2, 						6, 				10, 		2, 			4, 				1, 			1, 			'YFS_SONG_ATLAS', 	10);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
			--对文明倾向
VALUES		('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_WAR', 			10),--战争
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),--敌对
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),--虚伪
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_GUARDED', 		10),--谨慎
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),--畏惧
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),--友好
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);--中立
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
			--对城邦倾向
VALUES		('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_IGNORE', 		5),--忽视
			('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),--友好
			('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),--保护
			('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),--征服
			('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_BULLY', 		1);--欺凌
--==========================================================================================================================	
-- Leader_Flavors--领袖性格
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
			--城市建设
VALUES		('LEADER_YFS_YUEFEI', 	'FLAVOR_PRODUCTION', 				10),--注重产能
			('LEADER_YFS_YUEFEI', 	'FLAVOR_GOLD', 						5),--注重金钱
			('LEADER_YFS_YUEFEI', 	'FLAVOR_SCIENCE', 					8),--注重科研
			('LEADER_YFS_YUEFEI', 	'FLAVOR_CULTURE', 					5),--注重文化
			--军事倾向
			('LEADER_YFS_YUEFEI', 	'FLAVOR_OFFENSE', 					12),--进攻倾向
			('LEADER_YFS_YUEFEI', 	'FLAVOR_DEFENSE', 					10),--防御倾向
			('LEADER_YFS_YUEFEI', 	'FLAVOR_CITY_DEFENSE', 				7),--城防倾向
			('LEADER_YFS_YUEFEI', 	'FLAVOR_MILITARY_TRAINING', 		12),--组建军队
			--军队建设
			('LEADER_YFS_YUEFEI', 	'FLAVOR_RECON', 					5),--侦查部队
			('LEADER_YFS_YUEFEI', 	'FLAVOR_RANGED', 					6),--远程部队
			('LEADER_YFS_YUEFEI', 	'FLAVOR_MOBILE', 					10),--机动部队
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NAVAL', 					12),--海军部队
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NAVAL_RECON', 				8),--海军游猎部队
			('LEADER_YFS_YUEFEI', 	'FLAVOR_AIR', 						8),--空军部队
			('LEADER_YFS_YUEFEI', 	'FLAVOR_ANTIAIR', 					5),--防空部队
			('LEADER_YFS_YUEFEI', 	'FLAVOR_AIR_CARRIER', 				8),--航空母舰
			('LEADER_YFS_YUEFEI', 	'FLAVOR_AIRLIFT', 					2),--空运部队
			--国家建设
			('LEADER_YFS_YUEFEI', 	'FLAVOR_GROWTH', 					10),--发展人口
			('LEADER_YFS_YUEFEI', 	'FLAVOR_EXPANSION', 				12),--扩张领土
			('LEADER_YFS_YUEFEI', 	'FLAVOR_INFRASTRUCTURE', 			8),--基础设施
			('LEADER_YFS_YUEFEI', 	'FLAVOR_TILE_IMPROVEMENT', 			8),--地格开发
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),--海洋开发
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NAVAL_GROWTH', 				8),--海军建设
			('LEADER_YFS_YUEFEI', 	'FLAVOR_HAPPINESS', 				9),--国家快乐
			('LEADER_YFS_YUEFEI', 	'FLAVOR_GREAT_PEOPLE', 				6),--诞生伟人
			('LEADER_YFS_YUEFEI', 	'FLAVOR_WONDER', 					7),--建造奇观
			('LEADER_YFS_YUEFEI', 	'FLAVOR_RELIGION', 					5),--发展宗教
			('LEADER_YFS_YUEFEI', 	'FLAVOR_WATER_CONNECTION', 			10),--水路连接
			('LEADER_YFS_YUEFEI', 	'FLAVOR_ARCHAEOLOGY', 				4),--发展考古
			('LEADER_YFS_YUEFEI', 	'FLAVOR_SPACESHIP', 				2),--发展航天
			--外交倾向
			('LEADER_YFS_YUEFEI', 	'FLAVOR_DIPLOMACY', 				6),--发展外交
			('LEADER_YFS_YUEFEI', 	'FLAVOR_ESPIONAGE', 				7),--间谍机构
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NUKE', 						7),--发展核威慑
			('LEADER_YFS_YUEFEI', 	'FLAVOR_USE_NUKE', 					2),--使用核武库
			--贸易倾向
			('LEADER_YFS_YUEFEI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		1),--陆地商路
			('LEADER_YFS_YUEFEI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		12),--海洋商路
			('LEADER_YFS_YUEFEI', 	'FLAVOR_I_TRADE_ORIGIN', 			12),--发起商路
			('LEADER_YFS_YUEFEI', 	'FLAVOR_I_TRADE_DESTINATION', 		12);--接收商路
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_YFS_YUEFEI', 	'TRAIT_YFS_YUEFEI_SONG');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription,							EmbarkedToLandFlatCost,		ExtraFoundedCityTerritoryClaimRange)
VALUES		('TRAIT_YFS_YUEFEI_SONG', 	'TXT_KEY_TRAIT_YFS_YUEFEI_SONG', 	'TXT_KEY_TRAIT_YFS_YUEFEI_SONG_SHORT',		1,							6);
--==========================================================================================================================	
-- Trait_YieldFromKills
--==========================================================================================================================	
INSERT INTO Trait_YieldFromKills 	
			(TraitType, 						 			YieldType, 							Yield)
VALUES		('TRAIT_YFS_YUEFEI_SONG', 						'YIELD_GOLD', 						50),
			('TRAIT_YFS_YUEFEI_SONG', 						'YIELD_SCIENCE', 					50),
			('TRAIT_YFS_YUEFEI_SONG', 						'YIELD_CULTURE', 					50);
--==========================================================================================================================	
-- Trait_BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 				DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_YFS_SONG', 					'BUILDING_YFS_SONG', 						'TXT_KEY_CIV_YFS_SONG_DESC'),
			('BUILDINGCLASS_FIRSTWONDER_PRODUCTION',	'BUILDING_FIRSTWONDER_PRODUCTION', 			'TXT_KEY_CIV_YFS_SONG_DESC'),
			('BUILDINGCLASS_SONG_CARGOSHIP', 			'BUILDING_SONG_CARGOSHIP', 					'TXT_KEY_CIV_YFS_SONG_DESC'),
			('BUILDINGCLASS_SONG_DEFENSE', 				'BUILDING_SONG_DEFENSE', 					'TXT_KEY_CIV_YFS_SONG_DESC');
--==========================================================================================================================	
-- Trait_Buildings
--==========================================================================================================================			
INSERT INTO Buildings 	
			(Type, 								 BuildingClass, 						Defense,	MilitaryProductionModifier,		WonderProductionModifier,	GlobalCultureRateModifier,		GreatWorkCount,		Cost,	Description,								MinAreaSize,	HurryCostModifier,	NeverCapture,	NukeImmune,		PortraitIndex,	IconAtlas)
VALUES		('BUILDING_YFS_SONG',				'BUILDINGCLASS_YFS_SONG', 					  0,							 0,							   0,							0,				     0,		  -1,	'TXT_KEY_CIV_YFS_SONG_DESC_TRAIT',			-1,				-1,					1,				1,				0,				'YFS_SONG_ATLAS'),
			('BUILDING_FIRSTWONDER_PRODUCTION',	'BUILDINGCLASS_FIRSTWONDER_PRODUCTION',		  0,							 0,							 100,							0,				    -1,		  -1,	'TXT_KEY_CIV_YFS_SONG_DESC_WONDER',			-1,				-1,					1,				1,			   11,				'YFS_SONG_ATLAS'),
			('BUILDING_SONG_CARGOSHIP',			'BUILDINGCLASS_SONG_CARGOSHIP', 			  0,							 0,							   0,							4,				     0,		  -1,	'TXT_KEY_CIV_YFS_SONG_DESC_CARGO',			-1,				-1,					1,				1,				1,				'YFS_SONG_ATLAS'),
			('BUILDING_SONG_DEFENSE',			'BUILDINGCLASS_SONG_DEFENSE', 				100,							 0,							   0,							4,					 0,		  -1,	'TXT_KEY_CIV_YFS_SONG_DESC_DEFENSE',		-1,				-1,					1,				1,			    7,				'YFS_SONG_ATLAS');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_GlobalYieldModifiers 
			(BuildingType, 				YieldType,				Yield)
VALUES		('BUILDING_YFS_SONG',		'YIELD_PRODUCTION',		4),
			('BUILDING_YFS_SONG',		'YIELD_SCIENCE',		4),
			('BUILDING_YFS_SONG',		'YIELD_CULTURE',		4),
			('BUILDING_SONG_CARGOSHIP',	'YIELD_GOLD',			4);
--==========================================================================================================================
--==========================================================================================================================	
-- Trait_Promotions
--==========================================================================================================================	
INSERT INTO Trait_FreePromotionUnitCombats
			(TraitType,					UnitCombatType,				PromotionType) 	
VALUES		('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_MELEE',			'PROMOTION_NANSONG_LAND'),
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_MOUNTED',		'PROMOTION_NANSONG_LAND'),	
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_ARMOR',			'PROMOTION_NANSONG_LAND'),
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_HELICOPTER',	'PROMOTION_NANSONG_LAND'),
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_SIEGE',			'PROMOTION_NANSONG_LAND'),
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_BOMBER',		'PROMOTION_NANSONG_LAND'),
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_NAVALMELEE',	'PROMOTION_NANSONG_SEA'),
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_SUBMARINE',		'PROMOTION_NANSONG_SEA'),
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_NAVALRANGED',	'PROMOTION_NANSONG_SEA'),
			('TRAIT_YFS_YUEFEI_SONG',	'UNITCOMBAT_CARRIER',		'PROMOTION_NANSONG_SEA');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_YFS_YUEFEI_PEACE', 	'NanSongPeace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_YFS_YUEFEI_WAR',		'NanSongWar', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_YFS_YUEFEI_PEACE', 			'SND_LEADER_MUSIC_YFS_YUEFEI_PEACE', 	'GAME_MUSIC', 	40, 		40, 		1, 			0),
			('AS2D_LEADER_MUSIC_YFS_YUEFEI_WAR', 			'SND_LEADER_MUSIC_YFS_YUEFEI_WAR', 		'GAME_MUSIC',	32, 		32, 		1,			0);
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_YFS_YUEFEI','RESPONSE_FIRST_GREETING','TXT_KEY_LEADER_YFS_YUEFEI_FIRST_GREETING_%','1');
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_YFS_YUEFEI','RESPONSE_DEFEATED',	'TXT_KEY_LEADER_YFS_YUEFEI_DEFEATED_%','1');
--INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_YFS_YUEFEI','RESPONSE_DECLAREWAR', 'TXT_KEY_LEADER_YFS_YUEFEI_DECLAREWAR_%','1');
--==========================================================================================================================	
-- UPDATE CustomModOptions SET Value = 1 Where Name = 'PROMOTIONS_IMPROVEMENT_BONUS';
--==========================================================================================================================	
-- Improvements
--==========================================================================================================================	
INSERT INTO Improvements
		(Type,							SpecificCivRequired,	CivilizationType,			AdditionalUnits,	NearbyEnemyDamage,	DefenseModifier,	PillageGold,	OutsideBorders,	IgnoreOwnership,	LuxuryCopiesSiphonedFromMinor,	Description,							Help,										Civilopedia,								ArtDefineTag,						PortraitIndex,	IconAtlas)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',	1,						'CIVILIZATION_YFS_SONG',	0,					0,					50,					100,			1,				1,					1,								'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT1',	'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT1_HELP',	'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT1_HELP',	'ART_DEF_IMPROVEMENT_SONG_FORT1', 	0,				'YFS_CASTLE_ATLAS'),
		('IMPROVEMENT_YFS_SONG_FORT2',	0,						null,						0,					5,					75,					150,			1,				1,					1,								'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT2',	'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT2_HELP',	'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT2_HELP',	'ART_DEF_IMPROVEMENT_SONG_FORT2', 	2,				'YFS_CASTLE_ATLAS'),
		('IMPROVEMENT_YFS_SONG_FORT3',	0,						null,						1,					10,					100,				200,			1,				1,					1,								'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT3',	'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT3_HELP',	'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT3_HELP',	'ART_DEF_IMPROVEMENT_SONG_FORT3', 	4,				'YFS_CASTLE_ATLAS');
--==========================================================================================================================	
-- Improvement_ValidTerrains
--==========================================================================================================================	
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,					TerrainType)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'TERRAIN_GRASS'),
		('IMPROVEMENT_YFS_SONG_FORT1',		'TERRAIN_TUNDRA'),
		('IMPROVEMENT_YFS_SONG_FORT1',		'TERRAIN_DESERT'),
		('IMPROVEMENT_YFS_SONG_FORT1',		'TERRAIN_SNOW'),
		('IMPROVEMENT_YFS_SONG_FORT1',		'TERRAIN_PLAINS'),

		('IMPROVEMENT_YFS_SONG_FORT2',		'TERRAIN_GRASS'),
		('IMPROVEMENT_YFS_SONG_FORT2',		'TERRAIN_TUNDRA'),
		('IMPROVEMENT_YFS_SONG_FORT2',		'TERRAIN_DESERT'),
		('IMPROVEMENT_YFS_SONG_FORT2',		'TERRAIN_SNOW'),
		('IMPROVEMENT_YFS_SONG_FORT2',		'TERRAIN_PLAINS'),

		('IMPROVEMENT_YFS_SONG_FORT3',		'TERRAIN_GRASS'),
		('IMPROVEMENT_YFS_SONG_FORT3',		'TERRAIN_TUNDRA'),
		('IMPROVEMENT_YFS_SONG_FORT3',		'TERRAIN_DESERT'),
		('IMPROVEMENT_YFS_SONG_FORT3',		'TERRAIN_SNOW'),
		('IMPROVEMENT_YFS_SONG_FORT3',		'TERRAIN_PLAINS');
--==========================================================================================================================	
-- Improvement_Yields
--==========================================================================================================================	
INSERT INTO Improvement_Yields
		(ImprovementType,					YieldType,			Yield)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'YIELD_FOOD',		1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'YIELD_PRODUCTION',	1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'YIELD_GOLD',		-1),

		('IMPROVEMENT_YFS_SONG_FORT2',		'YIELD_FOOD',		2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'YIELD_PRODUCTION',	2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'YIELD_GOLD',		-2),

		('IMPROVEMENT_YFS_SONG_FORT3',		'YIELD_FOOD',		3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'YIELD_PRODUCTION',	3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'YIELD_GOLD',		-3);
--==========================================================================================================================	
-- Improvement_RiverSideYields
--==========================================================================================================================	
INSERT INTO Improvement_RiverSideYields
		(ImprovementType,					YieldType,			Yield)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'YIELD_GOLD',		1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'YIELD_FOOD',		1),

		('IMPROVEMENT_YFS_SONG_FORT2',		'YIELD_GOLD',		2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'YIELD_FOOD',		2),

		('IMPROVEMENT_YFS_SONG_FORT3',		'YIELD_GOLD',		3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'YIELD_FOOD',		3);
--==========================================================================================================================	
-- Improvement_RouteYieldChanges
--==========================================================================================================================	
INSERT INTO Improvement_RouteYieldChanges
		(ImprovementType,					RouteType,			YieldType,			Yield)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'ROUTE_ROAD',		'YIELD_GOLD',		1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'ROUTE_RAILROAD',	'YIELD_GOLD',		2),

		('IMPROVEMENT_YFS_SONG_FORT2',		'ROUTE_ROAD',		'YIELD_GOLD',		2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'ROUTE_RAILROAD',	'YIELD_GOLD',		4),

		('IMPROVEMENT_YFS_SONG_FORT3',		'ROUTE_ROAD',		'YIELD_GOLD',		3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'ROUTE_RAILROAD',	'YIELD_GOLD',		6);
--==========================================================================================================================	
-- Improvement_AdjacentMountainYieldChanges
--==========================================================================================================================	
INSERT INTO Improvement_AdjacentMountainYieldChanges
		(ImprovementType,					YieldType,				Yield)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'YIELD_SCIENCE',		1),

		('IMPROVEMENT_YFS_SONG_FORT2',		'YIELD_PRODUCTION',		2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'YIELD_SCIENCE',		2),

		('IMPROVEMENT_YFS_SONG_FORT3',		'YIELD_PRODUCTION',		3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'YIELD_SCIENCE',		3);
--==========================================================================================================================	
-- Improvement_AdjacentImprovementYieldChanges
--==========================================================================================================================	
INSERT INTO Improvement_AdjacentImprovementYieldChanges 
		(ImprovementType,				OtherImprovementType,	YieldType, 		Yield)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',	'IMPROVEMENT_FARM',		'YIELD_FOOD',	1),
		('IMPROVEMENT_YFS_SONG_FORT1',	'IMPROVEMENT_FARM',		'YIELD_GOLD',	1),

		('IMPROVEMENT_YFS_SONG_FORT2',	'IMPROVEMENT_FARM',		'YIELD_FOOD',	2),
		('IMPROVEMENT_YFS_SONG_FORT2',	'IMPROVEMENT_FARM',		'YIELD_GOLD',	2),

		('IMPROVEMENT_YFS_SONG_FORT3',	'IMPROVEMENT_FARM',		'YIELD_FOOD',	3),
		('IMPROVEMENT_YFS_SONG_FORT3',	'IMPROVEMENT_FARM',		'YIELD_GOLD',	3);
--==========================================================================================================================	
-- Improvement_ResourceTypes
--==========================================================================================================================	
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,					ResourceType)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'RESOURCE_IRON'),
		('IMPROVEMENT_YFS_SONG_FORT1',		'RESOURCE_HORSE'),
		('IMPROVEMENT_YFS_SONG_FORT1',		'RESOURCE_TEA'),
		('IMPROVEMENT_YFS_SONG_FORT1',		'RESOURCE_GOLD'),

		('IMPROVEMENT_YFS_SONG_FORT2',		'RESOURCE_IRON'),
		('IMPROVEMENT_YFS_SONG_FORT2',		'RESOURCE_HORSE'),
		('IMPROVEMENT_YFS_SONG_FORT2',		'RESOURCE_TEA'),
		('IMPROVEMENT_YFS_SONG_FORT2',		'RESOURCE_GOLD'),

		('IMPROVEMENT_YFS_SONG_FORT3',		'RESOURCE_IRON'),
		('IMPROVEMENT_YFS_SONG_FORT3',		'RESOURCE_HORSE'),
		('IMPROVEMENT_YFS_SONG_FORT3',		'RESOURCE_TEA'),
		('IMPROVEMENT_YFS_SONG_FORT3',		'RESOURCE_GOLD');
--==========================================================================================================================	
-- Improvement_TechYieldChanges
--==========================================================================================================================
INSERT INTO Improvement_TechYieldChanges
		(ImprovementType,					TechType,				YieldType,				Yield)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'TECH_CIVIL_SERVICE',	'YIELD_FOOD',			1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'TECH_CIVIL_CHIVALRY',	'YIELD_PRODUCTION',		1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'TECH_ADMINISTRATION',	'YIELD_GOLD',			1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'TECH_THEOLOGY',		'YIELD_FAITH',			1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'TECH_ARCHAEOLOGY',		'YIELD_CULTURE',		1),

		('IMPROVEMENT_YFS_SONG_FORT2',		'TECH_CIVIL_SERVICE',	'YIELD_FOOD',			2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'TECH_CIVIL_CHIVALRY',	'YIELD_PRODUCTION',		2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'TECH_ADMINISTRATION',	'YIELD_GOLD',			2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'TECH_THEOLOGY',		'YIELD_FAITH',			2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'TECH_ARCHAEOLOGY',		'YIELD_CULTURE',		2),

		('IMPROVEMENT_YFS_SONG_FORT3',		'TECH_CIVIL_SERVICE',	'YIELD_FOOD',			3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'TECH_CIVIL_CHIVALRY',	'YIELD_PRODUCTION',		3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'TECH_ADMINISTRATION',	'YIELD_GOLD',			3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'TECH_THEOLOGY',		'YIELD_FAITH',			3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'TECH_ARCHAEOLOGY',		'YIELD_CULTURE',		3);
--==========================================================================================================================	
-- Improvement_TechYieldChanges
--==========================================================================================================================
INSERT INTO Policy_ImprovementYieldChanges
		(ImprovementType,					PolicyType,						YieldType,			Yield)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'POLICY_TRADITION_FINISHER',	'YIELD_FOOD',		1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'POLICY_COMMERCE_FINISHER',		'YIELD_GOLD',		1),
		('IMPROVEMENT_YFS_SONG_FORT1',		'POLICY_PIETY_FINISHER',		'YIELD_FAITH',		1),

		('IMPROVEMENT_YFS_SONG_FORT2',		'POLICY_TRADITION_FINISHER',	'YIELD_FOOD',		2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'POLICY_COMMERCE_FINISHER',		'YIELD_GOLD',		2),
		('IMPROVEMENT_YFS_SONG_FORT2',		'POLICY_PIETY_FINISHER',		'YIELD_FAITH',		2);

		('IMPROVEMENT_YFS_SONG_FORT3',		'POLICY_TRADITION_FINISHER',	'YIELD_FOOD',		3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'POLICY_COMMERCE_FINISHER',		'YIELD_GOLD',		3),
		('IMPROVEMENT_YFS_SONG_FORT3',		'POLICY_PIETY_FINISHER',		'YIELD_FAITH',		3);
--==========================================================================================================================	
-- Improvement_Flavors
--==========================================================================================================================	
INSERT INTO Improvement_Flavors
		(ImprovementType,					FlavorType,					Flavor)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',		'FLAVOR_TILE_IMPROVEMENT',	40),
		('IMPROVEMENT_YFS_SONG_FORT1',		'FLAVOR_DEFENSE',			40),
		('IMPROVEMENT_YFS_SONG_FORT1',		'FLAVOR_GROWTH',			20),
		('IMPROVEMENT_YFS_SONG_FORT1',		'FLAVOR_GOLD',				20),
		('IMPROVEMENT_YFS_SONG_FORT1',		'FLAVOR_PRODUCTION',		20),

		('IMPROVEMENT_YFS_SONG_FORT2',		'FLAVOR_TILE_IMPROVEMENT',	40),
		('IMPROVEMENT_YFS_SONG_FORT2',		'FLAVOR_DEFENSE',			40),
		('IMPROVEMENT_YFS_SONG_FORT2',		'FLAVOR_GROWTH',			20),
		('IMPROVEMENT_YFS_SONG_FORT2',		'FLAVOR_GOLD',				20),
		('IMPROVEMENT_YFS_SONG_FORT2',		'FLAVOR_PRODUCTION',		20),

		('IMPROVEMENT_YFS_SONG_FORT3',		'FLAVOR_TILE_IMPROVEMENT',	40),
		('IMPROVEMENT_YFS_SONG_FORT3',		'FLAVOR_DEFENSE',			40),
		('IMPROVEMENT_YFS_SONG_FORT3',		'FLAVOR_GROWTH',			20),
		('IMPROVEMENT_YFS_SONG_FORT3',		'FLAVOR_GOLD',				20),
		('IMPROVEMENT_YFS_SONG_FORT3',		'FLAVOR_PRODUCTION',		20);
--==========================================================================================================================	
-- Builds
--==========================================================================================================================	
INSERT INTO Builds
		(Type,						PrereqTech,				ImprovementType, 				Time, Recommendation,						Description,					Help,										OrderPriority,	IconIndex,	IconAtlas,			EntityEvent)
VALUES	('BUILD_YFS_SONG_FORT1',	'TECH_BRONZE_WORKING',	'IMPROVEMENT_YFS_SONG_FORT1',	900,  'TXT_KEY_BUILD_YFS_SONG_FORT1_REC', 	'TXT_KEY_BUILD_YFS_SONG_FORT1',	'TXT_KEY_IMPROVEMENT_YFS_SONG_FORT1_HELP',	96,				1,			'YFS_CASTLE_ATLAS',	'ENTITY_EVENT_BUILD');
--==========================================================================================================================	
-- BuildFeatures
--==========================================================================================================================	
INSERT INTO Unit_Builds
		(BuildType,						FeatureType,		PrereqTech,				Time,	Remove)
VALUES	('IMPROVEMENT_YFS_SONG_FORT1',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	400,	1),
		('IMPROVEMENT_YFS_SONG_FORT1',	'FEATURE_FOREST',	'TECH_BRONZE_WORKING',	100,	1);
--==========================================================================================================================	
-- Unit_Builds
--==========================================================================================================================	
INSERT INTO Unit_Builds
		(UnitType,			BuildType)
VALUES	('UNIT_WORKER',		'IMPROVEMENT_YFS_SONG_FORT1');



