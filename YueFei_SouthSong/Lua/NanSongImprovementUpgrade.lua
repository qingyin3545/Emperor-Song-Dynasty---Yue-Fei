-- SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "NanSong_YueFei";

local YfsFortLv1 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT1"]  --堡寨
local YfsFortLv2 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT2"]  --城寨
local YfsFortLv3 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT3"]  --军寨

local width, height = Map.GetGridSize()

-- 根据游戏速度调整升级事件
local iGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GrowthPercent / 100
local YfsFortLv1_Threshold = 5 * iGameSpeed
local YfsFortLv2_Threshold = 7 * iGameSpeed

local MapTable = {}
--[[
Master table with plot coords as keys whose values are structures containing the plot's data: which imp is here --
5 possibilites -- and its current counter value
]]

function UpgradeYfsFortLv1(plot, pPlayer)
    MapTable = load( pPlayer, "IfsFort", plot) or {}
	if plot:GetImprovementType() == YfsFortLv1 then
		--print("Has Outdoor Market")
		if MapTable[plot] == nil then --Only initialize when it's a new one
			MapTable[plot] = {type = YfsFortLv1, counter = 0}
			--print("It is new")
		end 

	    if not plot:IsImprovementPillaged() then
	    	--print("Is not pillaged")
	    	if plot:IsBeingWorked() then
	    		--print("Is being worked")
	    		--print("Before interation " .. MapTable[plot].counter)
	    		MapTable[plot].counter = MapTable[plot].counter + 1
	    		--print("After interation " .. MapTable[plot].counter)
	    		if MapTable[plot].counter >= YfsFortLv1_Threshold then
	    			plot:SetImprovementType(YfsFortLv2)
	    			MapTable[plot].type = YfsFortLv2
	    			MapTable[plot].counter = -1
	    			--print("Now has improvement #" .. Hamlet)
	    			--print("Counter: " .. MapTable[plot].counter)
	    		end
	    	end
	    end

	elseif MapTable[plot] ~= nil and MapTable[plot].type == YfsFortLv1 then
		--print("No longer has Outdoor Market")
		MapTable[plot].type = nil
		MapTable[plot].counter = nil
		MapTable[plot] = nil
	end
    MapTable = save( pPlayer, "IfsFort", plot)
end

function UpgradeYfsFortLv2(plot, pPlayer)
    MapTable = load( pPlayer, "IfsFort", plot) or {}
	if plot:GetImprovementType() == YfsFortLv2 then
		--print("Has Hamlet")
		if MapTable[plot] == nil then --Only initialize when it's a new one
			MapTable[plot] = {type = YfsFortLv2, counter = 0}
			--print("It is new")
		end 
		if not plot:IsImprovementPillaged() then
			--print("Is not pillaged")
			if plot:IsBeingWorked() then
				--print("Is being worked")
				MapTable[plot].counter = MapTable[plot].counter + 1
				--print("After interation " .. MapTable[plot].counter)
				if MapTable[plot].counter >= YfsFortLv2_Threshold then

					plot:SetImprovementType(YfsFortLv3)
					MapTable[plot].type = YfsFortLv2
					MapTable[plot].counter = -1
					--print("Now has improvement #" .. Village)
					--print("Counter: " .. MapTable[plot].counter)
				end
			end
		end
	elseif MapTable[plot] ~= nil and MapTable[plot].type == YfsFortLv2 then
		--print("No longer has Hamlet")
		MapTable[plot].type = nil
		MapTable[plot].counter = nil
		MapTable[plot] = nil
	end
    MapTable = save( pPlayer, "IfsFort", plot)
end

function UpgradeForts(PlayerID)
	local pPlayer = Players[PlayerID]

    if pPlayer == nil or pPlayer:IsBarbarian() or pPlayer:IsMinorCiv() 
    or pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_YFS_SONG"]
    then
		return
	end

	for y = 0, height-1 do --loop through the whole map
		for x = 0, width-1 do
			local plot = Map.GetPlot(x, y)
			if Players[plot:GetOwner()] == pPlayer then
				UpgradeYfsFortLv1(plot, pPlayer)
				UpgradeYfsFortLv2(plot, pPlayer)
			end
		end
	end	
end
GameEvents.PlayerDoTurn.Add(UpgradeForts) 