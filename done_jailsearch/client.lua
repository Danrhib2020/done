----------------------------
--- ** GEGKAH PROJECT ** ---
------   BY : DONE   -------
----------------------------


ESX = nil
local PlayerData = {}

Citizen.CreateThread(function ()
    while ESX == nil do
     TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
     Citizen.Wait(1)
    end
   
    while ESX.GetPlayerData() == nil do
     Citizen.Wait(10)
    end
   
    PlayerData = ESX.GetPlayerData()
end)

   
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)


--##CODE START HERE##--
Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		for k,v in pairs(Config.Jaildrinks) do
			local coords = GetEntityCoords(GetPlayerPed(-1))
				if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 3.0) then
				if not inMission then
					DrawText3D(v.x, v.y, v.z, ('Press E to search'))	
					if IsControlJustReleased(0, 46) and (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 0.3) then
						local finished = exports["reload-skillbar"]:taskBar(8000,math.random(5,15))
						if finished == 100 then
							TaskStartScenarioInPlace(GetPlayerPed(-1), "prop_human_bum_bin", "react_flee", 0, true) 
							local finished = exports["np-taskbar"]:taskBar(15000,"Searching")
							Citizen.Wait(15000)
							ClearPedTasksImmediately(PlayerPedId())
							TriggerServerEvent('donejail:add', 'item', 1, "icetea")
						end	
					end
				end
			
		end
	end
end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(0)
		for k,v in pairs(Config.Jailsearch) do
			local coords = GetEntityCoords(GetPlayerPed(-1))
				if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 3.0) then
				if not inMission then
					DrawText3D(v.x, v.y, v.z, ('Press E to search'))	
					if IsControlJustReleased(0, 46) and (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 0.3) then
						local finished = exports["reload-skillbar"]:taskBar(8000,math.random(5,15))
						if finished == 100 then
							TaskStartScenarioInPlace(GetPlayerPed(-1), "prop_human_bum_bin", "react_flee", 0, true) 
							local finished = exports["np-taskbar"]:taskBar(15000,"Searching")
							Citizen.Wait(15000)
							ClearPedTasksImmediately(PlayerPedId())
							TriggerServerEvent('donejail:add', 'item', 1, "hamburger")
						end						
					end
				end
			
		end
	end
end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end




