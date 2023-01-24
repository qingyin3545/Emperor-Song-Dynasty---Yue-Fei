-- NanSongBonus
-- Author: dzs2311
-- DateCreated: 2021/4/7 22:12:07
--------------------------------------------------------------
print("---------------------------------------------------------------")
print("------------------NanSongTrait Lua Loaded--------------------------")
print("---------------------------------------------------------------")

-- 国外商路带来旅游值
local uCargo = GameInfoTypes.UNIT_SONG_CARGOSHIP;
local uCaravan = GameInfoTypes.UNIT_CARAVAN;

local bDummy1 = GameInfoTypes.BUILDING_TOURISMHANDLER_1 
local bDummy2 = GameInfoTypes.BUILDING_TOURISMHANDLER_2 
local bDummy4 = GameInfoTypes.BUILDING_TOURISMHANDLER_4 
local bDummy8 = GameInfoTypes.BUILDING_TOURISMHANDLER_8 
local bDummy16 = GameInfoTypes.BUILDING_TOURISMHANDLER_16
local bDummy32 = GameInfoTypes.BUILDING_TOURISMHANDLER_32
local bDummy64 = GameInfoTypes.BUILDING_TOURISMHANDLER_64
local bDummy128 = GameInfoTypes.BUILDING_TOURISMHANDLER_128


function toBits(num)
	t={}
    while num>0 do
        local rest=math.fmod(num,2)
        t[#t+1]=rest
        num=(num-rest)/2
    end
    return t
end


function AddTourism(pcCity, iNum)
	local num = iNum
	toBits(num)
	pcCity:SetNumRealBuilding(bDummy, num);
	pcCity:SetNumRealBuilding(bDummy1, t[1]);
	pcCity:SetNumRealBuilding(bDummy2, t[2]);
	pcCity:SetNumRealBuilding(bDummy4, t[3]);
	pcCity:SetNumRealBuilding(bDummy8, t[4]);
	pcCity:SetNumRealBuilding(bDummy16, t[5]);
	pcCity:SetNumRealBuilding(bDummy32, t[6]);
	pcCity:SetNumRealBuilding(bDummy64, t[7]);
	pcCity:SetNumRealBuilding(bDummy128, t[8]);				
end


function NS_RouteTourism(pPlayer)
	print("Trade1")	
	local pcCity = pPlayer:GetCapitalCity();
	local cTourism = 0;
	for pUnit in pPlayer:Units() do			
		if pUnit:GetUnitType() == uCargo then -- Cargo
			local uPlot = pUnit:GetPlot()
			if uPlot:GetOwner() ~= -1 then
				if (Players[uPlot:GetOwner()] ~= pPlayer) then
					cTourism = cTourism + 4;
				end
			end
		elseif pUnit:GetUnitType() == uCaravan then -- Caravan
			local uPlot = pUnit:GetPlot()
			if uPlot:GetOwner() ~= -1 then
				if (Players[uPlot:GetOwner()] ~= pPlayer) then
					cTourism = cTourism + 2;
				end
			end
		end
	end
	local iNum = (cTourism * 2);
	print("AddTourism")
	AddTourism(pcCity, iNum)
	print("iNum=",iNum)
	if iNum > 0 then
		if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then	
			local tourismtext = Locale.ConvertTextKey("TXT_KEY_NANSONG_GET_TOURISM_TAG1") .. iNum ..  Locale.ConvertTextKey("TXT_KEY_NANSONG_GET_TOURISM_TAG2")
			Events.GameplayAlertMessage(text);
		end
	end
end

-- Start Fuction
function NanSongBonus(iPlayer)
	local pPlayer = Players[iPlayer];
	
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_YFS_SONG"]) then
			print("Trade0")
			NS_RouteTourism(pPlayer)	-- Trade Routes Brings Tourism
		end
	end
end
GameEvents.PlayerDoTurn.Add(NanSongBonus)
-- 所有城市第一座奇观免费
wonders_production = {135, 295, 405, 575, 920, 1440, 2415, 2875, 4600, 6900}

function FirstWonderConstruct(playerID)
	local player = Players[playerID]
	local pEraType = player:GetCurrentEra()
	local pEraID = GameInfo.Eras[pEraType].ID;
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_YFS_SONG"] then
		for city in player:Cities() do
			city:SetNumRealBuilding(GameInfoTypes["BUILDING_FIRSTWONDER_PRODUCTION"], 0)
				if (city:GetNumWorldWonders() < 1) then
				local factor = 1
				local iwonderproduction = wonders_production[pEraID + 1] * factor
				local city_production = city:GetYieldRate(YieldTypes.YIELD_PRODUCTION) + 0.1
				local nsNumber = math.ceil(iwonderproduction / city_production)
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_FIRSTWONDER_PRODUCTION"],nsNumber)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(FirstWonderConstruct)
GameEvents.PlayerCityFounded.Add(FirstWonderConstruct)

-- 御营使司
function YuYingBonus(playerID)
	local player = Players[playerID]
	
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
	
	player:SetHasPolicy(GameInfo.Policies["POLICY_YUYING"].ID,false)

	for city in player:Cities() do
		if city:IsHasBuilding(GameInfoTypes["BUILDING_YUYING"]) then
			player:SetHasPolicy(GameInfo.Policies["POLICY_YUYING"].ID,true)	 
			print("Player has wonder 1! Give them policy 1!")
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


	pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_YFS_SONG"], 1)

end
Events.SerialEventCityCaptured.Add(SongCaptureCity)