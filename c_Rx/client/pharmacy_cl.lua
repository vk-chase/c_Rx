local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
exports['qb-target']:AddBoxZone("pbfaxpills",Config.PharmacyPickup,0.6, 0.25, {
       name = "pbfaxpills",
       heading = 249,
       debug = Config.Debug,
       minZ = Config.PharmacyPickup-1,
       maxZ = Config.PharmacyPickup+1,
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

   
RegisterNetEvent("c_Rx:client:fillprescription1")
AddEventHandler("c_Rx:client:fillprescription1", function() 
    local HasItem1 = QBCore.Functions.HasItem('vicodin_prescription')
    if not HasItem1 then
        QBCore.Functions.Notify("Missing Vicodin Perscription Form..", "error")
        return
    else
        TriggerEvent('animations:client:EmoteCommandStart', { "type" })
        QBCore.Functions.Progressbar("drink_something", "Faxing Vicodin Paperwork..", Config.FaxingTime*1000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()-- Done
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "heartmonbeat", 0.5)
            Wait(1000)
            TriggerServerEvent("c_Rx:server:fillprescription")
            TriggerEvent('animations:client:EmoteCommandStart', { "c" })
        end)
    end
end)

RegisterNetEvent("c_Rx:client:fillprescription2")
AddEventHandler("c_Rx:client:fillprescription2", function() 
    local HasItem1 = QBCore.Functions.HasItem('adderal_prescription')
    if not HasItem1 then
        QBCore.Functions.Notify("Missing Adderal Perscription Form..", "error")
        return
    else
        TriggerEvent('animations:client:EmoteCommandStart', { "type2" })
        QBCore.Functions.Progressbar("drink_something", "Faxing Adderal Paperwork..", Config.FaxingTime*1000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()-- Done
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "heartmonbeat", 0.5)
            Wait(1000)
            TriggerServerEvent("c_Rx:server:fillprescription")
            TriggerEvent('animations:client:EmoteCommandStart', { "c" })
        end)
    end
end)

RegisterNetEvent("c_Rx:client:fillprescription3")
AddEventHandler("c_Rx:client:fillprescription3", function() 
    local HasItem1 = QBCore.Functions.HasItem('morphine_prescription')
    if not HasItem1 then
        QBCore.Functions.Notify("Missing Morphine Perscription Form..", "error")
        return
    else
        TriggerEvent('animations:client:EmoteCommandStart', { "type3" })
        QBCore.Functions.Progressbar("drink_something", "Faxing Morphine Paperwork..", Config.FaxingTime*1000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()-- Done
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "heartmonbeat", 0.5)
            Wait(1000)
            TriggerServerEvent("c_Rx:server:fillprescription")
            TriggerEvent('animations:client:EmoteCommandStart', { "c" })
        end)
    end
end)

RegisterNetEvent("c_Rx:client:fillprescription4")
AddEventHandler("c_Rx:client:fillprescription4", function() 
    local HasItem1 = QBCore.Functions.HasItem('xanax_prescription')
    if not HasItem1 then
        QBCore.Functions.Notify("Missing Xanax Perscription Form..", "error")
        return
    else
        TriggerEvent('animations:client:EmoteCommandStart', { "type4" })
        QBCore.Functions.Progressbar("drink_something", "Faxing Xanax Paperwork..", Config.FaxingTime*1000, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true,
            disableInventory = true,
        }, {}, {}, {}, function()-- Done
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "heartmonbeat", 0.5)
            Wait(1000)
            TriggerServerEvent("c_Rx:server:fillprescription")
            TriggerEvent('animations:client:EmoteCommandStart', { "c" })
        end)
    end
end)

RegisterNetEvent("c_Rx:client:openingvicodin")
AddEventHandler("c_Rx:client:openingvicodin", function() 
    TriggerEvent('animations:client:EmoteCommandStart', { "uncuff" })
    local pillbottle = CreateObject(2021859795, 0, 0, 0, true, true, true) 
    AttachEntityToEntity(pillbottle, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, 90.0, 125.0, 210.0, true, true, false, true, 1, true)
    QBCore.Functions.Progressbar("drink_something", "Opening Bottle", Config.BottleTime*1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
        TriggerServerEvent('c_Rx:server:getvicodinpills')
        DeleteEntity(pillbottle)
		TriggerEvent('animations:client:EmoteCommandStart', { "c" })
    end)
end)

RegisterNetEvent("c_Rx:client:openingadderal")
AddEventHandler("c_Rx:client:openingadderal", function() 
    TriggerEvent('animations:client:EmoteCommandStart', { "uncuff" })
    local pillbottle = CreateObject(2021859795, 0, 0, 0, true, true, true) 
    AttachEntityToEntity(pillbottle, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, 90.0, 125.0, 210.0, true, true, false, true, 1, true)
    QBCore.Functions.Progressbar("drink_something", "Opening Bottle", Config.BottleTime*1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
        TriggerServerEvent('c_Rx:server:getadderalpills')
        DeleteEntity(pillbottle)
        TriggerEvent('animations:client:EmoteCommandStart', { "c" })
    end)
end)

RegisterNetEvent("c_Rx:client:openingmorphine")
AddEventHandler("c_Rx:client:openingmorphine", function() 
    TriggerEvent('animations:client:EmoteCommandStart', { "uncuff" })
    local pillbottle = CreateObject(2021859795, 0, 0, 0, true, true, true) 
    AttachEntityToEntity(pillbottle, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, 90.0, 125.0, 210.0, true, true, false, true, 1, true)
    QBCore.Functions.Progressbar("drink_something", "Opening Bottle", Config.BottleTime*1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
        TriggerServerEvent('c_Rx:server:getmorphinepills')
        DeleteEntity(pillbottle)
        TriggerEvent('animations:client:EmoteCommandStart', { "c" })
    end)
end)



RegisterNetEvent("c_Rx:client:openingxanax")
AddEventHandler("c_Rx:client:openingxanax", function() 
    TriggerEvent('animations:client:EmoteCommandStart', { "uncuff" })
    local pillbottle = CreateObject(2021859795, 0, 0, 0, true, true, true) 
    AttachEntityToEntity(pillbottle, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, 90.0, 125.0, 210.0, true, true, false, true, 1, true)
    QBCore.Functions.Progressbar("drink_something", "Opening Bottle", Config.BottleTime*1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
        disableInventory = true,
    }, {}, {}, {}, function()-- Done
        TriggerEvent('animations:client:EmoteCommandStart', { "c" })
        DeleteEntity(pillbottle)
        TriggerServerEvent('c_Rx:server:getxanaxpills')
    end)
end)


RegisterNetEvent("c_Rx:client:writeprescription1")
AddEventHandler("c_Rx:client:writeprescription1", function()
    local HasItem1 = QBCore.Functions.HasItem('c_prescriptionform')
    local HasItem2 = QBCore.Functions.HasItem('c_rxpen')
    if not HasItem1 then
        QBCore.Functions.Notify("Missing a Rx Form...", "error")
        return
    else
        if not HasItem2 then
            QBCore.Functions.Notify("Missing a Office Pen...", "error")
            return
        else
            TriggerEvent('animations:client:EmoteCommandStart', { "notepad" })
            QBCore.Functions.Progressbar("drink_something", "Writing Vicodin Prescription..", Config.ScriptTime*1000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function()-- Done
                TriggerEvent('animations:client:EmoteCommandStart', { "c" })
                TriggerServerEvent('c_Rx:server:getvicodinform')
            end)
        end
    end
end)

RegisterNetEvent("c_Rx:client:writeprescription2")
AddEventHandler("c_Rx:client:writeprescription2", function() 
    local HasItem1 = QBCore.Functions.HasItem('c_prescriptionform')
    local HasItem2 = QBCore.Functions.HasItem('c_rxpen')
    if not HasItem1 then
        QBCore.Functions.Notify("Missing a Rx Form...", "error")
        return
    else
        if not HasItem2 then
            QBCore.Functions.Notify("Missing a Office Pen...", "error")
            return
        else
            TriggerEvent('animations:client:EmoteCommandStart', { "notepad" })
            QBCore.Functions.Progressbar("drink_something", "Writing Adderal Prescription..", Config.ScriptTime*1000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function()-- Done
                TriggerEvent('animations:client:EmoteCommandStart', { "c" })
                TriggerServerEvent('c_Rx:server:getadderalform')
            end)
        end
    end
end)

RegisterNetEvent("c_Rx:client:writeprescription3")
AddEventHandler("c_Rx:client:writeprescription3", function() 
    local HasItem1 = QBCore.Functions.HasItem('c_prescriptionform')
    local HasItem2 = QBCore.Functions.HasItem('c_rxpen')
    if not HasItem1 then
        QBCore.Functions.Notify("Missing a Rx Form...", "error")
        return
    else
        if not HasItem2 then
            QBCore.Functions.Notify("Missing a Office Pen...", "error")
            return
        else
            TriggerEvent('animations:client:EmoteCommandStart', { "notepad" })
            QBCore.Functions.Progressbar("drink_something", "Writing Morphine Prescription..", Config.ScriptTime*1000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function()-- Done
                TriggerEvent('animations:client:EmoteCommandStart', { "c" })
                TriggerServerEvent('c_Rx:server:getmorphineform')
            end)
        end
    end
end)

RegisterNetEvent("c_Rx:client:writeprescription4")
AddEventHandler("c_Rx:client:writeprescription4", function() 
    local HasItem1 = QBCore.Functions.HasItem('c_prescriptionform')
    local HasItem2 = QBCore.Functions.HasItem('c_rxpen')
    if not HasItem1 then
        QBCore.Functions.Notify("Missing a Rx Form...", "error")
        return
    else
        if not HasItem2 then
            QBCore.Functions.Notify("Missing a Office Pen...", "error")
            return
        else
            TriggerEvent('animations:client:EmoteCommandStart', { "notepad" })
            QBCore.Functions.Progressbar("drink_something", "Writing Xanax Prescription..", Config.ScriptTime*1000, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                disableInventory = true,
            }, {}, {}, {}, function()-- Done
                TriggerEvent('animations:client:EmoteCommandStart', { "c" })
                TriggerServerEvent('c_Rx:server:getxanaxform')
            end)
        end
    end
end)

RegisterNetEvent('c_Rx:pharmy:scriptfill', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Fax Machine",
            icon = 'vicodin_prescription',
            isMenuHeader = true,
        },
        {
            id = 2,
            header = "Fill Vicoden Prescription",
            icon = "vicodinbottle",
            params = {
                event = "c_Rx:client:fillprescription1",
            }
        },
        {
            id = 3,
            header = "Fill Adderal Prescription",
            icon = "adderalbottle",
            params = {
                event = "c_Rx:client:fillprescription2",
            }
        },
        {
            id = 4,
            header = "Fill Morphine Prescription",
            icon = "morphinebottle",
            params = {
                event = "c_Rx:client:fillprescription3",
            }
        },
        {
            id = 5,
            header = "Fill Xanax Prescription",
            icon = "xanaxbottle",
            params = {
                event = "c_Rx:client:fillprescription4",
            }
        },
    })
end)

RegisterNetEvent('c_Rx:client:prescriptionwriteup', function()
    exports['qb-menu']:openMenu({
        {
            id = 1,
            header = "Prescription Notepad",
            icon = 'prescription_pad',
            isMenuHeader = true,
        },
        {
            id = 2,
            header = "Write Vicoden Prescription",
            icon = "vicodin_prescription",
            params = {
                event = "c_Rx:client:writeprescription1",
            }
        },
        {
            id = 3,
            header = "Write Adderal Prescription",
            icon = "adderal_prescription",
            params = {
                event = "c_Rx:client:writeprescription2",
            }
        },
        {
            id = 4,
            header = "Write Morphine Prescription",
            icon = "morphine_prescription",
            params = {
                event = "c_Rx:client:writeprescription3",
            }
        },
        {
            id = 5,
            header = "Write Xanax Prescription",
            icon = "xanax_prescription",
            params = {
                event = "c_Rx:client:writeprescription4",
            }
        },
    })
end)


