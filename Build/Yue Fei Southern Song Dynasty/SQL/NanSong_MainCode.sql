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
			('CIVILIZATION_YFS_SONG',	'BUILDINGCLASS_HECHUAN_DIAOYUCHENG',	'BUILDING_SONG_DIAOYUCHENG');	-- UW2
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
			('CIVILIZATION_YFS_SONG', 	'UNITCLASS_FIRELANCER',		'UNIT_RANGED_FIRELANCER'),
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
VALUES		('LEADER_YFS_YUEFEI', 		'TXT_KEY_LEADER_YFS_YUEFEI', 		'TXT_KEY_LEADER_YFS_YUEFEI_PEDIA_TEXT',  'TXT_KEY_LEADER_YFS_YUEFEI_PEDIA',	'yfsYueFeiScene.xml',	11, 					8, 						10, 						9, 			5, 				4, 				2, 						6, 				6, 			4, 			4, 				1, 			1, 			'YFS_SONG_ATLAS', 	10);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_WAR', 			10),
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_GUARDED', 		10),
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_YFS_YUEFEI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_CONQUEST', 		5),
			('LEADER_YFS_YUEFEI', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_YFS_YUEFEI', 	'FLAVOR_OFFENSE', 					12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_DEFENSE', 					10),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_MILITARY_TRAINING', 		12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_RECON', 					5),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_RANGED', 					5),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_MOBILE', 					12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NAVAL', 					12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NAVAL_RECON', 				8),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NAVAL_GROWTH', 				8),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_AIR', 						8),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_EXPANSION', 				12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_GROWTH', 					10),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_INFRASTRUCTURE', 			8),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_PRODUCTION', 				9),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_GOLD', 						5),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_SCIENCE', 					9),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_CULTURE', 					9),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_HAPPINESS', 				9),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_GREAT_PEOPLE', 				9),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_WONDER', 					7),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_RELIGION', 					5),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_SPACESHIP', 				9),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_WATER_CONNECTION', 			12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_NUKE', 						7),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_I_TRADE_DESTINATION', 		12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_I_TRADE_ORIGIN', 			12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		12),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_YFS_YUEFEI', 	'FLAVOR_AIR_CARRIER', 				8);
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
			(Type, 						 			DefaultBuilding, 							Description)
VALUES		('BUILDINGCLASS_YFS_SONG', 				'BUILDING_YFS_SONG', 						'TXT_KEY_CIV_YFS_SONG_DESC');
--==========================================================================================================================	
-- Trait_Buildings
--==========================================================================================================================			
INSERT INTO Buildings 	
			(Type, 								 BuildingClass, 			MilitaryProductionModifier,		WonderProductionModifier,	GlobalCultureRateModifier, 		Cost,	Description,					MinAreaSize,	HurryCostModifier,	NeverCapture,	NukeImmune,		PortraitIndex,	IconAtlas)
VALUES		('BUILDING_YFS_SONG',				'BUILDINGCLASS_YFS_SONG', 							 0,							   0,							0,		  -1,	'TXT_KEY_CIV_YFS_SONG_DESC',	-1,				-1,					1,				1,				0,				'YFS_SONG_ATLAS'),
			('BUILDING_FIRELANCER_PRODUCTION',	'BUILDINGCLASS_YFS_SONG', 							25,							   0,							0,		  -1,	'TXT_KEY_CIV_YFS_SONG_DESC',	-1,				-1,					1,				1,				6,				'YFS_SONG_ATLAS'),
			('BUILDING_FIRSTWONDER_PRODUCTION',	'BUILDINGCLASS_YFS_SONG', 							 0,							 100,							0,		  -1,	'TXT_KEY_CIV_YFS_SONG_DESC',	-1,				-1,					1,				1,			   11,				'YFS_SONG_ATLAS'),
			('BUILDING_SONG_CARGOSHIP',			'BUILDINGCLASS_YFS_SONG', 							 0,							   0,							4,		  -1,	'TXT_KEY_CIV_YFS_SONG_DESC',	-1,				-1,					1,				1,				1,				'YFS_SONG_ATLAS');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_GlobalYieldModifiers 
			(BuildingType, 				YieldType,				Yield)
VALUES		('BUILDING_YFS_SONG',		'YIELD_PRODUCTION',		4),
			('BUILDING_YFS_SONG',		'YIELD_SCIENCE',		4),
			('BUILDING_YFS_SONG',		'YIELD_CULTURE',		4);
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
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_YFS_YUEFEI','RESPONSE_FIRST_GREETING','TXT_KEY_LEADER_YFS_YUEFEI_FIRSTGREETING_%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_YFS_YUEFEI','RESPONSE_DEFEATED',	'TXT_KEY_LEADER_YFS_YUEFEI_DEFEATED_%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_YFS_YUEFEI','RESPONSE_DECLAREWAR', 'TXT_KEY_LEADER_YFS_YUEFEI_DECLAREWAR_%','1');
--==========================================================================================================================	