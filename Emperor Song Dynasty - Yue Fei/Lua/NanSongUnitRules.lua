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

local J20PID = GameInfo.UnitPromotions["PROMOTION_CHUAIMEN"].ID

local AntiAirID = GameInfo.UnitPromotions["PROMOTION_ANTI_AIR"].ID
local NavalRangedCruiserUnitID = GameInfo.UnitPromotions["PROMOTION_NAVAL_RANGED_CRUISER"].ID
local DestroyerID = GameInfo.UnitPromotions["PROMOTION_DESTROYER_COMBAT"].ID

local GunpowderInfantryUnitID = GameInfo.UnitPromotions["PROMOTION_GUNPOWDER_INFANTRY_COMBAT"].ID
local InfantryUnitID = GameInfo.UnitPromotions["PROMOTION_INFANTRY_COMBAT"].ID
local KnightID = GameInfo.UnitPromotions["PROMOTION_KNIGHT_COMBAT"].ID
--local TankID = GameInfo.UnitPromotions["PROMOTION_TANK_COMBAT"].ID	
--local Charge1ID = GameInfo.UnitPromotions["PROMOTION_CHARGE_1"].ID
--local Charge2ID = GameInfo.UnitPromotions["PROMOTION_CHARGE_2"].ID
--local Charge3ID = GameInfo.UnitPromotions["PROMOTION_CHARGE_3"].ID
----Get Closed City
function GetCloseCity ( iPlayer, plot )      
	local pPlayer = Players[iPlayer];
	local distance = 1000;
	local closeCity = nil;
	if pPlayer == nil then
		-- print ("nil")
		return nil
	end

	if pPlayer:GetNumCities() <= 0 then 
		-- print ("No Cities!")
		return;
	end

	for pCity in pPlayer:Cities() do
		local distanceToCity = Map.PlotDistance(pCity:GetX(), pCity:GetY(), plot:GetX(), plot:GetY());
		if ( distanceToCity < distance) then
			distance = distanceToCity;
			closeCity = pCity;
			--print("pCity:GetName()"..pCity:GetName())
		end
	end
	return closeCity;
end

--------------------------------------------------------------
-- 背嵬骑军战斗增伤
--------------------------------------------------------------
function NanSongDamageDelta(iBattleUnitType, iBattleType,
	iAttackPlayerID, iAttackUnitOrCityID, bAttackIsCity, iAttackDamage,
	iDefensePlayerID, iDefenseUnitOrCityID, bDefenseIsCity, iDefenseDamage,
	iInterceptorPlayerID, iInterceptorUnitOrCityID, bInterceptorIsCity, iInterceptorDamage)
	
	local additionalDamage = 0;

	local attPlayer = Players[iAttackPlayerID]
	local defPlayer = Players[iDefensePlayerID]
	if attPlayer == nil or defPlayer == nil then
		return 0;
	end
	

	if iBattleUnitType == GameInfoTypes["BATTLEROLE_ATTACKER"] 
	and iBattleType == GameInfoTypes["BATTLETYPE_MELEE"]
	then
		-- 撼山易，撼岳家军难效果
		-- 进攻时对敌人单位和城市的伤害随血量减少增加
		if not bAttackIsCity then

			local attUnit = attPlayer:GetUnitByID(iAttackUnitOrCityID);
			if attUnit == nil then return 0 end;

			local attUnitHP = attUnit:GetCurrHitPoints() 
			local maxattUnitHP = attUnit:GetMaxHitPoints()
			local factor = 1 - attUnitHP / maxattUnitHP + 0.01
			local damagefactor = math.tan(math.pi * factor / 2)
			local maxDamage = 50000

			if not bDefenseIsCity
			then
				local defUnit = defPlayer:GetUnitByID(iDefenseUnitOrCityID);
				if defUnit == nil then return 0 end;

				if not attUnit:IsDead() and attUnit:IsHasPromotion(BeiWeiCavalryID) then
					if defUnit:IsDead() then
						attUnit:SetMoves(attUnit:MovesLeft() + GameDefines["MOVE_DENOMINATOR"]);
					elseif not defUnit:IsDead() then
						-- iAttackDamage：攻击方造成的伤害
						additionalDamage = iAttackDamage * (0 + damagefactor);
						if additionalDamage >= maxDamage then 
							additionalDamage = maxDamage;
						end
			
						defUnit:SetHasPromotion(MoralWeaken1ID, true);
						defUnit:SetHasPromotion(MoralWeaken2ID, true);
					end
				end
			else		
				local defCity = defPlayer:GetCityByID(iDefenseUnitOrCityID);
				if defCity == nil then return 0 end;
				-- iDefenseDamage：防御方造成伤害
				additionalDamage = iAttackDamage * (0 + damagefactor);
				if additionalDamage >= maxDamage then 
					additionalDamage = maxDamage;
				end
			end

		end
	elseif iBattleUnitType == GameInfoTypes["BATTLEROLE_DEFENDER"] 
	and iBattleType == GameInfoTypes["BATTLETYPE_MELEE"]
	then
		if not bDefenseIsCity then

			local defUnit = defPlayer:GetUnitByID(iDefenseUnitOrCityID);
			if defUnit == nil then return 0 end;
			local defUnitHP = defUnit:GetCurrHitPoints() 
			local maxdefUnitHP = defUnit:GetMaxHitPoints()
			local factor = 1 - defUnitHP / maxdefUnitHP + 0.01
			local damagefactor = math.tan(math.pi * factor / 2)
			local maxDamage = 50000

			if not bAttackIsCity
			then
				local attUnit = attPlayer:GetUnitByID(iAttackUnitOrCityID);
				if attUnit == nil then return 0 end;

				if not attUnit:IsDead() and not defUnit:IsDead()
				and defUnit:IsHasPromotion(BeiWeiCavalryID) then
					-- iDefenseDamage：防御方造成伤害
					additionalDamage = iDefenseDamage * (0 + damagefactor);
					if additionalDamage >= maxDamage then 
						additionalDamage = maxDamage
					end
					attUnit:SetHasPromotion(MoralWeaken1ID, true);
					attUnit:SetHasPromotion(MoralWeaken2ID, true);
				end
			end
		end
	end
	return additionalDamage;
end
GameEvents.BattleCustomDamage.Add(NanSongDamageDelta)

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
			-- Message = 1
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
			if newMoves < 60 then newMoves = 0 end
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

	------背嵬骑军受到陆军远程部队攻击时
	if not attUnit:IsDead() and not defUnit:IsDead() and batType == GameInfoTypes["BATTLETYPE_MELEE"]
	and defUnit:IsHasPromotion(BeiWeiCavalryID) then
		if attUnit:IsHasPromotion(ArcheryUnitID) and batType == GameInfoTypes["BATTLETYPE_RANGED"]
		and defUnit:IsHasPromotion(BeiWeiCavalryID) then
			defUnit:SetMoves(defUnit:MovesLeft() + GameDefines["MOVE_DENOMINATOR"]);

			attUnit:SetHasPromotion(MoralWeaken1ID, true);
			attUnit:SetHasPromotion(MoralWeaken2ID, true);
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
					local pPlayer = Players[adjPlot:GetPlotCity():GetOwner()]
					if PlayersAtWar(attPlayer, pPlayer) then
                    	adjPlot:GetPlotCity():ChangeResistanceTurns(1);
					end
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
	-----------------------------------------------------------------------
	---- 赤心队：阵亡
	----------------------------------------------------------------------
	if attUnit:IsHasPromotion(ChiXinCavalryID) and attUnit:IsHasPromotion(KnightID)
	and (attUnit:IsDead() or attUnit:GetDamage() >=  attUnit:GetMaxHitPoints() )then
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
-- 两装甲单位战斗力变化
-------------------------------------------------------------------------------------------------------------
function ArmorSetCombat(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsEverAlive() then
		local pEraType = pPlayer:GetCurrentEra()
		local pEraID = GameInfo.Eras[pEraType].ID;

		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == GameInfoTypes["UNIT_LOYALTY_ARMOR"]  
			or pUnit:GetUnitType() == GameInfoTypes["UNIT_BEIWEI_ARMOR"] 
			then
				if pEraID >= GameInfo.Eras["ERA_WORLDWAR"].ID 
				and pEraID < GameInfo.Eras["ERA_INFORMATION"].ID
				then
					pUnit:SetBaseCombatStrength(200)
				elseif pEraID >= GameInfo.Eras["ERA_INFORMATION"].ID then
					pUnit:SetBaseCombatStrength(350)
				end
			end
		end
	end

end
GameEvents.TeamSetEra.Add(ArmorSetCombat)
GameEvents.UnitCreated.Add(ArmorSetCombat)
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
local iDragonFoot = GameInfoTypes["PROMOTION_DRAGON_FOOT"]
local iDragonFootOn = GameInfoTypes["PROMOTION_DRAGON_FOOT_ON"]
function YFS_UnitSetXY(playerID, unitID)
	local player = Players[playerID]

	if player:GetUnitByID(unitID) == nil then return end

	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()

	if player == nil then return end
	
	if player:IsBarbarian() or player:IsMinorCiv() then return end

	if plot then

		-- 殿前司在河流地块获得加成
		if unit and 
		(unit:IsHasPromotion(iDragonFoot) 
		or unit:IsHasPromotion(iDragonFootOn)) 
		then
			unit:SetHasPromotion(iDragonFootOn, false)
			unit:SetHasPromotion(iDragonFoot, true)
			if plot:IsRiver() then
				unit:SetHasPromotion(iDragonFootOn, true)
				unit:SetHasPromotion(iDragonFoot, false)
			end
		end

	end 
end
GameEvents.UnitSetXY.Add(YFS_UnitSetXY)
GameEvents.UnitCreated.Add(YFS_UnitSetXY)
-------------------------------------------------------------------------------------------------------------
-- 殿前司过回合效果&AI驻队矢效果
-------------------------------------------------------------------------------------------------------------
GameEvents.UnitDoTurn.Add(
function(playerID, unitID)
	local player = Players[playerID] 
	if Players[playerID] == nil or not Players[playerID]:IsAlive()
	or Players[playerID]:GetUnitByID(unitID) == nil
	or Players[playerID]:GetUnitByID(unitID):IsDead()
	or Players[playerID]:GetUnitByID(unitID):IsDelayedDeath()
	then
		return;
	end
	
	local player = Players[playerID];
	local unit = Players[playerID]:GetUnitByID(unitID);

	-- for unit in player:Units() do
	if unit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT"]) 
	or unit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT_ON"])
	then
		
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
						local hex = ToHexFromGrid(Vector2(pFoundUnit:GetX(), pFoundUnit:GetY()));
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
									local hex = ToHexFromGrid(Vector2(pFoundUnit:GetX(), pFoundUnit:GetY()));
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

	-- end

	

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
		if pPlayer:GetNumCities() > 0 then
			local city = GetCloseCity ( pUnit:GetOwner() , pUnit:GetPlot() );
			local domainSeaID = GameInfo.Domains["DOMAIN_SEA"].ID;
			local SEATotal =  city:GetFreeExperience() + city:GetDomainFreeExperience(domainSeaID);
			NewUnit:ChangeExperience(SEATotal);
		end
		
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
GameEvents.UnitCreated.Add(FeiHuGift)

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
		-- print("numLuxury = "..numLuxury.." #outgoingRoutes = "..#outgoingRoutes )
		if numLuxury == #outgoingRoutes 
		then 
			return 
		else
			local rest = math.fmod(#outgoingRoutes , 5);
			local numMax = math.modf(#outgoingRoutes  / 5);
			-- print("rest = "..rest.."numMax = "..numMax)
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
GameEvents.UnitCreated.Add(SongFuChuan)
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
-- 使用dll接口实现
--GameEvents.UnitSetXY.Add(YfsUnitsEffect) 
--GameEvents.UnitCreated.Add(YfsUnitsEffect)
-----------------------------------------------------------------------
---- 赤心队：组建军团
-----------------------------------------------------------------------
-- Establish Corps & Armee
CX_EstablishCorpsButton = {
  Name = "CX_Establish Corps",
  Title = "TXT_KEY_YFS_BTNNOTE_UNIT_ESTABLISH_CORPS_SHORT", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "SP_UNIT_ACTION_ATLAS", -- 45 and 64 variations required
  PortraitIndex = 1,
  ToolTip = "TXT_KEY_YFS_BTNNOTE_UNIT_ESTABLISH_CORPS", -- or a TXT_KEY_ or a function

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
	and PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_DISABLE") == 0 -- 需要开启军团模式
    then
		for i = 0, plot:GetNumUnits() - 1, 1 do
			local fUnit = plot:GetUnit(i);
			if fUnit and fUnit ~= unit and fUnit:IsCombatUnit() and fUnit:GetOwner() == playerID and fUnit:GetDomainType() == unit:GetDomainType() and not fUnit:IsImmobile()
			and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_1"]) and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_2"])
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
		and PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_DISABLE") == 0 
		then
			for i = 0, plot:GetNumUnits() - 1, 1 do
				local fUnit = plot:GetUnit(i);
				if fUnit and fUnit ~= unit and fUnit:IsCombatUnit() and fUnit:GetOwner() == playerID and fUnit:GetDomainType() == unit:GetDomainType() and not fUnit:IsImmobile()
				and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_1"]) and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_2"])
				then
					local plotX, plotY = plot:GetX(), plot:GetY()
					local hex = ToHexFromGrid(Vector2(plotX, plotY))
					fUnit:SetHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_1"], true)
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
	Title = "TXT_KEY_YFS_BTNNOTE_UNIT_ESTABLISH_ARMEE_SHORT", -- or a TXT_KEY
	OrderPriority = 200, -- default is 200
	IconAtlas = "SP_UNIT_ACTION_ATLAS", -- 45 and 64 variations required
	PortraitIndex = 3,
	ToolTip = "TXT_KEY_YFS_BTNNOTE_UNIT_ESTABLISH_ARMEE", -- or a TXT_KEY_ or a function
  
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
	  and PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_DISABLE") == 0 -- 需要开启军团模式
	  -- and player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0
	  then
		  for i = 0, plot:GetNumUnits() - 1, 1 do
			  local fUnit = plot:GetUnit(i);
			  if fUnit and fUnit ~= unit and fUnit:IsCombatUnit() and fUnit:GetOwner() == playerID and fUnit:GetDomainType() == unit:GetDomainType() and not fUnit:IsImmobile()
			  and fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_1"]) and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_2"])
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
		  and PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_DISABLE") == 0 
		  then
			  for i = 0, plot:GetNumUnits() - 1, 1 do
				  local fUnit = plot:GetUnit(i);
				  if fUnit and fUnit ~= unit and fUnit:IsCombatUnit() and fUnit:GetOwner() == playerID and fUnit:GetDomainType() == unit:GetDomainType() and not fUnit:IsImmobile()
				  and fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_1"]) and not fUnit:IsHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_2"])
				  then
					  local plotX, plotY = plot:GetX(), plot:GetY()
					  local hex = ToHexFromGrid(Vector2(plotX, plotY))
					  fUnit:SetHasPromotion(GameInfoTypes["PROMOTION_YFS_CORPS_2"], true)
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
-----------------------------------------------------------------------
---- 殿前司步军命名
-----------------------------------------------------------------------
function SetDragonFootUnitName( iPlayerID, iUnitID )
	if Players[ iPlayerID ] == nil or not Players[ iPlayerID ]:IsAlive()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ) == nil
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):HasName()
	then
		return;
	end

	local DragonFootName1 = Locale.ConvertTextKey("TXT_KEY_UNIT_DRAGON_FOOT_NAME1");
	local DragonFootName2 = Locale.ConvertTextKey("TXT_KEY_UNIT_DRAGON_FOOT_NAME2");
	local DragonFootName3 = Locale.ConvertTextKey("TXT_KEY_UNIT_DRAGON_FOOT_NAME3");
	local DragonFootName4 = Locale.ConvertTextKey("TXT_KEY_UNIT_DRAGON_FOOT_NAME4");

	local numUnitsDragonFoot = 0;
	local g_FlagDragonFootName 	= {0, 0, 0, 0};
	
	local g_DragonFootName 		= {	DragonFootName1,
								 	DragonFootName2,
								 	DragonFootName3,
								 	DragonFootName4};

	for unit in Players[ iPlayerID ]:Units() do
		local unitName = Locale.ConvertTextKey(unit:GetNameNoDesc());
		for k, v in pairs(g_DragonFootName) do
			if unitName == v then
				g_FlagDragonFootName[k] = 1;
			end
		end
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT"]) 
		or unit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT_ON"])
		then
			numUnitsDragonFoot = numUnitsDragonFoot + 1
		end
	end

	local pUnit = Players[ iPlayerID ]:GetUnitByID( iUnitID );
	local oldunitType = pUnit:GetUnitType();

	if (pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT"]) 
	or pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT_ON"]))
	and numUnitsDragonFoot <= 4
	then
		for k, v in pairs(g_FlagDragonFootName) do
			if v == 0 then
				pUnit:SetName(g_DragonFootName[k]);
				return;
			end
		end
	elseif (pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT"]) 
	or pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_DRAGON_FOOT_ON"]))
	and numUnitsDragonFoot > 4 
	then
		-- 殿前司步军数量大于4强制删除
		-- pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_NO_CASUALTIES"], true)
		pUnit:Kill();
		return
	end
end
Events.SerialEventUnitCreated.Add(SetDragonFootUnitName)
-----------------------------------------------------------------------
---- 制置使：建立制置使司
-----------------------------------------------------------------------
----Build the JAPANESE DOJO in the city
BuildJiedushiButton = {
	Name = "Build Song Zhizhishi",
	Title = "TXT_KEY_SP_BTNNOTE_BUILDING_JIEDUSHI_SHORT", -- or a TXT_KEY
	OrderPriority = 1500, -- default is 200
	IconAtlas = "extraPromo_Atlas", -- 45 and 64 variations required
	PortraitIndex = 56,
	ToolTip = "TXT_KEY_BUILDING_JIEDUSHI_HELP", -- or a TXT_KEY_ or a function
	Condition = function(action, unit)
	  return unit:CanMove() and unit:IsHasPromotion(GameInfoTypes["PROMOTION_JIEDUSHI_CITY"]);
	end, -- or nil or a boolean, default is true
	
	Disabled = function(action, unit) 
	  local plot = unit:GetPlot();
	  if not plot:IsCity() then return true end;
	  local city = plot:GetPlotCity()
	  return not city or city:GetOwner() ~= unit:GetOwner() or city:IsHasBuilding(GameInfo.Buildings["BUILDING_JIEDUSHI"].ID);
	end, -- or nil or a boolean, default is false
	
	Action = function(action, unit, eClick)
	  local plot = unit:GetPlot();
	  local city = plot:GetPlotCity()
	  local player = Players[unit:GetOwner()]
	  if not city then return end
  
  
	  city:SetNumRealBuilding(GameInfoTypes["BUILDING_JIEDUSHI"],1)
	  unit:SetMoves(0)
	  unit:SetHasPromotion(GameInfoTypes["PROMOTION_JIEDUSHI_CITY"], false)
	end,
  };
  LuaEvents.UnitPanelActionAddin(BuildJiedushiButton);
-----------------------------------------------------------------------
---- 制置使司:消耗民兵加速生产
-----------------------------------------------------------------------
ProductionMissionButton = {
    Name = "military production",
    Title = "TXT_KEY_SP_MISSION_BUILDING_JIEDUSHI_TITLE", -- or a TXT_KEY
    OrderPriority = 300, -- default is 200
    IconAtlas = "UNIT_ACTION_GOLD_ATLAS", -- 45 and 64 variations required
    PortraitIndex = 36,
    ToolTip = "TXT_KEY_SP_MISSION_BUILDING_JIEDUSHI_TOOL_TIP", -- or a TXT_KEY_ or a function

    Condition = function(action, unit)
		local city = GetCloseCity ( unit:GetOwner() , unit:GetPlot() );
        return (unit:CanMove()
            and unit:GetBaseCombatStrength() > 0
            and unit:GetDomainType() == DomainTypes.DOMAIN_LAND
			and unit:IsHasPromotion(GameInfoTypes["PROMOTION_MILITIA_COMBAT"])
			and Map.PlotDistance(city:GetX(), city:GetY(), unit:GetX(), unit:GetY()) < 2
            and city:IsHasBuilding(GameInfoTypes["BUILDING_JIEDUSHI"]));
    end, -- or nil or a boolean, default is true

    Disabled = function(action, unit)
        return false;
    end, -- or nil or a boolean, default is false

    Action = function(action, unit, eClick)
        local plot = unit:GetPlot();
        local city = GetCloseCity ( unit:GetOwner() , unit:GetPlot() );
        local player = Players[unit:GetOwner()];
		local max = 2147483647
		local production = 0.1 * city:GetProductionNeeded();
		
		if city:GetProductionNeeded() < max / 10 then
			production = 0.1 * city:GetProductionNeeded();
		else
			production = 0.1 * city:GetOverflowProduction();
		end
		city:SetOverflowProduction(city:GetOverflowProduction() + production);
		unit:Kill();
		if player:IsHuman() then
        	Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_MESSAGE_JIEDUSHI_ALERT_1", unit:GetName(), city:GetName(), production) )
        end

    end,
};
LuaEvents.UnitPanelActionAddin(ProductionMissionButton);
