print("---------------------------------------------------------------")
print("------------------NanSongCombat Lua Loaded---------------------")
print("---------------------------------------------------------------")

include("FLuaVector.lua")
include("CombatPercent_Misc.lua")
include("PlotIterators")
-- SP Code
include("UtilityFunctions")

-- SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "NanSong_YueFei";

-- 黄天荡及背嵬步军、骑军效果
local g_DoNanSong = nil;
local NanSongSeaUnitID = GameInfo.UnitPromotions["PROMOTION_NANSONG_SEA"].ID
local SiegeUnitID = GameInfo.UnitPromotions["PROMOTION_CITY_SIEGE"].ID
local SplashUnitID = GameInfo.UnitPromotions["PROMOTION_SPLASH_DAMAGE"].ID
local BeiWeiFootID = GameInfo.UnitPromotions["PROMOTION_BEIWEI_FOOT"].ID

local BeiWeiCavalryID = GameInfo.UnitPromotions["PROMOTION_YUEJIAJUN"].ID
local ChiXinCavalryID = GameInfo.UnitPromotions["PROMOTION_CHIXINDUI1"].ID
local ChiXinEffectID = GameInfo.UnitPromotions["PROMOTION_CHIXINDUI1_EFFECT"].ID

local JieDuShiPreID = GameInfo.UnitPromotions["PROMOTION_JIEDUSHI_PRE"].ID
local JieDuShiEffectID = GameInfo.UnitPromotions["PROMOTION_JIEDUSHI_EFFECT"].ID

local UpwsID = GameInfo.UnitPromotions["PROMOTION_U_PWS"].ID
local ArcheryUnitID = GameInfo.UnitPromotions["PROMOTION_ARCHERY_COMBAT"].ID

local Penetration1ID = GameInfo.UnitPromotions["PROMOTION_PENETRATION_1"].ID
local Penetration2ID = GameInfo.UnitPromotions["PROMOTION_PENETRATION_2"].ID
local SlowDown1ID = GameInfo.UnitPromotions["PROMOTION_MOVEMENT_LOST_1"].ID
local SlowDown2ID = GameInfo.UnitPromotions["PROMOTION_MOVEMENT_LOST_2"].ID
local MoralWeaken1ID = GameInfo.UnitPromotions["PROMOTION_MORAL_WEAKEN_1"].ID
local MoralWeaken2ID = GameInfo.UnitPromotions["PROMOTION_MORAL_WEAKEN_2"].ID
local LoseSupplyID = GameInfo.UnitPromotions["PROMOTION_LOSE_SUPPLY"].ID
local Damage1ID = GameInfo.UnitPromotions["PROMOTION_DAMAGE_1"].ID
local Damage2ID = GameInfo.UnitPromotions["PROMOTION_DAMAGE_2"].ID

local RangeBanID = GameInfo.UnitPromotions["PROMOTION_RANGE_BAN"].ID

local J20PID = GameInfo.UnitPromotions["PROMOTION_CHUAIMEN"].ID

local AntiAirID = GameInfo.UnitPromotions["PROMOTION_ANTI_AIR"].ID
local NavalRangedCruiserUnitID = GameInfo.UnitPromotions["PROMOTION_NAVAL_RANGED_CRUISER"].ID
local DestroyerID = GameInfo.UnitPromotions["PROMOTION_DESTROYER_COMBAT"].ID

local GunpowderInfantryUnitID = GameInfo.UnitPromotions["PROMOTION_GUNPOWDER_INFANTRY_COMBAT"].ID
local InfantryUnitID = GameInfo.UnitPromotions["PROMOTION_INFANTRY_COMBAT"].ID
--local KnightID = GameInfo.UnitPromotions["PROMOTION_KNIGHT_COMBAT"].ID
--local TankID = GameInfo.UnitPromotions["PROMOTION_TANK_COMBAT"].ID	
--local Charge1ID = GameInfo.UnitPromotions["PROMOTION_CHARGE_1"].ID
--local Charge2ID = GameInfo.UnitPromotions["PROMOTION_CHARGE_2"].ID
--local Charge3ID = GameInfo.UnitPromotions["PROMOTION_CHARGE_3"].ID
function NanSongStarted(iType, iPlotX, iPlotY)
	if iType == GameInfoTypes["BATTLETYPE_MELEE"]
	or iType == GameInfoTypes["BATTLETYPE_RANGED"]
	or iType == GameInfoTypes["BATTLETYPE_AIR"]
	or iType == GameInfoTypes["BATTLETYPE_SWEEP"]
	then
		g_DoNanSong = {
			attPlayerID = -1,
			attUnitID   = -1,
			defPlayerID = -1,
			defUnitID   = -1,
			attODamage  = 0,
			defODamage  = 0,
			PlotX = iPlotX,
			PlotY = iPlotY,
			bIsCity = false,
			defCityID = -1,
			battleType = iType,
		};
		--print("战斗开始.")
	end
end

GameEvents.BattleStarted.Add(NanSongStarted);
function NanSongJoined(iPlayer, iUnitOrCity, iRole, bIsCity)
	if g_DoNanSong == nil
	or Players[ iPlayer ] == nil or not Players[ iPlayer ]:IsAlive()
	or (not bIsCity and Players[ iPlayer ]:GetUnitByID(iUnitOrCity) == nil)
	or (bIsCity and (Players[ iPlayer ]:GetCityByID(iUnitOrCity) == nil or iRole == GameInfoTypes["BATTLEROLE_ATTACKER"]))
	or iRole == GameInfoTypes["BATTLEROLE_BYSTANDER"]
	then
		return;
	end
	if bIsCity then
		g_DoNanSong.defPlayerID = iPlayer;
		g_DoNanSong.defCityID = iUnitOrCity;
		g_DoNanSong.bIsCity = bIsCity;
	elseif iRole == GameInfoTypes["BATTLEROLE_ATTACKER"] then
		g_DoNanSong.attPlayerID = iPlayer;
		g_DoNanSong.attUnitID = iUnitOrCity;
		g_DoNanSong.attODamage = Players[ iPlayer ]:GetUnitByID(iUnitOrCity):GetDamage();
	elseif iRole == GameInfoTypes["BATTLEROLE_DEFENDER"] or iRole == GameInfoTypes["BATTLEROLE_INTERCEPTOR"] then
		g_DoNanSong.defPlayerID = iPlayer;
		g_DoNanSong.defUnitID = iUnitOrCity;
		g_DoNanSong.defODamage = Players[ iPlayer ]:GetUnitByID(iUnitOrCity):GetDamage();
		-- 背嵬骑军加入战斗时战斗力变化
		local pUnit = Players[ g_DoNanSong.defPlayerID ]:GetUnitByID( g_DoNanSong.defUnitID );
		if not pUnit:IsDead() and  pUnit:IsHasPromotion(BeiWeiCavalryID) then
			local iCombat = 0
			local pUnitHP = pUnit:GetCurrHitPoints() 
			local maxpUnitHP = pUnit:GetMaxHitPoints()
			local factor = 1 - pUnitHP / maxpUnitHP + 0.01
			local combatfactor = math.tan(math.pi * factor / 2)
			local aCS = GameInfo.Units[pUnit:GetUnitType()].Combat
			iCombat = aCS * (1 + combatfactor)
			-- pUnit:SetBaseCombatStrength(iCombat)
			SPUEAddCombatBonus(pUnit, 100 * combatfactor)
			print("BeiWeiCavalryCombatStrength:"..iCombat)
		end

	end
end
GameEvents.BattleJoined.Add(NanSongJoined);
function NanSongEffect()
 	 --Defines and status checks
	if g_DoNanSong == nil or Players[ g_DoNanSong.defPlayerID ] == nil
	or Players[ g_DoNanSong.attPlayerID ] == nil or not Players[ g_DoNanSong.attPlayerID ]:IsAlive()
	or Players[ g_DoNanSong.attPlayerID ]:GetUnitByID(g_DoNanSong.attUnitID) == nil
	-- or Players[ g_DoNanSong.attPlayerID ]:GetUnitByID(g_DoNanSong.attUnitID):IsDead()
	or Map.GetPlot(g_DoNanSong.PlotX, g_DoNanSong.PlotY) == nil
	then
		return;
	end
	
	local attPlayerID = g_DoNanSong.attPlayerID;
	local attPlayer = Players[ attPlayerID ];
	local defPlayerID = g_DoNanSong.defPlayerID;
	local defPlayer = Players[ defPlayerID ];
	
	local attUnit = attPlayer:GetUnitByID(g_DoNanSong.attUnitID);
	local attPlot = attUnit:GetPlot();
	
	local plotX = g_DoNanSong.PlotX;
	local plotY = g_DoNanSong.PlotY;
	local batPlot = Map.GetPlot(plotX, plotY);
	local batType = g_DoNanSong.battleType;
	
	local bIsCity = g_DoNanSong.bIsCity;
	local defUnit = nil;
	local defPlot = nil;
	local defCity = nil;
	
	local attFinalUnitDamage = attUnit:GetDamage();
	local defFinalUnitDamage = 0;
	local attUnitDamage = attFinalUnitDamage - g_DoNanSong.attODamage;
	local defUnitDamage = 0;
	
	if not bIsCity and defPlayer:GetUnitByID(g_DoNanSong.defUnitID) then
		defUnit = defPlayer:GetUnitByID(g_DoNanSong.defUnitID);
		defPlot = defUnit:GetPlot();
		defFinalUnitDamage = defUnit:GetDamage();
		defUnitDamage = defFinalUnitDamage - g_DoNanSong.defODamage;
	elseif bIsCity and defPlayer:GetCityByID(g_DoNanSong.defCityID) then
		defCity = defPlayer:GetCityByID(g_DoNanSong.defCityID);
	end
	
	g_DoNanSong = nil;
		--Complex Effects Only for Human VS AI(reduce time and enhance stability)
	if not attPlayer:IsHuman() and not defPlayer:IsHuman() then
		return;
	end

	-- Not for Barbarins
	if attPlayer:IsBarbarian() then
		return;
	end

	------背嵬步军“眩晕效果”	
	
	if not bIsCity and defUnit:IsHasPromotion(BeiWeiFootID) and attUnit:GetDomainType() == DomainTypes.DOMAIN_LAND then
		if not attUnit:IsHasPromotion(SiegeUnitID) or not attUnit:IsHasPromotion(SplashUnitID) then
			attUnit:SetMoves(0)
			Message = 1
			print ("Attacker Stopped!")	
			if defPlayer:IsHuman() then
				Events.GameplayAlertMessage( Locale.ConvertTextKey( "TXT_KEY_BEIWEI_FOOT_LOST_MOVEMENT", attUnit:GetName(), defUnit:GetName()))
			end
			if attPlayer:IsHuman() then
				Events.GameplayAlertMessage( Locale.ConvertTextKey( "TXT_KEY_BEIWEI_FOOT_LOST_MOVEMENT_ATT", attUnit:GetName(), defUnit:GetName()))
			end
		end	
	end

   ------黄天荡减少一半移动力

   if not bIsCity then
   if  not defUnit:IsDead() and attUnit:IsHasPromotion(NanSongSeaUnitID) then
		local defMoves = defUnit:GetMoves()
		print ("defUnit:GetMoves()"..defMoves)	
		if defMoves > 0 then
			local newMoves = defMoves / 2
			defUnit:SetMoves(newMoves)
			if attPlayer:IsHuman() then
				local ht_text = Locale.ConvertTextKey( "TXT_KEY_HUANGTIANDANG_ATT", attUnit:GetName(), defUnit:GetName()) .. math.ceil(newMoves / 60) ..  Locale.ConvertTextKey("TXT_KEY_HUANGTIANDANG")
				Events.GameplayAlertMessage(ht_text)
			end
			if defPlayer:IsHuman() then
				local ht_text = Locale.ConvertTextKey( "TXT_KEY_HUANGTIANDANG_DEF", attUnit:GetName(), defUnit:GetName()) .. math.floor(newMoves / 60) ..  Locale.ConvertTextKey("TXT_KEY_HUANGTIANDANG")
				Events.GameplayAlertMessage(ht_text)
			end

		end
	end
	end

	------撼山易，撼岳家军难效果
	------进攻时对敌人伤害随血量减少增加
	local iDamage = 0
	local attUnitHP = attUnit:GetCurrHitPoints() 
	local maxattUnitHP = attUnit:GetMaxHitPoints()
	local factor = 1 - attUnitHP / maxattUnitHP + 0.01
	local damagefactor = math.tan(math.pi * factor / 2)
	print('maxattUnitHP'..maxattUnitHP)
	print('attUnitHP'..attUnitHP)
	if not attUnit:IsDead() and batType == GameInfoTypes["BATTLETYPE_MELEE"]
	and attUnit:IsHasPromotion(BeiWeiCavalryID) then
		if not bIsCity then
		if defUnit:IsDead() then
			attUnit:SetMoves(attUnit:MovesLeft()+GameDefines["MOVE_DENOMINATOR"]);
		elseif not defUnit:IsDead() then
			iDamage = defUnit:GetDamage() * (0 + damagefactor);
			print('defUnit:GetDamage()'..defUnit:GetDamage())
			print('iDamage'..iDamage)

			defUnit:SetHasPromotion(MoralWeaken1ID, true);
			defUnit:SetHasPromotion(MoralWeaken2ID, true);
			defUnit:ChangeDamage(iDamage, attPlayerID);
			if attPlayer:IsHuman() then
				local bc_text = Locale.ConvertTextKey( "TXT_KEY_BC_UNIT_ATT", attUnit:GetName(), defUnit:GetName()) .. math.floor(iDamage * damagefactor / (0 + damagefactor)) ..  Locale.ConvertTextKey("TXT_KEY_BC_FINAL")
				Events.GameplayAlertMessage(bc_text)
			end
			if defPlayer:IsHuman() then
				local bc_text = Locale.ConvertTextKey( "TXT_KEY_BC_UNIT_DEF", attUnit:GetName(), defUnit:GetName()) .. math.floor(iDamage * damagefactor / (0 + damagefactor)) ..  Locale.ConvertTextKey("TXT_KEY_BC_FINAL")
				Events.GameplayAlertMessage(bc_text)
			end
		end
		end
		if defCity and bIsCity then
			iDamage = defCity:GetDamage() * (0 + damagefactor);
			print('defCity:GetDamage()'..defCity:GetDamage())
			print('iDamage'..iDamage)
			defCity:ChangeDamage(iDamage, attPlayerID);
			if attPlayer:IsHuman() then
				local bc_text = Locale.ConvertTextKey( "TXT_KEY_BC_CITY_ATT", attUnit:GetName(), defCity:GetName())
				 .. math.floor(iDamage * damagefactor / (0 + damagefactor)) ..  Locale.ConvertTextKey("TXT_KEY_BC_FINAL")
				Events.GameplayAlertMessage(bc_text)
			end
			if defPlayer:IsHuman() then
				local bc_text = Locale.ConvertTextKey( "TXT_KEY_BC_CITY_DEF", attUnit:GetName(), defCity:GetName())
				 .. math.floor(iDamage * damagefactor / (0 + damagefactor)) ..  Locale.ConvertTextKey("TXT_KEY_BC_FINAL")
				Events.GameplayAlertMessage(bc_text)
			end
		end
	end

	if not bIsCity then
	local defUnitHP = defUnit:GetCurrHitPoints() 
	local maxdefUnitHP = defUnit:GetMaxHitPoints()
	local factor = 1 - attUnitHP / maxattUnitHP + 0.01
	local damagefactor = math.tan(math.pi * factor / 2)
	------受到陆军近战部队攻击时
	if not attUnit:IsDead() and not defUnit:IsDead() and batType == GameInfoTypes["BATTLETYPE_MELEE"]
	and defUnit:IsHasPromotion(BeiWeiCavalryID) then
		iDamage = attUnit:GetDamage() * (0 + damagefactor);
		attUnit:ChangeDamage(iDamage, defPlayerID);
		attUnit:SetHasPromotion(MoralWeaken1ID, true);
		attUnit:SetHasPromotion(MoralWeaken2ID, true);
		if defPlayer:IsHuman() then
			local bc_text = Locale.ConvertTextKey( "TXT_KEY_BC_UNIT_ATT", defUnit:GetName(), attUnit:GetName())
			 .. math.floor(iDamage * damagefactor / (0 + damagefactor)) ..  Locale.ConvertTextKey("TXT_KEY_BC_FINAL")
			Events.GameplayAlertMessage(bc_text)
		end
		if attPlayer:IsHuman() then
			local bc_text = Locale.ConvertTextKey( "TXT_KEY_BC_UNIT_DEF", defUnit:GetName(), attUnit:GetName())
			 .. math.floor(iDamage * damagefactor / (0 + damagefactor)) ..  Locale.ConvertTextKey("TXT_KEY_BC_FINAL")
			Events.GameplayAlertMessage(bc_text)
		end
	end
	------受到陆军远程部队攻击时
	if attUnit:IsHasPromotion(ArcheryUnitID) and batType == GameInfoTypes["BATTLETYPE_RANGED"]
	and defUnit:IsHasPromotion(BeiWeiCavalryID) then
		defUnit:SetMoves(defUnit:MovesLeft()+GameDefines["MOVE_DENOMINATOR"]);

		attUnit:SetHasPromotion(MoralWeaken1ID, true);
		attUnit:SetHasPromotion(MoralWeaken2ID, true);
		attUnit:SetHasPromotion(RangeBanID, true);
	end
	end

	------天下太平
	if not bIsCity then
		if attUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_JIEDUSHI_EFFECT"].ID) 
		and (defUnitDamage >= 40 or defUnit:IsDead() or defFinalUnitDamage >= defUnit:GetMaxHitPoints()) then
			local iGold = 2 * defUnit:GetBaseCombatStrength()
			attPlayer:ChangeGold(iGold)
			local hex = ToHexFromGrid(Vector2(plotX, plotY))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_YIELD_GOLD]+{1_Num}[ENDCOLOR] [ICON_GOLD]", iGold))
		end
		if defUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_JIEDUSHI_EFFECT"].ID) 
		and (attUnitDamage >= 40 or attUnit:IsDead() or attFinalUnitDamage >= attUnit:GetMaxHitPoints()) then
			local iGold = 2 * attUnit:GetBaseCombatStrength()
			defPlayer:ChangeGold(iGold)
			local hex = ToHexFromGrid(Vector2(plotX, plotY))
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_YIELD_GOLD]+{1_Num}[ENDCOLOR] [ICON_GOLD]", iGold))
		end
	end
	-----------------------------------------
	--- 歼20踹门效果:10格内驱逐舰、巡洋舰、空军和陆地防空系统瘫痪
	-----------------------------------------
	if attUnit:IsHasPromotion(J20PID) then
    local pTeam = Teams[defPlayer:GetTeam()]
    if defCity then
    defCity:ChangeResistanceTurns(1);
    print("J20 City!");
    end
    local unitCount = batPlot:GetNumUnits();
    if unitCount > 0 then
    for i = 0, unitCount-1, 1 do
        local pFoundUnit = batPlot:GetUnit(i)
        if pFoundUnit then
		local pPlayer = Players[pFoundUnit:GetOwner()]
		if PlayersAtWar(attPlayer, pPlayer) then
        if (pFoundUnit:IsHasPromotion(AntiAirID) or pFoundUnit:GetDomainType() == DomainTypes.DOMAIN_AIR or 
		pFoundUnit:IsHasPromotion(NavalRangedCruiserUnitID) or pFoundUnit:IsHasPromotion(DestroyerID)) 
        then
            pFoundUnit:SetMoves(0);
            print("J20 same tile Unit!");
        end
		end
		end
    end

    local uniqueRange = 10
	for dx = -uniqueRange, uniqueRange, 1 do
	
		for dy = -uniqueRange, uniqueRange, 1 do
            local adjPlot = Map.PlotXYWithRangeCheck(plotX, plotY, dx, dy, uniqueRange);
            if (adjPlot ~= nil) then
                if adjPlot:IsCity() then
                    adjPlot:GetPlotCity():ChangeResistanceTurns(1);
                    print("J20 around City!");
                end
                unitCount = adjPlot:GetNumUnits();
                if unitCount > 0 then
                    for i = 0, unitCount-1, 1 do
                        local pFoundUnit = adjPlot:GetUnit(i);
						if pFoundUnit then
						local pPlayer = Players[pFoundUnit:GetOwner()]
						if PlayersAtWar(attPlayer, pPlayer) then
						if (pFoundUnit:IsHasPromotion(AntiAirID) or pFoundUnit:GetDomainType() == DomainTypes.DOMAIN_AIR or 
						pFoundUnit:IsHasPromotion(NavalRangedCruiserUnitID) or pFoundUnit:IsHasPromotion(DestroyerID)) then
                            pFoundUnit:SetMoves(0);
                            print("J20 around Unit!");
                        end
						end
						end
                    end
                end
            end
        end
    end
    end
    
    -- Notification
    if     defPlayer:IsHuman() then
    local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_US_J20_SHORT")
    local text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_US_J20")
    defPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC , text, heading, plotX, plotY)
    elseif attPlayer:IsHuman() then
    local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_ENEMY_J20_SHORT")
    local text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_ENEMY_J20")
    attPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC , text, heading, plotX, plotY)
    end
	end

	------车船AOE,照抄
	if (attUnit:IsHasPromotion(UpwsID)) then
	
	for i = 0, 5 do
		local adjPlot = Map.PlotDirection(plotX, plotY, i)
		if (adjPlot ~= nil and not adjPlot:IsCity()) then
			print("Available for AOE Damage!")
			local unitCount = adjPlot:GetNumUnits();
            if unitCount > 0 then
            for i = 0, unitCount-1, 1 do
			local pUnit = adjPlot:GetUnit(i) ------------Find Units affected
			if pUnit and (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND or pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA) then
				local pCombat = pUnit:GetBaseCombatStrength()
				local pPlayer = Players[pUnit:GetOwner()]
				
				if PlayersAtWar(attPlayer, pPlayer) then
					local SplashDamageOri = attUnit:GetRangeCombatDamage(pUnit,nil,false)
						
					local AOEmod = 0.33   -- the percent of damage reducing to nearby units
						
					local text = nil;
					local attUnitName = attUnit:GetName();
					local defUnitName = pUnit:GetName();
						
					local SplashDamageFinal = math.floor(SplashDamageOri * AOEmod); -- Set the Final Damage
					if     SplashDamageFinal >= pUnit:GetCurrHitPoints() then
						SplashDamageFinal = pUnit:GetCurrHitPoints();
						local eUnitType = pUnit:GetUnitType();
						UnitDeathCounter(attPlayerID, pUnit:GetOwner(), eUnitType);
							
						-- Notification
						if     defPlayerID == Game.GetActivePlayer() then
							-- local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_UNIT_DESTROYED_SHORT")
							text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_DEATH", attUnitName, defUnitName);
							-- defPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC , text, heading, plotX, plotY)
						elseif attPlayerID == Game.GetActivePlayer() then
							text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_ENEMY_DEATH", attUnitName, defUnitName);
						end
					elseif SplashDamageFinal > 0 then
						-- Notification
						if     defPlayerID == Game.GetActivePlayer() then
							text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE", attUnitName, defUnitName, SplashDamageFinal);
						elseif attPlayerID == Game.GetActivePlayer() then
							text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_SPLASH_DAMAGE_ENEMY", attUnitName, defUnitName, SplashDamageFinal);
						end
					end
					if text then
						Events.GameplayAlertMessage( text );
					end
					pUnit:ChangeDamage(SplashDamageFinal, attPlayer)
					print("Splash Damage="..SplashDamageFinal)
				end
			end
			end
			end
		end
	end
	end
	-----------------------------------------------------------------------
	---- 赤心队：阵亡
	----------------------------------------------------------------------
	if attUnit:IsHasPromotion(ChiXinCavalryID) and (attUnit:IsDead() or attUnit:GetDamage() >=  attUnit:GetMaxHitPoints() )then
		local hex = ToHexFromGrid(Vector2(attUnit:GetX(), attUnit:GetY()))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("TXT_KEY_PROMOTION_CHIXINDUI1_DEAD"))
		for pFoundUnit in attPlayer:Units() do
			if IsNotEliteUnit(pFoundUnit) then
				pFoundUnit:SetHasPromotion(Penetration1ID, true)
				pFoundUnit:SetHasPromotion(Penetration2ID, true)
				pFoundUnit:SetHasPromotion(SlowDown1ID, true)
				pFoundUnit:SetHasPromotion(SlowDown2ID, true)
				pFoundUnit:SetHasPromotion(MoralWeaken1ID, true)
				pFoundUnit:SetHasPromotion(MoralWeaken2ID, true)
				pFoundUnit:SetHasPromotion(LoseSupplyID, true)
				pFoundUnit:SetHasPromotion(Damage1ID, true)
				pFoundUnit:SetHasPromotion(Damage2ID, true)
			end
		end
	end

	if defUnit ~= nil and defUnit:IsHasPromotion(ChiXinCavalryID) and (defUnit:IsDead() or defUnit:GetDamage() >=  defUnit:GetMaxHitPoints() )then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("TXT_KEY_PROMOTION_CHIXINDUI1_DEAD"))
		for pFoundUnit in defPlayer:Units() do
			if IsNotEliteUnit(pFoundUnit) then
				pFoundUnit:SetHasPromotion(Penetration1ID, true)
				pFoundUnit:SetHasPromotion(Penetration2ID, true)
				pFoundUnit:SetHasPromotion(SlowDown1ID, true)
				pFoundUnit:SetHasPromotion(SlowDown2ID, true)
				pFoundUnit:SetHasPromotion(MoralWeaken1ID, true)
				pFoundUnit:SetHasPromotion(MoralWeaken2ID, true)
				pFoundUnit:SetHasPromotion(LoseSupplyID, true)
				pFoundUnit:SetHasPromotion(Damage1ID, true)
				pFoundUnit:SetHasPromotion(Damage2ID, true)
			end
		end
	end

	 
end
GameEvents.BattleFinished.Add(NanSongEffect)

function IsNotEliteUnit(pUnit)
	local unitName = Locale.ConvertTextKey(pUnit:GetNameNoDesc())

	-- 单位不可购买或单位名称中含有字符串"[COLOR_YIELD_GOLD]"
    if  (GameInfo.Units[pUnit:GetUnitType()].HurryCostModifier == -1 
	and GameInfo.Units[pUnit:GetUnitType()].ProjectPrereq ~= nil) 
	or (GameInfo.Units[pUnit:GetUnitType()].HurryCostModifier ~= -1 
	and string.match(unitName, "[COLOR_YIELD_GOLD]") ~= nil)
	then
        return false
    else
        return true
    end
end
-------------------------------------------------------------------------------------------------------------
-- 背嵬骑军战斗力随血量变化
-------------------------------------------------------------------------------------------------------------
function BeiWeiSetBaseCombatStrength( iPlayerID, iUnitID )
	if Players[ iPlayerID ] == nil or not Players[ iPlayerID ]:IsAlive()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ) == nil
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
	then
		return;
	end
	local pUnit = Players[ iPlayerID ]:GetUnitByID( iUnitID );
	--print("BeiWeiCavalryCombatStrengthPre")
	if not pUnit:IsDead() and  pUnit:IsHasPromotion(BeiWeiCavalryID) then
		local iCombat = 0
		local pUnitHP = pUnit:GetCurrHitPoints() 
		local maxpUnitHP = pUnit:GetMaxHitPoints()
		local factor = 1 - pUnitHP / maxpUnitHP + 0.01
		local combatfactor = math.tan(math.pi * factor / 2)
		local aCS = GameInfo.Units[pUnit:GetUnitType()].Combat
		iCombat = aCS * (1 + combatfactor)
		-- pUnit:SetBaseCombatStrength(iCombat)
		SPUEAddCombatBonus(pUnit, 100 * combatfactor)
		print("BeiWeiCavalryCombatStrength:"..iCombat)
	end

end
Events.SerialEventUnitSetDamage.Add( BeiWeiSetBaseCombatStrength )
-------------------------------------------------------------------------------------------------------------
-- 殿前司行进效果
-------------------------------------------------------------------------------------------------------------
function YFS_UnitSetXY(playerID, unitID)
	local player = Players[playerID]

	if player:GetUnitByID(unitID) == nil then return end

	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()

	if player == nil then return end
	
	if player:IsBarbarian() or player:IsMinorCiv() then return end

	if plot then

		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT"]) then
			-- 殿前司：根据临近敌人给战斗力加成
			local iunit = GameInfo.Units[unit:GetUnitType()] ;
			local plot = unit:GetPlot();
            local icombat_bonus = 0;

            local unitCount = plot:GetNumUnits();
            local uniqueRange = 1;
			if unitCount >= 1 then
				for i = 0, unitCount-1, 1 do
					local pFoundUnit = plot:GetUnit(i)
					if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
						local pPlayer = Players[pFoundUnit:GetOwner()];
						if PlayersAtWar(player, pPlayer) then
							icombat_bonus = icombat_bonus + 1;
						end
					end
				end
			end
            
			for dx = -uniqueRange, uniqueRange, 1 do
				for dy = -uniqueRange, uniqueRange, 1 do
					local adjPlot = Map.PlotXYWithRangeCheck(plot:GetX(), plot:GetY(), dx, dy, uniqueRange);
                    if (adjPlot ~= nil) then
			    	    unitCount = adjPlot:GetNumUnits();
			    	    if unitCount >= 1 then
			    	    	for i = 0, unitCount-1, 1 do
			    	    		local pFoundUnit = adjPlot:GetUnit(i)
			    	    		if pFoundUnit ~= nil and pFoundUnit:GetID() ~= unit:GetID() then
			    	    			local pPlayer = Players[pFoundUnit:GetOwner()];
			    	    			if PlayersAtWar(player, pPlayer) then
                                        icombat_bonus = icombat_bonus + 1;
			    	    			end
			    	    		end
			    	    	end
			    	    end
                    end
			    end
            end
            local iunit = GameInfo.Units[unit:GetUnitType()];
			local icombat = math.ceil(0.05 * iunit.Combat);
			-- unit:SetBaseCombatStrength(iunit.Combat + icombat * icombat_bonus);
			SPUEAddCombatBonus(unit, math.ceil(100 * icombat_bonus * icombat / iunit.Combat))
            local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
            Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_STRENGTH]", icombat * icombat_bonus));
            -- Events.GameplayFX(hex.x, hex.y, -1);

		end

	end 
end
GameEvents.UnitSetXY.Add(YFS_UnitSetXY)
GameEvents.UnitCreated.Add(YFS_UnitSetXY)
-------------------------------------------------------------------------------------------------------------
-- 殿前司过回合效果&AI驻队矢效果
-------------------------------------------------------------------------------------------------------------
GameEvents.PlayerDoTurn.Add(
function(playerID)
	local player = Players[playerID] 

	if player == nil or player:IsBarbarian() then
		return
	end

	for unit in player:Units() do
		if unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_DRAGON_FOOT"].ID) then
			
			local unitPlot = unit:GetPlot();
	  		local uPlayer = Players[unit:GetOwner()];
	  		local plotX = unitPlot:GetX()
	  		local plotY = unitPlot:GetY()

	  		local unitCount = unitPlot:GetNumUnits();
	  		if unitCount > 0 then
	  			for i = 0, unitCount-1, 1 do
					local pFoundUnit = unitPlot:GetUnit(i);
					if pFoundUnit then 
					  	local pPlayer = Players[pFoundUnit:GetOwner()];
					  	if pPlayer == uPlayer and pFoundUnit:GetBaseCombatStrength() > 0 and pFoundUnit:GetDomainType() == DomainTypes.DOMAIN_LAND then
						  	pFoundUnit:ChangeMoves(60);
							pFoundUnit:ChangeExperience(2);
							local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
							Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_MOVES]", 1));
						end
					end
	  			end
	  		end
		
	  		local uniqueRange = 1
	  		for dx = -uniqueRange, uniqueRange, 1 do
				for dy = -uniqueRange, uniqueRange, 1 do
				  	local adjPlot = Map.PlotXYWithRangeCheck(plotX, plotY, dx, dy, uniqueRange);
				  	if (adjPlot ~= nil) then
					  	unitCount = adjPlot:GetNumUnits();
					  	if unitCount > 0 then
						  	for i = 0, unitCount-1, 1 do
								local pFoundUnit = adjPlot:GetUnit(i);
								if pFoundUnit then 
								local pPlayer = Players[pFoundUnit:GetOwner()];
									if pPlayer == uPlayer and pFoundUnit:GetBaseCombatStrength() > 0 and pFoundUnit:GetDomainType() == DomainTypes.DOMAIN_LAND then
										pFoundUnit:ChangeMoves(60);
										pFoundUnit:ChangeExperience(2);
										local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
										Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ICON_MOVES]", 1));
									end
								end
						  	end
					  	end
				  	end
				end
	  		end
		end

		if not player:IsHuman() then
			-- AI驻队矢效果
			if unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CAN_ZHUDUISHI"].ID) then
				if not unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI_AI"].ID) 
				and unit:GetPlot():IsFriendlyTerritory()
				then
					unit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI_AI"].ID, true)
				elseif unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI_AI"].ID) 
				and unit:GetPlot():IsFriendlyTerritory() 
				then
					
				else
					unit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI_AI"].ID, false)
				end
			end
		end

	end

	

end)


----驻队矢：轮番猛射
NSRangeAttackOnButton = {
  Name = "ZhuiDuiShi On",
  Title = "TXT_KEY_ZHUDUISHI_ON_SHORT", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "extraPromo_Atlas", -- 45 and 64 variations required
  PortraitIndex = 11,
  ToolTip = "TXT_KEY_ZHUDUISHI_ON", -- or a TXT_KEY_ or a function
  
 
  
  Condition = function(action, unit)
    return unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CAN_ZHUDUISHI"].ID) and 
	not unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI"].ID);
  end, -- or nil or a boolean, default is true
  
  Disabled = function(action, unit)   
    return false;
  end, -- or nil or a boolean, default is false
  
  Action = function(action, unit, eClick) 
  	
   	
   	unit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI"].ID, true)
   	print ("ZhuDuiShi On!")
	
  
  
  end
};

LuaEvents.UnitPanelActionAddin(NSRangeAttackOnButton);

NSRangeAttackOffButton = {
  Name = "ZhuDuiShi Off",
  Title = "TXT_KEY_ZHUDUISHI_OFF_SHORT", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "extraPromo_Atlas", -- 45 and 64 variations required
  PortraitIndex = 61,
  ToolTip = "TXT_KEY_ZHUDUISHI_OFF", -- or a TXT_KEY_ or a function
  
 
  
  Condition = function(action, unit)
    return unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI"].ID);
  end, -- or nil or a boolean, default is true
  
  Disabled = function(action, unit)     
    return not unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI"].ID) ;
  end, -- or nil or a boolean, default is false
  
  Action = function(action, unit, eClick) 
  	
   	
   	unit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI"].ID, false)
   	unit:SetMoves(0)
   	print ("ZhuDuiShi Off!")
	
  
  
  end
};

LuaEvents.UnitPanelActionAddin(NSRangeAttackOffButton);

----车船：飞虎战船买一送一
function FeiHuGift( iPlayerID, iUnitID )
	if Players[ iPlayerID ] == nil or not Players[ iPlayerID ]:IsAlive()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ) == nil
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
	then
		return;
	end
	local pUnit = Players[ iPlayerID ]:GetUnitByID( iUnitID );

	if not pUnit:IsHasPromotion(UpwsID)
	and pUnit:GetUnitType() == GameInfoTypes["UNIT_U_PWS"] then
		--print ("unitName:"..unitName)
		local unitType = GameInfoTypes["UNIT_SP_FEIHUCHUAN"]
		local unitX = pUnit:GetX()
		local unitY = pUnit:GetY()
		local pPlayer = Players[pUnit:GetOwner()] 
		--print("unitType ready")
	
		local NewUnit = pPlayer:InitUnit(unitType, unitX, unitY, UNITAI_ASSAULT_SEA)
		NewUnit:JumpToNearestValidPlot()
		pUnit:SetHasPromotion(UpwsID, true)

		-- 车船10%概率开启火力全开
		local commitPercent = 0.11
		local percent = commitPercent * 10000

		local randomNum = math.random(1,10000)
		print("--randomNum--"..randomNum.."--commitPercent--"..percent)
		if randomNum <= percent then
			print("--true--")
			pUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_CAN_FULL_FIRE"].ID, true)
		end
	end	
end
Events.UnitCreated.Add(FeiHuGift)

----泉州海船文化产出&奢侈供给
function SongFuChuan(playerID)

	-- local playerID = Game.GetActivePlayer() 			---获取playerID
	local player = Players[playerID] 		-----获取player

	if player == nil then
		-- print ("No players")
		return
	end
	
	if player:IsBarbarian() or player:IsMinorCiv() then
		-- print ("Minors are Not available!")
    	return
	end
	
	if player:GetNumCities() <= 0 then 
		-- print ("No Cities!")
		return
	end

	if not player:IsHuman() then
		return;
	end

	local numship = 0
	local pCapital = player:GetCapitalCity()    --获取首都

	pCapital:SetNumRealBuilding(GameInfoTypes["BUILDING_SONG_CARGOSHIP"], numship)
	for unit in player:Units() do 		--遍历所有单位	
		if unit:GetUnitType() == GameInfoTypes["UNIT_SONG_CARGOSHIP"] then	
			numship = numship + 1
		end
	end

	pCapital:SetNumRealBuilding(GameInfoTypes["BUILDING_SONG_CARGOSHIP"], numship)

	if numship > 0 then
		-- 海船线路按顺序提供奢侈
		local g_KlinLuxuries = {GameInfoTypes['BUILDING_RES_YFS_GEKLIN'],
								GameInfoTypes['BUILDING_RES_YFS_RUKLIN'],
								GameInfoTypes['BUILDING_RES_YFS_OFFICALKLIN'],
								GameInfoTypes['BUILDING_RES_YFS_JUNKLIN'],
								GameInfoTypes['BUILDING_RES_YFS_DINGKLIN']
							}
		local numLuxury = player:GetBuildingClassCount(GameInfo.BuildingClasses["BUILDINGCLASS_YFS_SONG_RES_BONUS"].ID);
		local outgoingRoutes = {};
		local outgoingRoutes = player:GetTradeRoutes();	
		if numLuxury == #outgoingRoutes 
		then 
			return 
		else
			local rest = math.fmod(numLuxury, 5);
			local numMax = (numLuxury - rest) / 5;

			for i, v in pairs(g_KlinLuxuries) do
				pCapital:SetNumRealBuilding(v, numMax);
			end
			
			for i, v in pairs(g_KlinLuxuries) do
				if rest > 0 then
					pCapital:SetNumRealBuilding(v, numMax + 1);
					rest = rest - 1;
				else
					return;
				end
			end			 
		end	
	end

end
Events.UnitCreated.Add(SongFuChuan)
GameEvents.PlayerDoTurn.Add(SongFuChuan)

-- MOD by CaptainCWB
function SetEliteUnitsName( iPlayerID, iUnitID )
	if Players[ iPlayerID ] == nil or not Players[ iPlayerID ]:IsAlive()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ) == nil
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):HasName()
	then
		return;
	end
	local pUnit = Players[ iPlayerID ]:GetUnitByID( iUnitID );
	if     pUnit:IsHasPromotion(BeiWeiCavalryID) then
		pUnit:SetName("TXT_KEY_UNIT_BEIWEI_CAVALRY_NAME0");		-- Locale.ConvertTextKey("TXT_KEY_UNIT_IMPERIAL_GUARD_CAVALRY_ELITE_NAME")
	elseif pUnit:IsHasPromotion(ChiXinCavalryID) then
		pUnit:SetName("TXT_KEY_UNIT_CHIXIN_CAVALRY_NAME0");		-- Locale.ConvertTextKey("TXT_KEY_UNIT_IMPERIAL_GUARD_CAVALRY_ELITE_NAME")
	end


end
Events.SerialEventUnitCreated.Add(SetEliteUnitsName)
-----------------------------------------------------------------------
---- 赤心队：白马绍兴&制置使：天下太平
-----------------------------------------------------------------------
function CheckChiXinCavalry(pPlayer)
	local ShangCheck = 0;
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(ChiXinCavalryID) then
			ShangCheck = 1;
			break
		end
	end
	return ShangCheck;
end

function CheckJieDuShi(pPlayer)
	local JieDuShiCheck = 0;
	for pUnit in pPlayer:Units() do
		if pUnit:IsHasPromotion(JieDuShiPreID) then
			JieDuShiCheck = 1;
			break
		end
	end
	return JieDuShiCheck;
end

function YfsUnitsEffect(playerID)
	local pPlayer = Players[playerID]

	local ChiXinCheck = CheckChiXinCavalry(pPlayer)
	local JieDuShiCheck = CheckJieDuShi(pPlayer)

	-- 赤心队光环
	if ChiXinCheck == 1 then
		for pUnit in pPlayer:Units() do
			local Patronage = 0;
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) and pUnit:IsCombatUnit() and not pUnit:IsEmbarked() and not pUnit:IsHasPromotion(ChiXinCavalryID) then 
				for sUnit in pPlayer:Units() do
					if sUnit:IsHasPromotion(ChiXinCavalryID) then
						if pPlayer:IsHuman() then
							if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < 4 then -- 人类三格
								Patronage = 1;
							end
						elseif not pPlayer:IsHuman() then
							if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < 6 then -- ai5格
								Patronage = 1;
							end
						end
					end
				end			
				if Patronage == 1 then
					if not pUnit:IsHasPromotion(ChiXinEffectID) then
						pUnit:SetHasPromotion(ChiXinEffectID, true)
					end
				else
					if pUnit:IsHasPromotion(ChiXinEffectID) and not pUnit:IsHasPromotion(ChiXinCavalryID) then
						pUnit:SetHasPromotion(ChiXinEffectID, false)
					end
				end		
			else
				if pUnit:IsHasPromotion(ChiXinEffectID) and not pUnit:IsHasPromotion(ChiXinCavalryID) then
					pUnit:SetHasPromotion(ChiXinEffectID, false)
				end
			end
		end
	end

	-- 天下太平
	if JieDuShiCheck == 1 then
		for pUnit in pPlayer:Units() do
			local Patronage = 0;
			if (pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND) and pUnit:IsCombatUnit() and not pUnit:IsEmbarked() and not pUnit:IsHasPromotion(ChiXinCavalryID) then 
				for sUnit in pPlayer:Units() do
					if sUnit:IsHasPromotion(JieDuShiPreID) then
						if pPlayer:IsHuman() then
							if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < 2 then -- 人类三格
								Patronage = 1;
							end
						elseif not pPlayer:IsHuman() then
							if Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), sUnit:GetX(), sUnit:GetY()) < 3 then -- ai5格
								Patronage = 1;
							end
						end
					end
				end			
				if Patronage == 1 then
					if not pUnit:IsHasPromotion(JieDuShiEffectID) then
						pUnit:SetHasPromotion(JieDuShiEffectID, true)
					end
				else
					if pUnit:IsHasPromotion(JieDuShiEffectID) and not pUnit:IsHasPromotion(JieDuShiPreID) then
						pUnit:SetHasPromotion(JieDuShiEffectID, false)
					end
				end		
			else
				if pUnit:IsHasPromotion(JieDuShiEffectID) and not pUnit:IsHasPromotion(JieDuShiPreID) then
					pUnit:SetHasPromotion(JieDuShiEffectID, false)
				end
			end
		end
	end

	
end
GameEvents.UnitSetXY.Add(YfsUnitsEffect) 
Events.UnitCreated.Add(YfsUnitsEffect)
-----------------------------------------------------------------------
---- 赤心队：组建军团
-----------------------------------------------------------------------
-- Establish Corps & Armee
CX_EstablishCorpsButton = {
  Name = "CX_Establish Corps",
  Title = "TXT_KEY_SP_BTNNOTE_UNIT_ESTABLISH_CORPS_SHORT", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "SP_UNIT_ACTION_ATLAS", -- 45 and 64 variations required
  PortraitIndex = 1,
  ToolTip = "TXT_KEY_SP_BTNNOTE_UNIT_ESTABLISH_CORPS", -- or a TXT_KEY_ or a function

  Condition = function(action, unit)
	local bIsCondition = false;
    local playerID = unit:GetOwner();
    local player = Players[playerID];
    local plot = unit:GetPlot();
	local iChiXinCrop = load( player, "ChiXin", iChiXinCrop) or -1;
	if unit:CanMove() and unit:IsHasPromotion(ChiXinCavalryID) 
	and plot and plot:GetNumUnits() > 1 and not unit:IsEmbarked() and not unit:IsImmobile()
    and not plot:IsWater()
	and iChiXinCrop < 0
	and player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0
    -- and player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0
    then
		for i = 0, plot:GetNumUnits() - 1, 1 do
			local fUnit = plot:GetUnit(i);
			if fUnit and fUnit ~= unit and fUnit:IsCombatUnit() and fUnit:GetOwner() == playerID and fUnit:GetDomainType() == unit:GetDomainType() and not fUnit:IsImmobile()
			and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_CORPS_1"]) and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_CORPS_2"])
			then
				bIsCondition = true
				break
			end
			 
		end
	end
	return bIsCondition;
  end, -- or nil or a boolean, default is true

  	Disabled = function(action, unit)   
	  return unit:GetPlot():GetNumUnits() <= 1;
	end, -- or nil or a boolean, default is false

	Action = function(action, unit, eClick)
		local playerID = unit:GetOwner();
		local player = Players[playerID];
		local plot = unit:GetPlot();
		local iChiXinCrop = load( player, "ChiXin", iChiXinCrop) or -1;
		if unit:CanMove() and unit:IsHasPromotion(ChiXinCavalryID) 
		and plot and plot:GetNumUnits() > 1 and not unit:IsEmbarked() and not unit:IsImmobile()
		and not plot:IsWater()
		and iChiXinCrop < 0
		and player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0
		then
			for i = 0, plot:GetNumUnits() - 1, 1 do
				local fUnit = plot:GetUnit(i);
				if fUnit and fUnit ~= unit and fUnit:IsCombatUnit() and fUnit:GetOwner() == playerID and fUnit:GetDomainType() == unit:GetDomainType() and not fUnit:IsImmobile()
				and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_CORPS_1"]) and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_CORPS_2"])
				then
					local plotX, plotY = plot:GetX(), plot:GetY()
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					fUnit:SetHasPromotion(GameInfoTypes["PROMOTION_CORPS_1"], true)
					iChiXinCrop = iChiXinCrop + 1
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("TXT_KEY_PROMOTION_CHIXINDUI1"))
					
					Events.GameplayFX(hex.x, hex.y, -1)
					save( player, "ChiXin", iChiXinCrop)
				end
			end
		end
		unit:SetMoves(0);
	end

};
LuaEvents.UnitPanelActionAddin(CX_EstablishCorpsButton);
-- 组建集团军
CX_EstablishArmeeButton = {
	Name = "CX_Establish Armee",
	Title = "TXT_KEY_SP_BTNNOTE_UNIT_ESTABLISH_ARMEE_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SP_UNIT_ACTION_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 3,
	ToolTip = "TXT_KEY_SP_BTNNOTE_UNIT_ESTABLISH_ARMEE", -- or a TXT_KEY_ or a function
  
	Condition = function(action, unit)
	  local bIsCondition = false;
	  local playerID = unit:GetOwner();
	  local player = Players[playerID];
	  local plot = unit:GetPlot();
	  local iChiXinArmee = load( player, "ChiXinArmee", iChiXinArmee) or -1;
	  if unit:CanMove() and unit:IsHasPromotion(ChiXinCavalryID) 
	  and unit:GetUnitType() == GameInfoTypes["UNIT_LOYALTY_ARMOR"]
	  and plot and plot:GetNumUnits() > 1 and not unit:IsEmbarked() and not unit:IsImmobile()
	  and not plot:IsWater()
	  and iChiXinArmee < 0
	  and player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0
	  -- and player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0
	  then
		  for i = 0, plot:GetNumUnits() - 1, 1 do
			  local fUnit = plot:GetUnit(i);
			  if fUnit and fUnit ~= unit and fUnit:IsCombatUnit() and fUnit:GetOwner() == playerID and fUnit:GetDomainType() == unit:GetDomainType() and not fUnit:IsImmobile()
			  and fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_CORPS_1"]) and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_CORPS_2"])
			  then
				  bIsCondition = true
				  break
			  end
			   
		  end
	  end
	  return bIsCondition;
	end, -- or nil or a boolean, default is true
  
		Disabled = function(action, unit)   
		return unit:GetPlot():GetNumUnits() <= 1;
	  end, -- or nil or a boolean, default is false
  
	  Action = function(action, unit, eClick)
		  local playerID = unit:GetOwner();
		  local player = Players[playerID];
		  local plot = unit:GetPlot();
		  local iChiXinArmee = load( player, "ChiXinArmee", iChiXinArmee) or -1;
		  if unit:CanMove() and unit:IsHasPromotion(ChiXinCavalryID) 
		  and unit:GetUnitType() == GameInfoTypes["UNIT_LOYALTY_ARMOR"]
		  and plot and plot:GetNumUnits() > 1 and not unit:IsEmbarked() and not unit:IsImmobile()
		  and not plot:IsWater()
		  and iChiXinArmee < 0
		  and player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0
		  then
			  for i = 0, plot:GetNumUnits() - 1, 1 do
				  local fUnit = plot:GetUnit(i);
				  if fUnit and fUnit ~= unit and fUnit:IsCombatUnit() and fUnit:GetOwner() == playerID and fUnit:GetDomainType() == unit:GetDomainType() and not fUnit:IsImmobile()
				  and fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_CORPS_1"]) and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_CORPS_2"])
				  then
					  local plotX, plotY = plot:GetX(), plot:GetY()
					  local hex = ToHexFromGrid(Vector2(plotX, plotY))
					  fUnit:SetHasPromotion(GameInfoTypes["PROMOTION_CORPS_2"], true)
					  iChiXinArmee = iChiXinArmee + 1
					  Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("TXT_KEY_PROMOTION_CHIXINDUI1"))
					  
					  Events.GameplayFX(hex.x, hex.y, -1)
					  save( player, "ChiXinArmee", iChiXinArmee)
				  end
			  end
		  end
		  unit:SetMoves(0);
	  end
  
  };
  LuaEvents.UnitPanelActionAddin(CX_EstablishArmeeButton);
-- 赤心队冷却3回合
GameEvents.PlayerDoTurn.Add(
function(playerID)
	local player = Players[playerID] 

	if player == nil or player:IsBarbarian() then
		return
	end

	for unit in player:Units() do
		if unit:IsHasPromotion(ChiXinCavalryID) then
			-- 组建军团
			local iChiXinCrop = load( player, "ChiXin", iChiXinCrop) or -1;
			if iChiXinCrop < 2 and iChiXinCrop >= 0 then
				iChiXinCrop = iChiXinCrop + 1
				save( player, "ChiXin", iChiXinCrop)
			elseif iChiXinCrop == 2 then
				iChiXinCrop = -1
				save( player, "ChiXin", iChiXinCrop)
			end
			-- 组建集团军
			local iChiXinArmee = load( player, "ChiXinArmee", iChiXinArmee) or -1;
			if iChiXinArmee < 2 and iChiXinArmee >= 0 then
				iChiXinArmee = iChiXinArmee + 1
				save( player, "ChiXinArmee", iChiXinArmee)
			elseif iChiXinArmee == 2 then
				iChiXinArmee = -1
				save( player, "ChiXinArmee", iChiXinArmee)
			end
		end
	end

end)

