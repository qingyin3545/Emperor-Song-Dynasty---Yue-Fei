include("PlotIterators")
print("---------------------------------------------------------------")
print("------------------NanSongCombat Lua Loaded---------------------")
print("---------------------------------------------------------------")
-- 黄天荡及背嵬步军、骑军效果
local g_DoNanSong = nil;
local NanSongSeaUnitID = GameInfo.UnitPromotions["PROMOTION_NANSONG_SEA"].ID
local SiegeUnitID = GameInfo.UnitPromotions["PROMOTION_CITY_SIEGE"].ID
local BeiWeiFootID = GameInfo.UnitPromotions["PROMOTION_BEIWEI_FOOT"].ID
local BeiWeiCavalryID = GameInfo.UnitPromotions["PROMOTION_YUEJIAJUN"].ID
local ArcheryUnitID = GameInfo.UnitPromotions["PROMOTION_ARCHERY_COMBAT"].ID
local MoralWeaken1ID = GameInfo.UnitPromotions["PROMOTION_MORAL_WEAKEN_1"].ID
local MoralWeaken2ID = GameInfo.UnitPromotions["PROMOTION_MORAL_WEAKEN_2"].ID
local RangeBanID = GameInfo.UnitPromotions["PROMOTION_RANGE_BAN"].ID
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
	end
	
	-- Prepare for Capture Unit!
	if not bIsCity and g_DoNanSong.battleType == GameInfoTypes["BATTLETYPE_MELEE"]
	and Players[g_DoNanSong.attPlayerID] ~= nil and Players[g_DoNanSong.attPlayerID]:GetUnitByID(g_DoNanSong.attUnitID) ~= nil
	and Players[g_DoNanSong.defPlayerID] ~= nil and Players[g_DoNanSong.defPlayerID]:GetUnitByID(g_DoNanSong.defUnitID) ~= nil
	then
		local attPlayer = Players[g_DoNanSong.attPlayerID];
		local attUnit   = attPlayer:GetUnitByID(g_DoNanSong.attUnitID);
		local defPlayer = Players[g_DoNanSong.defPlayerID];
		local defUnit   = defPlayer:GetUnitByID(g_DoNanSong.defUnitID);
	
		if attUnit:GetCaptureChance(defUnit) > 0 then
			local unitClassType = defUnit:GetUnitClassType();
			local unitPlot = defUnit:GetPlot();
			local unitOriginalOwner = defUnit:GetOriginalOwner();
		
			local sCaptUnitName = nil;
			if defUnit:HasName() then
				sCaptUnitName = defUnit:GetNameNoDesc();
			end
			
			local unitLevel = defUnit:GetLevel();
			local unitEXP   = attUnit:GetExperience();
			local attMoves = attUnit:GetMoves();
			print("attacking Unit remains moves:"..attMoves);
		
			tCaptureSPUnits = {unitClassType, unitPlot, g_DoNanSong.attPlayerID, unitOriginalOwner, sCaptUnitName, unitLevel, unitEXP, attMoves};
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
	
	if defUnit:IsHasPromotion(BeiWeiFootID) and attUnit:GetDomainType() == DomainTypes.DOMAIN_LAND then
		if not attUnit:IsHasPromotion(SiegeUnitID) then
			attUnit:SetMoves(0)
			Message = 1
			print ("Attacker Stopped!")	
		end	
	end

   ------黄天荡减少1移动力

   if attUnit:IsHasPromotion(NanSongSeaUnitID) then
		local defMoves = defUnit:GetMoves()
		if defMoves == 0 or defMoves < 0 then
			--print("defUnit0")
		else
			local newMoves = math.ceil(defMoves - 1)
			defUnit:SetMoves(newMoves)
			--print("defUnit-1")
		end
	end

	------撼山易，撼岳家军难效果
	------攻击力随血量增加
	local iDamage = 0
	local attUnitHP = attUnit:GetCurrHitPoints() 
	local maxattUnitHP = attUnit:GetMaxHitPoints()
	local damagefactor = 1 - attUnitHP / maxattUnitHP
	if not attUnit:IsDead() and batType == GameInfoTypes["BATTLETYPE_MELEE"]
	and attUnit:IsHasPromotion(BeiWeiCavalryID) then
		if not bIsCity then
			iDamage = defUnit:GetDamage() * (1 + damagefactor);
			if iDamage > defUnit:GetCurrHitPoints() then
				iDamage = defUnit:GetCurrHitPoints();
			end
			defUnit:SetDamage(iDamage, attPlayerID);
		else
			iDamage = defCity:GetDamage() * (1 + damagefactor);
			if iDamage > defUnit:GetCurrHitPoints() then
				iDamage = defCity:GetCurrHitPoints();
			end
			defCity:SetDamage(iDamage, attPlayerID);
		end
	end
	------受到陆军远程部队攻击时
	if attUnit:IsHasPromotion(ArcheryUnitID) and batType == GameInfoTypes["BATTLETYPE_RANGED"]
	and defUnit:IsHasPromotion(BeiWeiCavalryID) then
		defUnit:SetMoves(defUnit:MovesLeft()+GameDefines["MOVE_DENOMINATOR"]);

		attUnit:SetHasPromotion(MoralWeaken1ID, true)
		attUnit:SetHasPromotion(MoralWeaken2ID, true)
		attUnit:SetHasPromotion(RangeBanID, true)
	end
end
GameEvents.BattleFinished.Add(NanSongEffect)

----驻队矢：轮番猛射

NSRangeAttackOnButton = {
  Name = "ZhuiDuiShi On",
  Title = "TXT_KEY_ZHUDUISHI_ON_SHORT", -- or a TXT_KEY
  OrderPriority = 200, -- default is 200
  IconAtlas = "extraPromo_Atlas", -- 45 and 64 variations required
  PortraitIndex = 11,
  ToolTip = "TXT_KEY_ZHUDUISHI_ON", -- or a TXT_KEY_ or a function
  
 
  
  Condition = function(action, unit)
    return unit:CanMove() and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CAN_ZHUDUISHI"].ID) and not unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_ZHUDUISHI"].ID);
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

----突火枪兵：城市驻守与生产加速
function tcmSongFireLancer(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()

	if plot then
		if unit:GetUnitType() == GameInfoTypes["UNIT_FIRELANCER"] then
			if plot:GetPlotCity() then
				local numMoves = unit:GetMoves()
				unit:SetMoves(0)
				newUnit = player:InitUnit(GameInfoTypes["UNIT_RANGED_FIRELANCER"], unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_FIRE_LANCER_DEFENSE"], true)
				newUnit:SetMoves(numMoves)
			end
		elseif unit:GetUnitType() == GameInfoTypes["UNIT_RANGED_FIRELANCER"] then
			if not(plot:GetPlotCity()) then
				local numMoves = unit:GetMoves()
				unit:SetMoves(0)
				newUnit = player:InitUnit(GameInfoTypes["UNIT_FIRELANCER"], unit:GetX(), unit:GetY())
				newUnit:Convert(unit)
				newUnit:SetHasPromotion(GameInfoTypes["PROMOTION_FIRE_LANCER_DEFENSE"], false)
				newUnit:SetMoves(numMoves)
			end
		end
	end 
end
GameEvents.UnitSetXY.Add(tcmSongFireLancer)

function tcmSongFireLancerBuildFaster(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_YFS_SONG"] then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_FIRELANCER_PRODUCTION"], 0)
			if city:GetProductionUnit() == GameInfoTypes["UNIT_RANGED_FIRELANCER"] then
				local plot = city:Plot()
				for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
						local otherUnit = loopPlot:GetUnit(i)
						if otherUnit and otherUnit:GetOwner() ~= playerID and otherUnit:IsCombatUnit() then
							local otherPlayer = Players[otherUnit:GetOwner()]
							local otherTeam = Teams[otherPlayer:GetTeam()]
							local team = Teams[player:GetTeam()]
							if otherTeam:IsAtWar(team) then
								city:SetNumRealBuilding(GameInfoTypes["BUILDING_FIRELANCER_PRODUCTION"], 1)
								--city:ChangeUnitProduction(GameInfoTypes["UNIT_RANGED_FIRELANCER"], 30)
								break
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcmSongFireLancerBuildFaster)

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
	--local oldunitType = pUnit:GetUnitType()

	--print ("unitName=", unitName)

	if not pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CAN_FULL_FIRE"].ID)
	and pUnit:GetUnitType() == GameInfoTypes["UNIT_U_PWS"] then
		--print ("unitName:"..unitName)
		local unitType = GameInfoTypes["UNIT_SP_FEIHUCHUAN"]
		local unitX = pUnit:GetX()
		local unitY = pUnit:GetY()
		local pPlayer = Players[pUnit:GetOwner()] 
		--print("unitType ready")
	
		local NewUnit = pPlayer:InitUnit(unitType, unitX, unitY, UNITAI_ASSAULT_SEA)
		NewUnit:JumpToNearestValidPlot()
		pUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_CAN_FULL_FIRE"].ID, true)

	end	
end
Events.SerialEventUnitCreated.Add(FeiHuGift)

----泉州海船文化产出
function SongFuChuan(playerID)

	local playerID = Game.GetActivePlayer() 			---获取playerID
	local player = Players[Game.GetActivePlayer()] 		-----获取player

		if player == nil then
		print ("No players")
		return
	end
	
	if player:IsBarbarian() or player:IsMinorCiv() then
		print ("Minors are Not available!")
    	return
	end
	
	if player:GetNumCities() <= 0 then 
		print ("No Cities!")
		return
	end

	if not player:IsHuman() then
		return;
	end

	local numship = 0
	local pCapital = player:GetCapitalCity()    --获取首都

	for unit in player:Units() do 		--遍历所有单位	
		if unit:GetUnitType() == GameInfoTypes["UNIT_SONG_CARGOSHIP"] then	
			numship = numship + 1
		end
	end

	pCapital:SetNumRealBuilding(GameInfoTypes["BUILDING_SONG_CARGOSHIP"], numship)
end

Events.SerialEventUnitCreated.Add(SongFuChuan)
GameEvents.PlayerDoTurn.Add(SongFuChuan)