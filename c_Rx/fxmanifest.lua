fx_version 'cerulean'
game 'gta5'
lua54 'yes'
this_is_a_map 'yes'

author 'vk-chase'
version '1.1'
description 'Prescription Drug System'

shared_script 'config.lua'

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

files {
    'data/vehicles.meta',
    'data/carvariations.meta',
    'data/handling.meta'
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'

-- thank iak for the wheelchair, its not mine. provided to save you the DL and install time, go follow him on github.
