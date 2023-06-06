Config = Config or {} 
Config.Debug = false
-- Everything Below is set up for gabz pillbox by default
Config.EMSJob = 'ambulance' -- some people change their job name but this is QBCore default...

--######## WHEELCHAIR ########--
Config.WheelchairSpawn = vector4(312.25,-592.66,43.28,339.33)
Config.RentTarget = vector3(312.13, -593.48, 43.28) 
Config.FuelType = 'LegacyFuel' -- your fuel script name // see the read me


--######### PHARMACY ##########--
Config.PharmacyPickup = vector3(308.06, -602.71, 43.28) -- the faxing printer location
Config.FaxingTime = math.random(10,20) -- the amount of seconds you want it to take to fax/fill script
Config.BottleTime = math.random(3,7)   -- amount of seconds you want bottle to take before they are opened
Config.ScriptTime = math.random(4,8)   -- amount of time you want it to take for the doctor to write the script

--____________________________________________--
--### THE AMOUNT YOU WANT A BOTTLE TO GIVE ###--
Config.VicodinGiven = math.random(2,6)
Config.AdderalGiven = math.random(2,6)
Config.MorphineGiven = math.random(2,6)
Config.XanaxGiven = math.random(2,6) 
