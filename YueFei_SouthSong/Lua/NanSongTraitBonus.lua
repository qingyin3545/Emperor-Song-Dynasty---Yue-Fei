-- NanSongBonus
-- Author: dzs2311
-- DateCreated: 2021/4/7 22:12:07
--------------------------------------------------------------
print("---------------------------------------------------------------")
print("------------------NanSongTrait Lua Loaded--------------------------")
print("---------------------------------------------------------------")
-- SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "NanSong_YueFei";
include("FLuaVector.lua")

-- Start Fuction
--============================================================================================================
-- 街市建造效果
--============================================================================================================
function YfsCityBuildingMarket(iPlayer, iCity, iBuilding)
	local pPlayer = Players[iPlayer]
	if pPlayer == nil or pPlayer:IsMinorCiv() or pPlayer:IsBarbarian() then
	 	return
	end
	if GameInfo.Buildings[iBuilding].Type ~= GameInfoTypes["BUILDING_SONG_MARKET"] then return end

	local city = pPlayer:GetCityByID(iCity)
	-- 街市加成建筑
	local g_SongMarketBonusBuildings = {GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_1'],
										GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_2'],
										GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_3'],
										GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_4'],
										GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_5'],
										GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_6'],
										GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_7'],
										GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_8']}
	local numMarketBonus = 0
	for k, v in pairs(g_SongMarketBonusBuildings) do
		if city:GetNumBuilding(v.ID) > 0 then
			--建成状态，可以判断此时在出售建筑
			numMarketBonus = 1
			break
		end
	end

	if numMarketBonus == 0 then
		local randomNum = math.random(1, #g_SongMarketBonusBuildings)
		city:SetNumRealBuilding(g_SongMarketBonusBuildings[randomNum], 1)
		if pPlayer:IsHuman() then
			local text = Locale.ConvertTextKey( "TXT_KEY_BUILDING_SONG_MARKET_CONSTRUCTED", city:GetName(), g_SongMarketBonusBuildings[randomNum].Description )
			Events.GameplayAlertMessage( Locale.ConvertTextKey())
		end
	elseif numMarketBonus > 0 then
		for k, v in pairs(g_SongMarketBonusBuildings) do
			city:SetNumRealBuilding(v.ID, 0)
		end
		if pPlayer:IsHuman() then
			local text = Locale.ConvertTextKey( "TXT_KEY_BUILDING_SONG_MARKET_SOLD", city:GetName() )
			Events.GameplayAlertMessage( Locale.ConvertTextKey())
		end
	end

end
GameEvents.CityConstructed.Add(YfsCityBuildingMarket)
GameEvents.CitySoldBuilding.Add(YfsCityBuildingMarket)


-- 所有城市第一座奇观免费
local iGameSpeedType = Game.GetGameSpeedType()
local ifactor = GameInfo.GameSpeeds[iGameSpeedType].ConstructPercent  / 100
ifactor = 2.0
local wonders_production = {135, 295, 405, 625, 970, 1440, 2415, 2875, 4600, 6900}
--城市界面显示
function FirstWonderConstruct(playerID)
	local player = Players[playerID]
	local pEraType = player:GetCurrentEra()
	local pEraID = GameInfo.Eras[pEraType].ID
	local pCapital = player:GetCapitalCity()

	if player == nil then
		--print ("No players")
		return
	end

	if player:IsBarbarian() or player:IsMinorCiv() then
		---print ("Minors are Not available!")
    	return
	end

	if player:GetNumCities() <= 0 then 
		--print ("No Cities!")
		return
	end

	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_YFS_SONG"] then
		for city in player:Cities() do
			local iofp = city:GetOverflowProduction()
			local factor = ifactor
			print("city:GetOverflowProduction() = "..iofp)
			-- 溢出锤高于最大产能建筑时清零
			if iofp > wonders_production[pEraID + 1] * ifactor then
				city:SetOverflowProduction(0)
			end
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_FIRSTWONDER_PRODUCTION"], 0)
			if (city:GetNumWorldWonders() < 1) then
			--local iwonderproduction = wonders_production[pEraID + 1] * ifactor
			local city_production = city:GetYieldRate(YieldTypes.YIELD_PRODUCTION) + 0.01
			local nsNumber = math.ceil(10000 * ifactor / city_production)

			city:SetNumRealBuilding(GameInfoTypes["BUILDING_FIRSTWONDER_PRODUCTION"],nsNumber)
			end
		end
	end

	for city in player:Cities() do
		-- 街市加成建筑
		local g_SongMarketBonusBuildings = {GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_1'],
											GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_2'],
											GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_3'],
											GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_4'],
											GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_5'],
											GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_6'],
											GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_7'],
											GameInfo.Buildings['BUILDING_YFS_MARKET_BONUS_8']}
		local numMarketBonus = 0
		for k, v in pairs(g_SongMarketBonusBuildings) do
			if city:GetNumBuilding(v.ID) > 0 then
				numMarketBonus = 1
				break
			end
		end

		if city:GetNumBuilding() > 0 and numMarketBonus == 0 then
			--有街市无店铺
			local randomNum = math.random(1, #g_SongMarketBonusBuildings)
			city:SetNumRealBuilding(g_SongMarketBonusBuildings[randomNum], 1)
			if player:IsHuman() then
				local text = Locale.ConvertTextKey( "TXT_KEY_BUILDING_SONG_MARKET_CONSTRUCTED", city:GetName(), g_SongMarketBonusBuildings[randomNum].Description )
				Events.GameplayAlertMessage( Locale.ConvertTextKey())
			end
		elseif city:GetNumBuilding() == 0 and numMarketBonus > 0 then
			-- 有店铺无街市
			for k, v in pairs(g_SongMarketBonusBuildings) do
				city:SetNumRealBuilding(v.ID, 0)
			end
			if player:IsHuman() then
				local text = Locale.ConvertTextKey( "TXT_KEY_BUILDING_SONG_MARKET_SOLD", city:GetName() )
				Events.GameplayAlertMessage( Locale.ConvertTextKey())
			end
		end

	end
end
GameEvents.PlayerDoTurn.Add(FirstWonderConstruct)
GameEvents.PlayerCityFounded.Add(FirstWonderConstruct)


local infantry_data = {GameInfoTypes["UNIT_SWORDSMAN"],
					   GameInfoTypes["UNIT_SWORDSMAN"],
					   GameInfoTypes["UNIT_BEIWEI_FOOT"],
					   GameInfoTypes["UNIT_BEIWEI_FOOT"],
					   GameInfoTypes["UNIT_RIFLEMAN"],
					   GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"],
					   GameInfoTypes["UNIT_INFANTRY"],
					   GameInfoTypes["UNIT_MOTORISED_INFANTRY"],
					   GameInfoTypes["UNIT_MECHANIZED_INFANTRY"],
					   GameInfoTypes["UNIT_MECHANIZED_INFANTRY"]}
-- 御营使司
-- 东京留守司
function YuYingBonus(playerID)
	local player = Players[playerID]
	local iTeamID = player:GetTeam() 
	local pTeam = Teams[iTeamID]
	local iWarNum = pTeam:GetAtWarCount(true)
	local pEraType = player:GetCurrentEra()
	-- local pEraID = GameInfo.Eras[pEraType].ID
	local pEraID = 2
	
	if player == nil then
		--print ("No players")
		return
	end
	
	if player:IsBarbarian() or player:IsMinorCiv() then
		--print ("Minors are Not available!")
    	return
	end
	
	if player:GetNumCities() <= 0 then 
		--print ("No Cities!")
		return
	end

	local CapCity = player:GetCapitalCity();
	
	--player:SetHasPolicy(GameInfo.Policies["POLICY_YUYING"].ID,false)

	if player:CountNumBuildings(GameInfoTypes["BUILDING_YUYING"]) > 0 and 
	not player:HasPolicy(GameInfo.Policies["POLICY_YUYING"].ID) 
	then 
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfo.Policies["POLICY_YUYING"].ID,true)	 
		-- print("Player has wonder 1! Give them policy 1!")
	end

	if iWarNum > 0 then

		-- 留守司统制计数
		local numship = 0

		for unit in player:Units() do 		--遍历所有单位	
			if unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE1"].ID) then	
				numship = numship + 1
			end
		end

		local ifNuM = load( player, "LiuShouSiFoot", ifNuM) or -1;
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_SONG_LIUSHOUSI"]) then

				if ifNuM < 0 then

					if ((PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_HIGH") ~= 1 
					and PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_MEDIUM") ~= 1 
					and PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_LOW") ~= 1) 
					and numship == 0 )

					or ((PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_HIGH") ~= 1 
					and PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_MEDIUM") ~= 1 
					and PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_LOW") ~= 1) 
					and numship > 0 )

					or ((PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_HIGH") == 1 
					or PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_MEDIUM") == 1 
					or PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_LOW") == 1) 
					and player:CountNumBuildings(GameInfoTypes["BUILDING_TROOPS"]) > 0 
					and numship == 0 )
					then
						-- 新单位或未开启军团模式
						newUnit = player:InitUnit(infantry_data[pEraID+1], city:GetX(), city:GetY())
						newUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE"].ID, true)
						newUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE1"].ID, true)
						SetLiuShouSiUnitsName( playerID, newUnit:GetID() )
						newUnit:JumpToNearestValidPlot()
						ifNuM = ifNuM + 1
						save( player,  "LiuShouSiFoot", ifNuM )
						if player:IsHuman() then
							local plotX, plotY = newUnit:GetX(), newUnit:GetY()
							local hex = ToHexFromGrid(Vector2(plotX, plotY))
							Events.GameplayFX(hex.x, hex.y, -1)
						end
					elseif numship > 0 
					and (PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_HIGH") == 1 
						 or PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_MEDIUM") == 1 
						 or PreGame.GetGameOption("GAMEOPTION_SP_CORPS_MODE_LOW") == 1)
					then
						-- 军团模式开启
						local full_flag1 = 0
						local full_flag2 = 0
						local full_flag = 0
						for unit in player:Units() do
							if unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE1"].ID)
							and not unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CORPS_1"].ID)
							and not unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CORPS_2"].ID)
							then
								unit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_CORPS_1"].ID, true)
								ifNuM = ifNuM + 1
								save( player,  "LiuShouSiFoot", ifNuM ) 
								full_flag1 = 1
								if player:IsHuman() then
									local plotX, plotY = unit:GetX(), unit:GetY()
									local hex = ToHexFromGrid(Vector2(plotX, plotY))
									Events.GameplayFX(hex.x, hex.y, -1)
								end
							elseif unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE1"].ID)
							and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CORPS_1"].ID)
							and not unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CORPS_2"].ID)
							and full_flag1 == 0
							then 
								unit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_CORPS_2"].ID, true)
								ifNuM = ifNuM + 1
								save( player,  "LiuShouSiFoot", ifNuM )
								full_flag2 = 1
								if player:IsHuman() then
									local plotX, plotY = unit:GetX(), unit:GetY()
									local hex = ToHexFromGrid(Vector2(plotX, plotY))
									Events.GameplayFX(hex.x, hex.y, -1)
								end
							elseif unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE1"].ID)
							and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CORPS_1"].ID)
							and unit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_CORPS_2"].ID)
							and full_flag1 == 0 
							and full_flag2 == 0
							then 
								full_flag = 1
							end
						end
						if CapCity:GetNumBuilding(GameInfoTypes["BUILDING_TROOPS"]) - CapCity:GetNumBuilding(GameInfoTypes["BUILDING_TROOPS_USED"]) > 0 
						and (full_flag == 1 and full_flag1 == 0 and full_flag2 == 0) 
						then
							-- 集团军满员且有剩余未使用兵力
							newUnit = player:InitUnit(infantry_data[pEraID+1], city:GetX(), city:GetY())
							newUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE"].ID, true)
							newUnit:SetHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE1"].ID, true)
							SetLiuShouSiUnitsName( playerID, newUnit:GetID() )
							newUnit:JumpToNearestValidPlot()
							ifNuM = ifNuM + 1
							save( player,  "LiuShouSiFoot", ifNuM ) 
							if player:IsHuman() then
								local plotX, plotY = newUnit:GetX(), newUnit:GetY()
								local hex = ToHexFromGrid(Vector2(plotX, plotY))
								Events.GameplayFX(hex.x, hex.y, -1)
							end
						end
					end
				elseif ifNuM >= 0 then
					ifNuM = -1
					save( player,  "LiuShouSiFoot", ifNuM )
				end

			end
		end
	end
end--function END
GameEvents.PlayerDoTurn.Add(YuYingBonus)

-- 每攻陷一座城市带来4%的全局科研文化和产能加成
function SongCaptureCity(hexPos, iPlayer, cityID, newiPlayer)

	local pCityPlot = Map.GetPlot( ToGridFromHex( hexPos.x, hexPos.y ) )------获取城市所在地块
	local player = Players[newiPlayer]         -------获取玩家
	local pCity = pCityPlot:GetPlotCity()                       -----获取城市
	local citySize = pCity:GetPopulation()	-------获取城市人口规模

	pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_YFS_SONG"], 0)

	if player == nil then
		print ("No players")
		return
	end
	
	if player:IsBarbarian() or player:IsMinorCiv() then
		print ("Minors are Not available!")
    	return
	end

	if not player:IsHuman() then
		return;
	end

	if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_YFS_SONG"] then
		return
	end

	local pCapital = player:GetCapitalCity();
	local cityX = pCity:GetX();
	local cityY = pCity:GetY();
	local pCapPlot = pCapital:Plot();
	local CapX = pCapital:GetX()
	local CapY = pCapital:GetY()

	local WorldSizeLength = Map.GetGridSize()

	local DistanceLV3 = WorldSizeLength / 5
	if DistanceLV3 > 30 then
	   DistanceLV3 = 30
	elseif DistanceLV3 < 26 then
	   DistanceLV3 = 26
	end
	print ("DistanceLV3:"..DistanceLV3)
	local Distance = Map.PlotDistance (cityX,cityY,CapX,CapY);




	if Distance >= DistanceLV3 then
		pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_YFS_SONG"], 1)
	end

end
Events.SerialEventCityCaptured.Add(SongCaptureCity)

function SetLiuShouSiUnitsName( iPlayerID, iUnitID )
	if Players[ iPlayerID ] == nil or not Players[ iPlayerID ]:IsAlive()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ) == nil
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDead()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):IsDelayedDeath()
	or Players[ iPlayerID ]:GetUnitByID( iUnitID ):HasName()
	then
		return;
	end
	local pUnit = Players[ iPlayerID ]:GetUnitByID( iUnitID );
	local idhNuM = load( Players[ iPlayerID ], "LiuShouSi", idhNuM) or 1;

	if     pUnit:IsHasPromotion(GameInfo.UnitPromotions["PROMOTION_DUHE"].ID) then
		local text = Locale.ConvertTextKey("TXT_KEY_BUILDING_SONG_LIUSHOUSI_NAME")
		pUnit:SetName("[COLOR_CYAN]"..text..convert_arab_to_chinese(idhNuM).."[ENDCOLOR]");		-- Locale.ConvertTextKey("TXT_KEY_UNIT_IMPERIAL_GUARD_CAVALRY_ELITE_NAME")
		idhNuM = idhNuM + 1
		save( Players[ iPlayerID ], "LiuShouSi", idhNuM )
	end
end
-- Events.SerialEventUnitCreated.Add(SetLiuShouSiUnitsName)

function convert_arab_to_chinese(number)
    assert(tonumber(number), "传入参数非正确number类型！")
    local numerical_tbl = {}
    local numerical_names = {[0] = "零", "一", "二", "三", "四", "五", "六", "七", "八", "九"}
    local numerical_units = {"", "十", "百", "千", "万", "十", "百", "千", "亿", "十", "百", "千", "兆", "十", "百", "千"}
 
    --01，数字转成表结构存储
    local numerical_length = string.len(number)
    for i = 1, numerical_length do
	numerical_tbl[i] = tonumber(string.sub(number, i, i))
    end
 
    --02，对应数字转中文处理
    local result_numberical = ""
    local to_append_zero, need_filling = false, true
    for index, number in ipairs(numerical_tbl) do
	--从高位到底位的顺序数字转成对应的从低位到高位的顺序数字单位.
	local real_unit_index = numerical_length - index + 1
	if number == 0 then
	   if need_filling then
	      if real_unit_index == 5 then--万位
		 result_numberical = result_numberical .. "万"
		 need_filling = false
	      end
	      if real_unit_index == 9 then--亿位
		 result_numberical = result_numberical .. "亿"
		 need_filling = false
	      end
	      if real_unit_index == 13 then--兆位
		 result_numberical = result_numberical .. "兆"
		 need_filling = false
	      end
	   end
	   to_append_zero = true
        else
	   if to_append_zero then
	      result_numberical = result_numberical .. "零"
	      to_append_zero = false
           end
	   result_numberical = result_numberical  .. numerical_names[number] .. numerical_units[real_unit_index]
	   if real_unit_index == 5 or real_unit_index == 9 or real_unit_index == 13 then
		need_filling = false
	   else
		need_filling = true
	   end
	end
    end
    return result_numberical
end
-- ————————————————
-- 版权声明：本文为CSDN博主「风轻淡淡」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
-- 原文链接：https://blog.csdn.net/arisking/article/details/99209292