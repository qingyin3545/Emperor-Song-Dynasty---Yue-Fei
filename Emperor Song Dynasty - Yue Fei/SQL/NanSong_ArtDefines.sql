--=========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT OR REPLACE INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('YFS_SONG_ATLAS', 						256, 		'yfsSongIcons256.dds',				8,				4),
			('YFS_SONG_ATLAS', 						128, 		'yfsSongIcons128.dds',				8, 				4),
			('YFS_SONG_ATLAS', 						80, 		'yfsSongIcons80.dds',				8, 				4),
			('YFS_SONG_ATLAS', 						64, 		'yfsSongIcons64.dds',				8, 				4),
			('YFS_SONG_ATLAS', 						45, 		'yfsSongIcons45.dds',				8, 				4),
			('YFS_SONG_ATLAS', 						32, 		'yfsSongIcons32.dds',				8, 				4),
			('YFS_SONG_ALPHA_ATLAS',				128, 		'yfs2SongAlpha128.dds',				1,				1),
			('YFS_SONG_ALPHA_ATLAS',				80, 		'yfs2SongAlpha80.dds',				1, 				1),
			('YFS_SONG_ALPHA_ATLAS',				64, 		'yfs2SongAlpha64.dds',				1, 				1),
			('YFS_SONG_ALPHA_ATLAS',				48, 		'yfs2SongAlpha48.dds',				1, 				1),
			('YFS_SONG_ALPHA_ATLAS',				32, 		'yfs2SongAlpha32.dds',				1, 				1),
			('YFS_SONG_ALPHA_ATLAS',				24, 		'yfs2SongAlpha24.dds',				1, 				1),
			('YFS_SONG_ALPHA_ATLAS',		 		16, 		'yfs2SongAlpha16.dds',				1, 				1),
			('YFS_UNIT_FLAG_ATLAS',					32,			'yfsUnitFlagAlpha32.dds',			4, 				4);
INSERT OR REPLACE INTO IconTextureAtlases	(Atlas, IconSize, Filename, IconsPerRow, IconsPerColumn) VALUES
			('promoVP_atlas_03', 					256, 		'promoVP_03_256.dds', 				'8', 			'8'),
			('promoVP_atlas_03', 					064, 		'promoVP_03_064.dds', 				'8', 			'8'),
			('promoVP_atlas_03', 					045, 		'promoVP_03_045.dds', 				'8', 			'8'),
			('promoVP_atlas_03', 					032, 		'promoVP_03_032.dds', 				'8', 			'8'),
			('promoVP_atlas_03', 					016, 		'promoVP_03_016.dds', 				'8', 			'8'),
			('extraPromo_Atlas', 					256, 		'extraPromo_256.dds', 				'8', 			'8'),
			('extraPromo_Atlas', 					064, 		'extraPromo_064.dds', 				'8', 			'8'),
			('extraPromo_Atlas', 					045, 		'extraPromo_045.dds', 				'8', 			'8'),
			('extraPromo_Atlas', 					032, 		'extraPromo_032.dds', 				'8', 			'8'),
			('extraPromo_Atlas', 					016, 		'extraPromo_016.dds', 				'8', 			'8');
--==========================================================================================================================
-- 堡寨
--==========================================================================================================================
INSERT OR REPLACE INTO IconTextureAtlases 
			(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('YFS_CASTLE_ATLAS', 				256, 		'yfsSong_UI_Icons256.dds',				4, 				2),
			('YFS_CASTLE_ATLAS', 				064, 		'yfsSong_UI_Icons064.dds',				4, 				2),
			('YFS_CASTLE_ATLAS', 				045, 		'yfsSong_UI_Icons045.dds',				4, 				2);
--=========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT INTO IconFontTextures 
			(IconFontTexture,					IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_YFS_LUXURIES',	'fonticons_wtx_newluxuries');
--=========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT INTO IconFontMapping
			(IconName,						IconFontTexture,					IconMapping) 
VALUES		('ICON_RES_YFS_GEKLIN',			'ICON_FONT_TEXTURE_YFS_LUXURIES',	1),
			('ICON_RES_YFS_RUKLIN',			'ICON_FONT_TEXTURE_YFS_LUXURIES',	2),
			('ICON_RES_YFS_OFFICALKLIN',	'ICON_FONT_TEXTURE_YFS_LUXURIES',	3),
			('ICON_RES_YFS_JUNKLIN',		'ICON_FONT_TEXTURE_YFS_LUXURIES',	4),
			('ICON_RES_YFS_DINGKLIN',		'ICON_FONT_TEXTURE_YFS_LUXURIES',	5);
--==========================================================================================================================
-- UnitArtDefines
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Beiwei_Cavalry
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_BEIWEI_CAVALRY',				DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_ELITE_RIDER';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
VALUES	('ART_DEF_UNIT_BEIWEI_CAVALRY', 			'ART_DEF_UNIT_MEMBER_BEIWEI_CAVALRY1',			3),
		('ART_DEF_UNIT_BEIWEI_CAVALRY', 			'ART_DEF_UNIT_MEMBER_BEIWEI_CAVALRY2',			3);

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_CAVALRY1',				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_CAVALRY1',				"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_CAVALRY1',			Scale,	ZOffset, Domain, 'BeiWei_Cavalry_v1.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_CAVALRY2',				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_CAVALRY2',				"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_CAVALRY2',			Scale,	ZOffset, Domain, 'BeiWei_Cavalry_v2.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_BEIWEI_CAVALRY',				'Unit', 	'SV_BeiWeiC.dds');
------------------------------------------------------------------------------------------------------------------------
-- Beiwei_Foot
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_BEIWEI_FOOT',					DamageStates, 	'DefaultMelee'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
VALUES	('ART_DEF_UNIT_BEIWEI_FOOT', 				'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT',					1),
		('ART_DEF_UNIT_BEIWEI_FOOT', 				'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT2',					2),
		('ART_DEF_UNIT_BEIWEI_FOOT', 				'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT4',					3),
		('ART_DEF_UNIT_BEIWEI_FOOT', 				'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT',					3),
		('ART_DEF_UNIT_BEIWEI_FOOT', 				'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT2',					2),
		('ART_DEF_UNIT_BEIWEI_FOOT', 				'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT4',					1);
		
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT',				Scale,	ZOffset, Domain, 'BeiWei_Foot.fxsxml',				MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

-- INSERT INTO ArtDefine_UnitMemberCombats 
-- 		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
-- SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT1',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
-- FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

-- INSERT INTO ArtDefine_UnitMemberCombatWeapons	
-- 		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
-- SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT1',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
-- FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

-- INSERT INTO ArtDefine_UnitMemberInfos 	
-- 		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
-- SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT1',				Scale,	ZOffset, Domain, 'BeiWei_Foot_v1.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
-- FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT3',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT3',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT3',				Scale,	ZOffset, Domain, 'BeiWeiShield3.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT2',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT2',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT2',				Scale,	ZOffset, Domain, 'BuRenJia_v1.fxsxml',				MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT4',					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT4',					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT4',				Scale,	ZOffset, Domain, 'BuRenJia_v2.fxsxml',				MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_NATIONAL_GUARD';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_BEIWEI_FOOT',				'Unit', 	'SV_BeiWeiF.dds');
------------------------------------------------------------------------------------------------------------------------
-- 殿前司御龙班直
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_DRAGON_FOOT',					DamageStates, 	'OffsetPikeman'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_NATIONAL_GUARD';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,					NumMembers)
VALUES	('ART_DEF_UNIT_DRAGON_FOOT', 				'ART_DEF_UNIT_MEMBER_BEIWEI_FOOT3',	6),
		('ART_DEF_UNIT_DRAGON_FOOT', 				'ART_DEF_UNIT_MEMBER_ZHUDUISHI1',	6);

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_DRAGON_FOOT',				'Unit', 	'yfs2SongAlpha128.dds');
------------------------------------------------------------------------------------------------------------------------
-- JieDuShi
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_SP_U_SONG_JIEDUSHI',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GENERAL';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
SELECT	'ART_DEF_UNIT_SP_U_SONG_JIEDUSHI', 			'ART_DEF_UNIT_MEMBER_SP_U_SONG_JIEDUSHI',		 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GENERAL';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_SP_U_SONG_JIEDUSHI',			EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SP_U_SONG_JIEDUSHI',			"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 											MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SP_U_SONG_JIEDUSHI',		Scale,	ZOffset, Domain, 'greatgeneral_early_jiedushi.fxsxml',				MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_EARLY';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_SP_U_SONG_JIEDUSHI',			'Unit', 	'SV_JieDuShi.dds');
------------------------------------------------------------------------------------------------------------------------
-- PWS
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_SP_U_PWS',					DamageStates,	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_VENETIAN_GALLEASS';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
SELECT	'ART_DEF_UNIT_SP_U_PWS', 					'ART_DEF_UNIT_MEMBER_SP_U_PWS',					 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_VENETIAN_GALLEASS';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_SP_U_PWS',						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_GALLEASS';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SP_U_PWS',						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_GALLEASS';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SP_U_PWS',					Scale,	ZOffset, Domain, 'U_PWS_v2.fxsxml',				MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_GALLEASS';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_SP_U_PWS',					'Unit', 	'SV_U_PWS.dds');
------------------------------------------------------------------------------------------------------------------------
-- FeiHu
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_SP_FEIHUCHUAN',				DamageStates, 	'TwoBigGuns'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_TRIREME';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
SELECT	'ART_DEF_UNIT_SP_FEIHUCHUAN', 				'ART_DEF_UNIT_MEMBER_SP_FEIHUCHUAN',			 2
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_TRIREME';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_SP_FEIHUCHUAN',				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SP_FEIHUCHUAN',				"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SP_FEIHUCHUAN',			Scale,	ZOffset, Domain, 'PWS_Chinese_Small.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_TRIREME';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_SP_FEIHUCHUAN',				'Unit', 	'SV_FeiHu.dds');
------------------------------------------------------------------------------------------------------------------------
-- SongFuChuan
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_SP_SONG_FUCHUAN',				DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_XP_PRIVATEER';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
SELECT	'ART_DEF_UNIT_SP_SONG_FUCHUAN', 			'ART_DEF_UNIT_MEMBER_SP_SONG_FUCHUAN',				 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_XP_PRIVATEER';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_SP_SONG_FUCHUAN',				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_XP_PRIVATEER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SP_SONG_FUCHUAN',				"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_XP_PRIVATEER';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,		ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SP_SONG_FUCHUAN',			Scale+0.02,	ZOffset, Domain, 'SongCargoNew.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_XP_PRIVATEER';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_SP_SONG_FUCHUAN',			'Unit', 	'SV_SFuChuan.dds');
------------------------------------------------------------------------------------------------------------------------
-- ZHUDUISHI
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_ZHUDUISHI',				    DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CROSSBOWMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
VALUES	('ART_DEF_UNIT_ZHUDUISHI', 			        'ART_DEF_UNIT_MEMBER_ZHUDUISHI1',			     6),
		('ART_DEF_UNIT_ZHUDUISHI', 			        'ART_DEF_UNIT_MEMBER_ZHUDUISHI2',			     6);

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_ZHUDUISHI1',				    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ZHUDUISHI1',				    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ZHUDUISHI1',			    Scale,	ZOffset, Domain, 'song_shenbigong_v1.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_ZHUDUISHI2',				    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ZHUDUISHI2',				    "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ZHUDUISHI2',			    Scale,	ZOffset, Domain, 'song_shenbigong_v2.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_ZHUDUISHI',				    'Unit', 	'SV_ZhuDuiShi.dds');
------------------------------------------------------------------------------------------------------------------------
-- SongJ20
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_SONG_J20',				    DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_JET_FIGHTER';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
SELECT	'ART_DEF_UNIT_SONG_J20', 				    'ART_DEF_UNIT_MEMBER_SONG_J20',			         1
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_JET_FIGHTER';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_SONG_J20',				        EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SONG_J20',				        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_JETFIGHTER';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_SONG_J20',			        Scale,	ZOffset, Domain, 'J20_NEW.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_JETFIGHTER';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_SONG_J20',				    'Unit', 	'SV_SJ20.dds');
------------------------------------------------------------------------------------------------------------------------
-- 赤心队骑
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_CHIXIN_CAVALRY',				DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_ELITE_RIDER';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
VALUES	('ART_DEF_UNIT_CHIXIN_CAVALRY', 			'ART_DEF_UNIT_MEMBER_CHIXIN_CAVALRY1',			6);
		--('ART_DEF_UNIT_CHIXIN_CAVALRY', 			'ART_DEF_UNIT_MEMBER_CHIXIN_CAVALRY2',			1);

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_CHIXIN_CAVALRY1',				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_CHIXIN_CAVALRY1',				"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_CHIXIN_CAVALRY1',			Scale,	ZOffset, Domain, 'yf_chixin1.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_CHIXIN_CAVALRY2',				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_CHIXIN_CAVALRY2',				"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 							MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_CHIXIN_CAVALRY2',			Scale,	ZOffset, Domain, 'yf_chixin_flag.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_ELITE_RIDER';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_CHIXIN_CAVALRY',				'Unit', 	'SV_ChiXinC.dds');
------------------------------------------------------------------------------------------------------------------------
-- 背嵬装甲
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_BEIWEI_ARMOR',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MODERN_ARMOR';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								NumMembers)
VALUES	('ART_DEF_UNIT_BEIWEI_ARMOR',				'ART_DEF_UNIT_MEMBER_BEIWEI_ARMOR',				3);

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_ARMOR',			EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MODERNARMOR';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_ARMOR',		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MODERNARMOR';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_BEIWEI_ARMOR',		Scale,	ZOffset, Domain, 'beiweiarmor.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MODERNARMOR';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_BEIWEI_ARMOR',		'Unit', 	'SV_BeiWeiC.dds');
------------------------------------------------------------------------------------------------------------------------
-- 赤心装甲
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_LOYALTY_ARMOR',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MODERN_ARMOR';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								NumMembers)
VALUES	('ART_DEF_UNIT_LOYALTY_ARMOR',				'ART_DEF_UNIT_MEMBER_LOYALTY_ARMOR',			3);

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_LOYALTY_ARMOR',		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MODERNARMOR';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOYALTY_ARMOR',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MODERNARMOR';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_LOYALTY_ARMOR',	Scale,	ZOffset, Domain, 'loyaltyarmor.fxsxml',		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MODERNARMOR';

INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_LOYALTY_ARMOR',		'Unit', 	'SV_ChiXinC.dds');
--==========================================================================================================================
-- LandmarkArtDefines
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- 堡寨
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 								LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_SONG_FORT1',	'Improvement', 	'YFS_FORT1'),
			('ART_DEF_IMPROVEMENT_SONG_FORT2',	'Improvement', 	'YFS_FORT2'),
			('ART_DEF_IMPROVEMENT_SONG_FORT3',	'Improvement', 	'YFS_FORT3');

INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 						Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,					TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_SONG_FORT1',		'Any', 	'UnderConstruction', 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort1_HB.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_SONG_FORT1',		'Any', 	'Constructed',		 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort1_B.fxsxml',  1),
			('ART_DEF_IMPROVEMENT_SONG_FORT1',		'Any', 	'Pillaged',			 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort1_PL.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_SONG_FORT2',		'Any', 	'UnderConstruction', 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort2_HB.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_SONG_FORT2',		'Any', 	'Constructed',		 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort2_B.fxsxml',  1),
			('ART_DEF_IMPROVEMENT_SONG_FORT2',		'Any', 	'Pillaged',			 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort2_PL.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_SONG_FORT3',		'Any', 	'UnderConstruction', 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort3_HB.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_SONG_FORT3',		'Any', 	'Constructed',		 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort3_B.fxsxml',  1),
			('ART_DEF_IMPROVEMENT_SONG_FORT3',		'Any', 	'Pillaged',			 0.3,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Song_Fort3_PL.fxsxml', 1);

INSERT INTO ArtDefine_StrategicView
			(StrategicViewType, 				TileType, 		Asset)
VALUES 		('ART_DEF_IMPROVEMENT_SONG_FORT1', 'Improvement', 	'SV_yfsSong_UI_Level1.dds'),
			('ART_DEF_IMPROVEMENT_SONG_FORT2', 'Improvement', 	'SV_yfsSong_UI_Level2.dds'),
			('ART_DEF_IMPROVEMENT_SONG_FORT3', 'Improvement', 	'SV_yfsSong_UI_Level3.dds');

