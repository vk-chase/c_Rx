### qb-vehiclekeys find and replace this 
required:
qb-core
qb-target
qb-menu
PolyZone



*** THIS IS ALL OPTIONAL BUT IF YOU FOLLOW THE BELOW, YOUR WHEELCHAIR WILL NOT CONSUME FUEL AND ALSO BE UN STEALABLE BY OTHER PLAYERS.


Config.ImmuneVehicles = {
    'stockade',
}

### with = 

Config.ImmuneVehicles = {
    'stockade','iak_wheelchair',
}


### next go to your FUEL script ie LegacyFuel / PS / CDN and find the part where you can add fuelless vehicles >> this is in cdn_fuel below for example:

Config.NoFuelUsage = { -- This is for you to put vehicles that you don't want to use fuel.
}

### and make it look something like this 

Config.NoFuelUsage = { -- This is for you to put vehicles that you don't want to use fuel.
"iak_wheelchair",
}

