local QBCore = exports['qb-core']:GetCoreObject()

local spawnedPeds = {}
local PlayerJob = {}
local hasChairout = false

local function deleteSpawnedPeds()
    for _, ped in ipairs(spawnedPeds) do
        if DoesEntityExist(ped) then
            DeleteEntity(ped)
        end
    end
    spawnedPeds = {}
end

local function spawnPed(pedData)
    RequestModel(pedData.model)
    while not HasModelLoaded(pedData.model) do
        Wait(0)
    end

    local ped = CreatePed(0, pedData.model, pedData.coords.x, pedData.coords.y, pedData.coords.z - 1.0, pedData.coords.a, false, false)
    SetEntityInvincible(ped, pedData.invincible)
    FreezeEntityPosition(ped, pedData.freeze)
    TaskStartScenarioInPlace(ped, pedData.scenario, -1, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityNoCollisionEntity(ped, PlayerPedId(), false)

    exports['qb-target']:AddCircleZone(pedData.name, vector3(pedData.coords.x, pedData.coords.y, pedData.coords.z), 2.0, {
        name = pedData.name,
        debugPoly = false,
        useZ = true,
    }, {
        options = pedData.target.options,
        distance = pedData.target.distance,
    })

    table.insert(spawnedPeds, ped)
end

local function updatePlayerJob()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
    end)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', updatePlayerJob)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    updatePlayerJob()
end)

CreateThread(function()
    deleteSpawnedPeds()

    local ped1Data = {
        name = 'emsarmory1',
        model = 's_m_m_doctor_01',
        coords = Config.RentTarget,
        freeze = true,
        invincible = true,
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        target = {
            options = {
                {
                    type = "client",
                    event = "c_Rx:client:menu",
                    icon = 'fas fa-wheelchair',
                    label = 'Medical Aid',
                },
            },
            distance = 3,
        },
    }
    spawnPed(ped1Data)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    deleteSpawnedPeds()
end)

local function openMenu(menuItems)
    exports['qb-menu']:openMenu(menuItems)
end

RegisterNetEvent('c_Rx:client:menu', function()
    local menuItems = {
        {
            id = 1,
            header = hasChairout and "RETURN HOSPITAL EQUIPMENT" or "REQUEST HOSPITAL EQUIPMENT",
            isMenuHeader = true,
        },
        {
            id = 2,
            header = hasChairout and "RETURN WHEELCHAIR" or "REQUEST WHEELCHAIR",
            params = {
                event = hasChairout and "c_Rx:client:RemoveWChair" or "c_Rx:client:RentIt",
                args = hasChairout and {} or { vehicle = 'iak_wheelchair' }
            }
        },
        {
            id = 3,
            header = "< Close Menu",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    }
    openMenu(menuItems)
end)

RegisterNetEvent('c_Rx:client:RemoveWChair', function()
    QBCore.Functions.Notify('Wheelchair Returned!')
    local car = GetVehiclePedIsIn(PlayerPedId(), true)
    DeleteVehicle(car)
    DeleteEntity(car)
    hasChairout = false
end)

RegisterNetEvent('c_Rx:client:RentIt', function(rental)
    local vehicle = rental.vehicle
    DoScreenFadeOut(1000)
    Wait(1500)
    local coords = Config.WheelchairSpawn
    QBCore.Functions.Notify('Return at counter when you no longer need the wheelchair.')
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "HOSP"..tostring(math.random(1000, 9999)))
        exports[Config.FuelType]:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)    
    Wait(300)
    hasChairout = true
    DoScreenFadeIn(2500) 
end)
