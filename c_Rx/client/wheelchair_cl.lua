local QBCore = exports['qb-core']:GetCoreObject()
CreateThread(function()
    exports['qb-target']:AddBoxZone("c_rentwchair", Config.RentTarget,1.8, 1,  {
      name = "c_rentwchair",
      heading = 249,
      debugPoly = Config.Debug,
      minZ = Config.RentTarget-1,
      maxZ = Config.RentTarget+1,
    }, {
      options = {
        {
          type = "client",
          event = "c_Rx:client:menu",
          icon = 'fas fa-wheelchair',
          label = 'Medical Aid',
        },
      },
      distance = 2.5,
    })
end)

RegisterNetEvent('c_Rx:client:menu', function()
  exports['qb-menu']:openMenu({
      {
          id = 1,
          header = "REQUEST HOSPITAL EQUIPMENT",
          isMenuHeader = true,
      },
      {
        id = 2,
        header = "REQUEST WHEELCHAIR",
        params = {
            event = "c_Rx:client:RentIt",
            args = {
                vehicle = 'iak_wheelchair',
                
            }
        }
      },
      {
          id = 3,
          header = "RETURN WHEELCHAIR",
          params = {
              event = "c_Rx:client:RemoveWChair"
          }
      },
      {
          id = 6,
          header = "< Close Menu",
          params = {
              event = "qb-menu:closeMenu"
          }
      },
  })
end)

RegisterNetEvent('c_Rx:client:RemoveWChair')
AddEventHandler('c_Rx:client:RemoveWChair', function()
    QBCore.Functions.Notify('Wheelchair Returned!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    DeleteVehicle(car)
    DeleteEntity(car)
end)

RegisterNetEvent('c_Rx:client:RentIt')
AddEventHandler('c_Rx:client:RentIt', function(rental)
    local vehicle = rental.vehicle
    DoScreenFadeOut(1000)
    Wait(1500)
    local coords = Config.WheelchairSpawn
    QBCore.Functions.Notify('Return at counter when you no longer need the wheelchair.')
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetVehicleNumberPlateText(veh, "HOSP"..tostring(math.random(1000, 9999)))
        exports[Config.FuelType]:SetFuel(veh, 100.0) -- if you dont wanna exclude wheelchair in fuel usage
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, coords, true)    
    Citizen.Wait(300)
    DoScreenFadeIn(2500) 
end)