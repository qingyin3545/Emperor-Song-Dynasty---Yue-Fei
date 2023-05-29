--=========================================================================================================================
-- Assign Staring Plots
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS TNL_World_Civilization_StartingPlots(CivilizationType text REFERENCES Civilizations(Type), X integer default -1, Y integer default -1);
INSERT INTO TNL_World_Civilization_StartingPlots
			(CivilizationType,										X,		Y)
VALUES		('CIVILIZATION_YFS_SONG',			   					87,	   52);	
--VALUES		('CIVILIZATION_YFS_SONG',			   					84,	   64);	


CREATE TABLE IF NOT EXISTS TNL_EastAsia_Civilization_StartingPlots(CivilizationType text REFERENCES Civilizations(Type), X integer default -1, Y integer default -1);
INSERT INTO TNL_EastAsia_Civilization_StartingPlots
			(CivilizationType,										X,		Y)
VALUES		('CIVILIZATION_YFS_SONG',			   					92,	   66);	
--=========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT OR REPLACE INTO IconFontTextures 
			(IconFontTexture,					IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_EXTRA_PROMO',	'FontIcons_ExtraPromo'),
			('ICON_FONT_TEXTURE_PROMO_VP_03',	'FontIcons_promoVP_03');
--=========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT OR REPLACE INTO IconFontMapping
			(IconName,								IconFontTexture,					IconMapping) 
VALUES		('ICON_PROMOTION_EXTRA_PROMO_01',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	1),
			('ICON_PROMOTION_EXTRA_PROMO_02',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	2),
			('ICON_PROMOTION_EXTRA_PROMO_03',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	3),
			('ICON_PROMOTION_EXTRA_PROMO_04',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	4),
			('ICON_PROMOTION_EXTRA_PROMO_05',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	5),
			('ICON_PROMOTION_EXTRA_PROMO_06',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	6),
			('ICON_PROMOTION_EXTRA_PROMO_07',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	7),
			('ICON_PROMOTION_EXTRA_PROMO_08',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	8),
			('ICON_PROMOTION_EXTRA_PROMO_09',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	9),
			('ICON_PROMOTION_EXTRA_PROMO_10',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	10),
			('ICON_PROMOTION_EXTRA_PROMO_11',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	11),
			('ICON_PROMOTION_EXTRA_PROMO_12',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	12),
			('ICON_PROMOTION_EXTRA_PROMO_13',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	13),
			('ICON_PROMOTION_EXTRA_PROMO_14',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	14),
			('ICON_PROMOTION_EXTRA_PROMO_15',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	15),
			('ICON_PROMOTION_EXTRA_PROMO_16',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	16),
			('ICON_PROMOTION_EXTRA_PROMO_17',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	17),
			('ICON_PROMOTION_EXTRA_PROMO_18',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	18),
			('ICON_PROMOTION_EXTRA_PROMO_19',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	19),
			('ICON_PROMOTION_EXTRA_PROMO_20',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	20),
			('ICON_PROMOTION_EXTRA_PROMO_21',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	21),
			('ICON_PROMOTION_EXTRA_PROMO_22',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	22),
			('ICON_PROMOTION_EXTRA_PROMO_23',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	23),
			('ICON_PROMOTION_EXTRA_PROMO_24',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	24),
			('ICON_PROMOTION_EXTRA_PROMO_25',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	25),
			('ICON_PROMOTION_EXTRA_PROMO_26',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	26),
			('ICON_PROMOTION_EXTRA_PROMO_27',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	27),
			('ICON_PROMOTION_EXTRA_PROMO_28',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	28),
			('ICON_PROMOTION_EXTRA_PROMO_29',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	29),
			('ICON_PROMOTION_EXTRA_PROMO_30',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	30),
			('ICON_PROMOTION_EXTRA_PROMO_31',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	31),
			('ICON_PROMOTION_EXTRA_PROMO_32',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	70),
			('ICON_PROMOTION_EXTRA_PROMO_33',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	33),
			('ICON_PROMOTION_EXTRA_PROMO_34',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	34),
			('ICON_PROMOTION_EXTRA_PROMO_35',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	35),
			('ICON_PROMOTION_EXTRA_PROMO_36',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	36),
			('ICON_PROMOTION_EXTRA_PROMO_37',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	37),
			('ICON_PROMOTION_EXTRA_PROMO_38',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	38),
			('ICON_PROMOTION_EXTRA_PROMO_39',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	39),
			('ICON_PROMOTION_EXTRA_PROMO_40',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	40),
			('ICON_PROMOTION_EXTRA_PROMO_41',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	41),
			('ICON_PROMOTION_EXTRA_PROMO_42',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	42),
			('ICON_PROMOTION_EXTRA_PROMO_43',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	43),
			('ICON_PROMOTION_EXTRA_PROMO_44',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	44),
			('ICON_PROMOTION_EXTRA_PROMO_45',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	45),
			('ICON_PROMOTION_EXTRA_PROMO_46',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	46),
			('ICON_PROMOTION_EXTRA_PROMO_47',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	47),
			('ICON_PROMOTION_EXTRA_PROMO_48',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	48),
			('ICON_PROMOTION_EXTRA_PROMO_49',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	49),
			('ICON_PROMOTION_EXTRA_PROMO_50',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	50),
			('ICON_PROMOTION_EXTRA_PROMO_51',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	51),
			('ICON_PROMOTION_EXTRA_PROMO_52',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	52),
			('ICON_PROMOTION_EXTRA_PROMO_53',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	53),
			('ICON_PROMOTION_EXTRA_PROMO_54',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	54),
			('ICON_PROMOTION_EXTRA_PROMO_55',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	55),
			('ICON_PROMOTION_EXTRA_PROMO_56',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	56),
			('ICON_PROMOTION_EXTRA_PROMO_57',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	57),
			('ICON_PROMOTION_EXTRA_PROMO_58',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	58),
			('ICON_PROMOTION_EXTRA_PROMO_59',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	59),
			('ICON_PROMOTION_EXTRA_PROMO_60',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	60),
			('ICON_PROMOTION_EXTRA_PROMO_61',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	61),
			('ICON_PROMOTION_EXTRA_PROMO_62',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	62),
			('ICON_PROMOTION_EXTRA_PROMO_63',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	63),
			('ICON_PROMOTION_EXTRA_PROMO_64',		'ICON_FONT_TEXTURE_EXTRA_PROMO', 	64),

			('ICON_PROMOTION_PROMO_VP_03_01',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	1),
			('ICON_PROMOTION_PROMO_VP_03_02',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	2),
			('ICON_PROMOTION_PROMO_VP_03_03',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	3),
			('ICON_PROMOTION_PROMO_VP_03_04',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	4),
			('ICON_PROMOTION_PROMO_VP_03_05',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	5),
			('ICON_PROMOTION_PROMO_VP_03_06',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	6),
			('ICON_PROMOTION_PROMO_VP_03_07',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	7),
			('ICON_PROMOTION_PROMO_VP_03_08',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	8),
			('ICON_PROMOTION_PROMO_VP_03_09',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	9),
			('ICON_PROMOTION_PROMO_VP_03_10',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	10),
			('ICON_PROMOTION_PROMO_VP_03_11',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	11),
			('ICON_PROMOTION_PROMO_VP_03_12',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	12),
			('ICON_PROMOTION_PROMO_VP_03_13',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	13),
			('ICON_PROMOTION_PROMO_VP_03_14',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	14),
			('ICON_PROMOTION_PROMO_VP_03_15',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	15),
			('ICON_PROMOTION_PROMO_VP_03_16',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	16),
			('ICON_PROMOTION_PROMO_VP_03_17',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	17),
			('ICON_PROMOTION_PROMO_VP_03_18',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	18),
			('ICON_PROMOTION_PROMO_VP_03_19',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	19),
			('ICON_PROMOTION_PROMO_VP_03_20',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	20),
			('ICON_PROMOTION_PROMO_VP_03_21',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	21),
			('ICON_PROMOTION_PROMO_VP_03_22',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	22),
			('ICON_PROMOTION_PROMO_VP_03_23',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	23),
			('ICON_PROMOTION_PROMO_VP_03_24',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	24),
			('ICON_PROMOTION_PROMO_VP_03_25',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	25),
			('ICON_PROMOTION_PROMO_VP_03_26',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	26),
			('ICON_PROMOTION_PROMO_VP_03_27',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	27),
			('ICON_PROMOTION_PROMO_VP_03_28',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	28),
			('ICON_PROMOTION_PROMO_VP_03_29',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	29),
			('ICON_PROMOTION_PROMO_VP_03_30',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	30),
			('ICON_PROMOTION_PROMO_VP_03_31',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	31),
			('ICON_PROMOTION_PROMO_VP_03_32',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	70),
			('ICON_PROMOTION_PROMO_VP_03_33',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	33),
			('ICON_PROMOTION_PROMO_VP_03_34',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	34),
			('ICON_PROMOTION_PROMO_VP_03_35',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	35),
			('ICON_PROMOTION_PROMO_VP_03_36',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	36),
			('ICON_PROMOTION_PROMO_VP_03_37',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	37),
			('ICON_PROMOTION_PROMO_VP_03_38',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	38),
			('ICON_PROMOTION_PROMO_VP_03_39',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	39),
			('ICON_PROMOTION_PROMO_VP_03_40',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	40),
			('ICON_PROMOTION_PROMO_VP_03_41',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	41),
			('ICON_PROMOTION_PROMO_VP_03_42',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	42),
			('ICON_PROMOTION_PROMO_VP_03_43',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	43),
			('ICON_PROMOTION_PROMO_VP_03_44',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	44),
			('ICON_PROMOTION_PROMO_VP_03_45',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	45),
			('ICON_PROMOTION_PROMO_VP_03_46',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	46),
			('ICON_PROMOTION_PROMO_VP_03_47',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	47),
			('ICON_PROMOTION_PROMO_VP_03_48',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	48),
			('ICON_PROMOTION_PROMO_VP_03_49',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	49),
			('ICON_PROMOTION_PROMO_VP_03_50',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	50),
			('ICON_PROMOTION_PROMO_VP_03_51',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	51),
			('ICON_PROMOTION_PROMO_VP_03_52',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	52),
			('ICON_PROMOTION_PROMO_VP_03_53',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	53),
			('ICON_PROMOTION_PROMO_VP_03_54',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	54),
			('ICON_PROMOTION_PROMO_VP_03_55',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	55),
			('ICON_PROMOTION_PROMO_VP_03_56',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	56),
			('ICON_PROMOTION_PROMO_VP_03_57',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	57),
			('ICON_PROMOTION_PROMO_VP_03_58',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	58),
			('ICON_PROMOTION_PROMO_VP_03_59',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	59),
			('ICON_PROMOTION_PROMO_VP_03_60',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	60),
			('ICON_PROMOTION_PROMO_VP_03_61',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	61),
			('ICON_PROMOTION_PROMO_VP_03_62',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	62),
			('ICON_PROMOTION_PROMO_VP_03_63',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	63),
			('ICON_PROMOTION_PROMO_VP_03_64',		'ICON_FONT_TEXTURE_PROMO_VP_03', 	64);

UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_01]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 0;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_02]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 1;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_03]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 2;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_04]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 3;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_05]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 4;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_06]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 5;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_07]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 6;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_08]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 7;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_09]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 8;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_10]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 9;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_11]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 10;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_12]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 11;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_13]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 12;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_14]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 13;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_15]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 14;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_16]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 15;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_17]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 16;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_18]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 17;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_19]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 18;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_20]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 19;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_21]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 20;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_22]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 21;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_23]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 22;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_24]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 23;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_25]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 24;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_26]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 25;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_27]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 26;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_28]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 27;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_29]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 28;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_30]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 29;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_31]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 30;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_32]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 31;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_33]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 32;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_34]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 33;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_35]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 34;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_36]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 35;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_37]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 36;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_38]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 37;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_39]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 38;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_40]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 39;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_41]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 40;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_42]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 41;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_43]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 42;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_44]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 43;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_45]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 44;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_46]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 45;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_47]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 46;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_48]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 47;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_49]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 48;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_50]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 49;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_51]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 50;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_52]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 51;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_53]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 52;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_54]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 53;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_55]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 54;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_56]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 55;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_57]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 56;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_58]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 57;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_59]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 58;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_60]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 59;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_61]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 60;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_62]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 61;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_63]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 62;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_EXTRA_PROMO_64]'	WHERE IconAtlas = 'extraPromo_Atlas'	AND PortraitIndex = 63;

UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_01]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 0;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_02]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 1;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_03]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 2;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_04]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 3;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_05]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 4;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_06]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 5;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_07]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 6;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_08]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 7;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_09]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 8;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_10]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 9;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_11]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 10;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_12]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 11;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_13]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 12;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_14]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 13;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_15]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 14;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_16]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 15;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_17]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 16;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_18]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 17;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_19]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 18;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_20]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 19;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_21]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 20;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_22]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 21;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_23]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 22;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_24]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 23;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_25]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 24;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_26]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 25;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_27]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 26;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_28]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 27;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_29]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 28;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_30]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 29;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_31]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 30;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_32]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 31;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_33]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 32;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_34]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 33;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_35]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 34;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_36]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 35;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_37]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 36;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_38]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 37;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_39]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 38;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_40]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 39;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_41]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 40;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_42]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 41;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_43]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 42;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_44]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 43;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_45]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 44;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_46]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 45;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_47]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 46;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_48]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 47;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_49]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 48;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_50]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 49;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_51]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 50;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_52]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 51;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_53]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 52;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_54]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 53;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_55]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 54;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_56]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 55;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_57]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 56;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_58]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 57;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_59]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 58;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_60]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 59;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_61]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 60;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_62]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 61;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_63]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 62;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_PROMO_VP_03_64]'	WHERE IconAtlas = 'promoVP_atlas_03'	AND PortraitIndex = 63;

UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_ELITE]'           WHERE (IconAtlas = 'SP_PROMOTION_OLD_ATLAS' OR IconAtlas = 'SPPROMOTION_ATLAS') AND PortraitIndex = 18;
UPDATE UnitPromotions SET IconStringSP = '[ICON_PROMOTION_GROUP]'           WHERE (IconAtlas = 'SP_PROMOTION_OLD_ATLAS' OR IconAtlas = 'SPPROMOTION_ATLAS') AND PortraitIndex = 20;
