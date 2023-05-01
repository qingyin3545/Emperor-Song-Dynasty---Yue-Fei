-- SaveUtils
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "NanSong_YueFei";
include("FLuaVector.lua")

local YfsFortLv1 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT1"]  --堡寨
local YfsFortLv2 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT2"]  --城寨
local YfsFortLv3 = GameInfoTypes["IMPROVEMENT_YFS_SONG_FORT3"]  --军寨

print("YfsFortLv1="..YfsFortLv1);
print("YfsFortLv2="..YfsFortLv2);
print("YfsFortLv3="..YfsFortLv3);

local width, height = Map.GetGridSize()

-- 根据游戏速度调整升级事件
local iGameSpeed = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GrowthPercent / 100
local YfsFortLv1_Threshold = 10 * iGameSpeed
local YfsFortLv2_Threshold = 15 * iGameSpeed

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
-- GameEvents.PlayerDoTurn.Add(UpgradeForts) 

-- GameEvents.GetImprovementXPPerTurn.Add(function(iX, iY, iImprovementType, iCurrentXP, iOwner, iWorkCity) return 0 end); // notice: the iOnwer or iWorkCity may be -1
-- GameEvents.OnImprovementUpgrade.Add(function(iX, iY, iOldImprovementType, iNewImprovementType, iOwner, iWorkCity) return end);
-- GameEvents.OnImprovementDowngrade.Add(function(iX, iY, iOldImprovementType, iNewImprovementType, iOwner, iWorkCity) return end);
-- function plot:GetXP() return XP;
-- function plot:GetXPGrowth() return XP;
-- function plot:ChangeXP(iChange, bDoUpdate) return iNewXP;
-- function plot:SetXP(iVal, bDoUpdate) return XP;
----------------------------------------------------------------------------------------------------------------------------
-- 新DLL功能测试
----------------------------------------------------------------------------------------------------------------------------
function GetYfsFortXPPerTurn(iX, iY, iImprovementType, iCurrentXP, iOwner, iWorkCity)
	if Players[iOwner] == nil
	or Players[iOwner]:GetCityByID(iWorkCity) == nil 
	or Map.GetPlot(iX, iY) == nil
    or Players[iOwner]:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_YFS_SONG"]
    then
		return;
	end

	local pPlayer = Players[iOwner];
	local pCity = pPlayer:GetCityByID(iWorkCity);
	local plot = Map.GetPlot(iX, iY);
	-- print("iImprovementType="..iImprovementType);
	if iImprovementType == YfsFortLv1 then
		-- print("per_yfsLv1_iCurrentXP="..iCurrentXP);
		-- print("per_yfsLv1_GetXP()="..plot:GetXP());
		-- 每回合5点经验
		if not plot:IsImprovementPillaged() then
	    	if plot:IsBeingWorked() then
				return 100 / YfsFortLv1_Threshold;
				-- return 5;
			end
		end
	elseif iImprovementType == YfsFortLv2 then
		-- print("per_yfsLv2_iCurrentXP="..iCurrentXP);
		-- print("per_yfsLv2_GetXP()="..plot:GetXP());
		if not plot:IsImprovementPillaged() then
	    	if plot:IsBeingWorked() then
				return 100 / YfsFortLv2_Threshold;
			end	
		end
		return -50 / YfsFortLv2_Threshold;
	elseif iImprovementType == YfsFortLv3 then
		-- print("per_yfsLv3_iCurrentXP="..iCurrentXP);
		-- print("per_yfsLv3_GetXP()="..plot:GetXP());
		if not plot:IsImprovementPillaged() then
	    	if plot:IsBeingWorked() then
				return 5;
			end
		end
		return -2;
	end
	return 0;
end
GameEvents.GetImprovementXPPerTurn.Add(GetYfsFortXPPerTurn);
function OnYfsFortUpgrade(iX, iY, iOldImprovementType, iNewImprovementType, iOwner, iWorkCity)
	if Players[iOwner] == nil
	or Players[iOwner]:GetCityByID(iWorkCity) == nil 
	or Map.GetPlot(iX, iY) == nil
    or Players[iOwner]:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_YFS_SONG"]
    then
		return;
	end

	local pPlayer = Players[iOwner];
	local pCity = pPlayer:GetCityByID(iWorkCity);
	local plot = Map.GetPlot(iX, iY);	
	-- print("iOldImprovementType="..iOldImprovementType);
	-- print("iNewImprovementType="..iNewImprovementType);

	if iOldImprovementType == YfsFortLv1 
	and iNewImprovementType == YfsFortLv2
	then
		-- print("up_yfsLv1_GetXP()="..plot:GetXP());
		if pPlayer:IsHuman() then
			local heading = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT1_LVUP_SHORT");
			local text1 = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT1_LVUP_TEXT");
			local text2 = Locale.ConvertTextKey("TXT_KEY_IMPROVEMENT_YFS_SONG_FORT2_HELP");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text1..text2, heading, iX, iY);
			local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]Level UP![ENDCOLOR]"));
			Events.GameplayFX(hex.x, hex.y, -1);
		end
	elseif iOldImprovementType == YfsFortLv2
	and iNewImprovementType == YfsFortLv3
	then
		-- print("up_yfsLv2_GetXP()="..plot:GetXP());
		if pPlayer:IsHuman() then
			local heading = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT2_LVUP_SHORT");
			local text1 = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT2_LVUP_TEXT");
			local text2 = Locale.ConvertTextKey("TXT_KEY_IMPROVEMENT_YFS_SONG_FORT3_HELP");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text1..text2, heading, iX, iY);
			local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]Level UP![ENDCOLOR]"));
			Events.GameplayFX(hex.x, hex.y, -1);
		end
	end
end
GameEvents.OnImprovementUpgrade.Add(OnYfsFortUpgrade);
function OnYfsFortDowngrade(iX, iY, iOldImprovementType, iNewImprovementType, iOwner, iWorkCity)
	if Players[iOwner] == nil
	or Players[iOwner]:GetCityByID(iWorkCity) == nil 
	or Map.GetPlot(iX, iY) == nil
    or Players[iOwner]:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_YFS_SONG"]
    then
		return;
	end

	local pPlayer = Players[iOwner];
	local pCity = pPlayer:GetCityByID(iWorkCity);
	local plot = Map.GetPlot(iX, iY);	
	-- print("iOldImprovementType="..iOldImprovementType);
	-- print("iNewImprovementType="..iNewImprovementType);

	if iOldImprovementType == YfsFortLv2
	and iNewImprovementType == YfsFortLv1
	then
		-- print("down_yfsLv2_GetXP()="..plot:GetXP());
		if pPlayer:IsHuman() then
			local heading = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT2_LVDN_SHORT");
			local text1 = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT2_LVDN_TEXT");
			local text2 = Locale.ConvertTextKey("TXT_KEY_IMPROVEMENT_YFS_SONG_FORT1_HELP");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text1..text2, heading, iX, iY);
			local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]Level Down![ENDCOLOR]"));
			Events.GameplayFX(hex.x, hex.y, -1);
		end
	elseif iOldImprovementType == YfsFortLv3
	and iNewImprovementType == YfsFortLv2
	then
		-- print("down_yfsLv2_GetXP()="..plot:GetXP());
		if pPlayer:IsHuman() then
			local heading = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT3_LVDN_SHORT");
			local text1 = Locale.ConvertTextKey("TXT_KEY_YFS_SONG_FORT3_LVDN_TEXT");
			local text2 = Locale.ConvertTextKey("TXT_KEY_IMPROVEMENT_YFS_SONG_FORT2_HELP");
			pPlayer:AddNotification(NotificationTypes.NOTIFICATION_GENERIC, text1..text2, heading, iX, iY);
			local hex = ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()));
			Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]Level Down![ENDCOLOR]"));
			Events.GameplayFX(hex.x, hex.y, -1);
		end
	end
end
GameEvents.OnImprovementDowngrade.Add(OnYfsFortDowngrade);
----------------------------------------------------------------------------------------------------------------------------
-- 堡寨数量上限
----------------------------------------------------------------------------------------------------------------------------
function BuildAvailableYfsFort(iPlayer, iUnit, iX, iY, iBuild)
	if Players[iPlayer] == nil then return end;
	if Map.GetPlot(iX, iY) == nil then
		return;
	end
	local pPlayer = Players[iPlayer];
	local pPlot = Map.GetPlot(iX, iY);

	local numyfsForts = pPlayer:GetImprovementCount(YfsFortLv1) 
					  + pPlayer:GetImprovementCount(YfsFortLv2)
					  + pPlayer:GetImprovementCount(YfsFortLv3)
	
	if iBuild == GameInfo.Builds["BUILD_YFS_SONG_FORT1"].ID 
	and numyfsForts >= 1 + math.floor(pPlayer:GetTotalPopulation() / 10)
	then
		return false;
	else
		return true;
	end
end
GameEvents.PlayerCanBuild.Add(BuildAvailableYfsFort)