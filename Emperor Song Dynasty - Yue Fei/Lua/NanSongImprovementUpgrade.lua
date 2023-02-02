-- SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "NanSong_YueFei";
include("FLuaVector.lua")

local YfsFortLv1 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT1"]  --堡寨
local YfsFortLv2 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT2"]  --城寨
local YfsFortLv3 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT3"]  --军寨

local width, height = Map.GetGridSize()

-- 根据游戏速度调整升级事件
local iGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GrowthPercent / 100
local YfsFortLv1_Threshold = 5 * iGameSpeed
local YfsFortLv2_Threshold = 7 * iGameSpeed

local MapTable = {}
local YfsFortLv2Flag = 0
local YfsFortLv3Flag = 0
--[[
Master table with plot coords as keys whose values are structures containing the plot's data: which imp is here --
5 possibilites -- and its current counter value
]]
-- local heading = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_US_SUPPLY_DESTROYED_SHORT", tdebuff);
-- text = Locale.ConvertTextKey("TXT_KEY_SP_NOTIFICATION_US_SUPPLY_DESTROYED", tdebuff, defUnitName, tlostHP);
-- defPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text, heading, plotX, plotY);


function UpgradeYfsFortLv1(plot, pPlayer)
    -- MapTable = load( pPlayer, "YfsFort", MapTable) or {}
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
					YfsFortLv2Flag = 1	
	    			--print("Now has improvement #" .. Hamlet)
	    			--print("Counter: " .. MapTable[plot].counter)
	    		end
	    	end
	    end

		save( plot, "YfsFortType", MapTable[plot].type )
		save( plot, "YfsFortCounter", MapTable[plot].counter )	
	elseif MapTable[plot] ~= nil and MapTable[plot].type == YfsFortLv1 then
		--print("No longer has Outdoor Market")
		MapTable[plot].type = nil
		MapTable[plot].counter = nil
		MapTable[plot] = nil
	end

end

function UpgradeYfsFortLv2(plot, pPlayer)
    -- MapTable = load( pPlayer, "YfsFort", MapTable) or {}
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
					MapTable[plot].type = YfsFortLv3
					MapTable[plot].counter = -1
					YfsFortLv3Flag = 1
					--print("Now has improvement #" .. Village)
					--print("Counter: " .. MapTable[plot].counter)
				end
			end
		end

		save( plot, "YfsFortType", MapTable[plot].type )
		save( plot, "YfsFortCounter", MapTable[plot].counter )	
	elseif MapTable[plot] ~= nil and MapTable[plot].type == YfsFortLv2 then
		--print("No longer has Hamlet")
		MapTable[plot].type = nil
		MapTable[plot].counter = nil
		MapTable[plot] = nil
	end
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
			YfsFortLv2Flag = 0
			YfsFortLv3Flag = 0

			local plot = Map.GetPlot(x, y)

			local mtype = load(plot, "YfsFortType", mtype) or nil;
			local mcounter = load(plot, "YfsFortCounter", mcounter) or nil;
			if mtype == nil and mcounter == nil then
				MapTable[plot] = nil
			else
				MapTable[plot] = {type = mtype, counter = mcounter}
			end
	
			if Players[plot:GetOwner()] == pPlayer then
				UpgradeYfsFortLv1(plot, pPlayer)
				UpgradeYfsFortLv2(plot, pPlayer)
				if pPlayer:IsHuman() then
					if YfsFortLv2Flag == 1 then
						local heading = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT1_LVUP_SHORT");
						local text1 = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT1_LVUP_TEXT");
						local text2 = Locale.ConvertTextKey("TXT_KEY_IMPROVEMENT_YFS_SONG_FORT2_HELP");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text1..text2, heading, x, y);
						local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("Level UP!"));
						Events.GameplayFX(hex.x, hex.y, -1);
					end
					if YfsFortLv3Flag == 1 then
						local heading = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT2_LVUP_SHORT");
						local text1 = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT2_LVUP_TEXT");
						local text2 = Locale.ConvertTextKey("TXT_KEY_IMPROVEMENT_YFS_SONG_FORT3_HELP");
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text1..text2, heading, x, y);
						local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("Level UP!"));
						Events.GameplayFX(hex.x, hex.y, -1);
					end
	
				end

			end
		end
	end	
end
GameEvents.PlayerDoTurn.Add(UpgradeForts) 