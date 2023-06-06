local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('c_Rx:server:fillprescription', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem('vicodin_prescription', 1 ) then
		if Player.Functions.AddItem('vicodinbottle', 1) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['vicodinbottle'], "add", 1)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['vicodin_prescription'], "remove", 1)
				TriggerClientEvent('QBCore:Notify', src, "Vicodin was filled!", "success")
		end
	elseif Player.Functions.RemoveItem('adderal_prescription', 1 ) then
		if Player.Functions.AddItem('adderalbottle', 1) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['adderalbottle'], "add", 1)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['adderal_prescription'], "remove", 1)
				TriggerClientEvent('QBCore:Notify', src, "Adderal was filled!", "success")
		end
	elseif Player.Functions.RemoveItem('morphine_prescription', 1 ) then
		if Player.Functions.AddItem('morphinebottle', 1) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['morphinebottle'], "add", 1)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['morphine_prescription'], "remove", 1)
				TriggerClientEvent('QBCore:Notify', src, "Morphine was filled!", "success")
		end
	elseif Player.Functions.RemoveItem('xanax_prescription', 1 ) then
		if Player.Functions.AddItem('xanaxbottle', 1) then
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['xanaxbottle'], "add", 1)
				TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['xanax_prescription'], "remove", 1)
				TriggerClientEvent('QBCore:Notify', src, "Xanax was filled!", "success")
		end
	else
	TriggerClientEvent('QBCore:Notify', src, "You must have a prescription to request a fill..", "error")
	end
end)


QBCore.Functions.CreateUseableItem('prescription_pad', function(source, item)
	local src = source
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
		if v.PlayerData.job.name == Config.EMSJob then
			TriggerClientEvent('c_Rx:client:prescriptionwriteup', src, item.name)
		elseif not v.PlayerData.job.name == Config.EMSJob then
			TriggerClientEvent('QBCore:Notify', src,"You must be a EMS..", "error")
		end
	end
end)


RegisterServerEvent('c_Rx:server:getvicodinform', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('vicodin_prescription', 1)
	TriggerClientEvent('QBCore:Notify', src,"You wrote 1 Prescription for Vicodin..", "success")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['vicodin_prescription'], "add")
	Player.Functions.RemoveItem('c_prescriptionform', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['c_prescriptionform'], "remove")
end)

RegisterServerEvent('c_Rx:server:getadderalform', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('adderal_prescription', 1)
	TriggerClientEvent('QBCore:Notify', src,"You wrote 1 Prescription for Adderal..", "success")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['adderal_prescription'], "add")
	Player.Functions.RemoveItem('c_prescriptionform', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['c_prescriptionform'], "remove")
end)


RegisterServerEvent('c_Rx:server:getmorphineform', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('morphine_prescription', 1)
	TriggerClientEvent('QBCore:Notify', src,"You wrote 1 Prescription for Morphine..", "success")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['morphine_prescription'], "add")
	Player.Functions.RemoveItem('c_prescriptionform', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['c_prescriptionform'], "remove")
end)


RegisterServerEvent('c_Rx:server:getxanaxform', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	Player.Functions.AddItem('xanax_prescription', 1)
	TriggerClientEvent('QBCore:Notify', src,"You wrote 1 Prescription for Xanax..", "success")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['vicodin_prescription'], "add")
	Player.Functions.RemoveItem('c_prescriptionform', 1)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['c_prescriptionform'], "remove")
end)

QBCore.Functions.CreateUseableItem('vicodinbottle', function(source, item)
local src = source
local Player = QBCore.Functions.GetPlayer(src)
	if TriggerClientEvent('c_Rx:client:openingvicodin', src, item.name) then
		Player.Functions.RemoveItem('vicodinbottle', 1)
		TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['vicodinbottle'], "remove", 1)
	end
end)
RegisterServerEvent('c_Rx:server:getvicodinpills', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local luck = Config.VicodinGiven
	Player.Functions.AddItem('vicodin', luck)
	TriggerClientEvent('QBCore:Notify', src,"You got ".. luck .. " Vicodin!", "success")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['vicodin'], "add", luck)

end)


QBCore.Functions.CreateUseableItem('adderalbottle', function(source, item)
local src = source
local Player = QBCore.Functions.GetPlayer(src)
	if TriggerClientEvent('c_Rx:client:openingadderal', src, item.name) then
		Player.Functions.RemoveItem('adderalbottle', 1)
	end
end)
RegisterServerEvent('c_Rx:server:getadderalpills', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local luck = Config.AdderalGiven
	Player.Functions.AddItem('adderal', luck)
	TriggerClientEvent('QBCore:Notify', src,"You got ".. luck .. " Adderal!", "success")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['adderal'], "add", luck)
end)


QBCore.Functions.CreateUseableItem('morphinebottle', function(source, item)
local src = source
local Player = QBCore.Functions.GetPlayer(src)
	if TriggerClientEvent('c_Rx:client:openingmorphine', src, item.name) then
		Player.Functions.RemoveItem('morphinebottle', 1)
	end
end)
RegisterServerEvent('c_Rx:server:getmorphinepills', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local luck = Config.MorphineGiven
	Player.Functions.AddItem('morphine', luck)
	TriggerClientEvent('QBCore:Notify', src,"You got ".. luck .. " Morphine!", "success")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['morphine'], "add", luck)
end)


QBCore.Functions.CreateUseableItem('xanaxbottle', function(source, item)
local src = source
local Player = QBCore.Functions.GetPlayer(src)
	if TriggerClientEvent('c_Rx:client:openingxanax', src, item.name) then
		Player.Functions.RemoveItem('xanaxbottle', 1)
	end
end)
RegisterServerEvent('c_Rx:server:getxanaxpills', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local luck = Config.XanaxGiven
	Player.Functions.AddItem('xanax', luck)
	TriggerClientEvent('QBCore:Notify', src,"You got ".. luck .. " Xanax!", "success")
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items['xanax'], "add", luck)
end)



