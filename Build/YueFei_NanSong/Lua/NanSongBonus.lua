-- NanSongBonus
-- Author: dzs2311
-- DateCreated: 2021/4/7 22:12:07
--------------------------------------------------------------

-- Trade Routes Brings Tourism
local uCargo = GameInfoTypes.UNIT_NANSONG_CARGO_SHIP;
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
	AddTourism(pcCity, iNum)
	if iNum > 0 then
		if (pPlayer:IsHuman()) and (iPlayer == Game.GetActivePlayer()) then	
			Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_NANSONG_GET_TOURISM_TAG", iNum));
		end
	end
end


-- Wonders Bring Routes and Wonders Proudaction Bonus
function NS_Wonders(pPlayer)
	
end


-- Gift YangYaoShip 

-- BeiWeiTransformtion

-- Great General Acceleration

-- Great General Bonus

-- UnitBonus

-- Unit Proudaction Bonus

-- Start Fuction
function NanSongBonus(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_YUEFEI_NANSONG"]) then
			NS_RouteTourism(pPlayer)	-- Trade Routes Brings Tourism
		end
	end
end
GameEvents.PlayerDoTurn.Add(NanSongBonus)