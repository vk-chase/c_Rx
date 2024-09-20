local QBCore = exports['qb-core']:GetCoreObject()

local function doProgressBarAndAnimation(animDict, animName, duration, text, disableControls, cb)
    TriggerEvent('animations:client:EmoteCommandStart', { animDict })
    QBCore.Functions.Progressbar("rx_action", text, duration, false, disableControls, {
        disableMovement = disableControls,
        disableCarMovement = disableControls,
        disableMouse = disableControls,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', { "c" })
        if cb then cb() end
    end)
end

local function fillPrescription(itemName, animName)
    if not QBCore.Functions.HasItem(itemName) then
        QBCore.Functions.Notify("Missing " .. itemName:gsub("_", " "):gsub("^%l", string.upper) .. " Form..", "error")
        return
    end
    
    doProgressBarAndAnimation(animName, "Faxing " .. itemName:gsub("_", " "):gsub("^%l", string.upper) .. " Paperwork..", Config.FaxingTime * 1000, true, function()
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "heartmonbeat", 0.5)
        Wait(1000)
        TriggerServerEvent("c_Rx:server:fillprescription")
    end)
end

local function openPillBottle(serverEvent)
    doProgressBarAndAnimation("uncuff", "Opening Bottle", Config.BottleTime * 1000, false, function()
        TriggerServerEvent(serverEvent)
    end)
end

local function writePrescription(serverEvent)
    if not QBCore.Functions.HasItem('c_prescriptionform') then
        QBCore.Functions.Notify("Missing a Rx Form...", "error")
        return
    elseif not QBCore.Functions.HasItem('c_rxpen') then
        QBCore.Functions.Notify("Missing a Office Pen...", "error")
        return
    end
    
    doProgressBarAndAnimation("notepad", "Writing Prescription..", Config.ScriptTime * 1000, false, function()
        TriggerServerEvent(serverEvent)
    end)
end

RegisterNetEvent("c_Rx:client:fillprescription1", function() fillPrescription('vicodin_prescription', "type") end)
RegisterNetEvent("c_Rx:client:fillprescription2", function() fillPrescription('adderal_prescription', "type2") end)
RegisterNetEvent("c_Rx:client:fillprescription3", function() fillPrescription('morphine_prescription', "type3") end)
RegisterNetEvent("c_Rx:client:fillprescription4", function() fillPrescription('xanax_prescription', "type4") end)

RegisterNetEvent("c_Rx:client:openingvicodin", function() openPillBottle('c_Rx:server:getvicodinpills') end)
RegisterNetEvent("c_Rx:client:openingadderal", function() openPillBottle('c_Rx:server:getadderalpills') end)
RegisterNetEvent("c_Rx:client:openingmorphine", function() openPillBottle('c_Rx:server:getmorphinepills') end)
RegisterNetEvent("c_Rx:client:openingxanax", function() openPillBottle('c_Rx:server:getxanaxpills') end)

RegisterNetEvent("c_Rx:client:writeprescription1", function() writePrescription('c_Rx:server:getvicodinform') end)
RegisterNetEvent("c_Rx:client:writeprescription2", function() writePrescription('c_Rx:server:getadderalform') end)
RegisterNetEvent("c_Rx:client:writeprescription3", function() writePrescription('c_Rx:server:getmorphineform') end)
RegisterNetEvent("c_Rx:client:writeprescription4", function() writePrescription('c_Rx:server:getxanaxform') end)

RegisterNetEvent('c_Rx:pharmy:scriptfill', function()
    exports['qb-menu']:openMenu({
        {id = 1, header = "Fax Machine", icon = 'vicodin_prescription', isMenuHeader = true},
        {id = 2, header = "Fill Vicoden Prescription", icon = "vicodinbottle", params = {event = "c_Rx:client:fillprescription1"}},
        {id = 3, header = "Fill Adderal Prescription", icon = "adderalbottle", params = {event = "c_Rx:client:fillprescription2"}},
        {id = 4, header = "Fill Morphine Prescription", icon = "morphinebottle", params = {event = "c_Rx:client:fillprescription3"}},
        {id = 5, header = "Fill Xanax Prescription", icon = "xanaxbottle", params = {event = "c_Rx:client:fillprescription4"}},
    })
end)

RegisterNetEvent('c_Rx:client:prescriptionwriteup', function()
    exports['qb-menu']:openMenu({
        {id = 1, header = "Prescription Notepad", icon = 'prescription_pad', isMenuHeader = true},
        {id = 2, header = "Write Vicoden Prescription", icon = "vicodin_prescription", params = {event = "c_Rx:client:writeprescription1"}},
        {id = 3, header = "Write Adderal Prescription", icon = "adderal_prescription", params = {event = "c_Rx:client:writeprescription2"}},
        {id = 4, header = "Write Morphine Prescription", icon = "morphine_prescription", params = {event = "c_Rx:client:writeprescription3"}},
        {id = 5, header = "Write Xanax Prescription", icon = "xanax_prescription", params = {event = "c_Rx:client:writeprescription4"}},
    })
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("pbfaxpills", Config.PharmacyPickup, 0.6, 0.25, {
        name = "pbfaxpills",
        heading = 249,
        debug = Config.Debug,
        minZ = Config.PharmacyPickup - 1,
        maxZ = Config.PharmacyPickup + 1,
    }, {
        options = {
            {
                type = "client",
                event = "c_Rx:pharmy:scriptfill",
                icon = "fas fa-first-aid",
                label = "Fax A Prescription",
            },
        },
        distance = 0.5
    })
end)
