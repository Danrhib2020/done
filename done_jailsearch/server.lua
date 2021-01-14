----------------------------
--- ** GEGKAH PROJECT ** ---
------   BY : DONE   -------
----------------------------
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('donejail:add')
AddEventHandler('donejail:add', function(type, amount, name)
	local xPlayer  = ESX.GetPlayerFromId(source)

	if type == 'money' then
		xPlayer.addMoney(amount)
	elseif type == 'item' then
		xPlayer.addInventoryItem(name, amount)
	end
end)