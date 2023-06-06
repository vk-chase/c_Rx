this_is_a_map 'yes'
fx_version "cerulean"
game "gta5"
lua54 'yes'
server_scripts {'server/*.lua'}
shared_scripts {'config.lua'}

client_scripts {
'client/*.lua'
,'@PolyZone/client.lua'
,'@PolyZone/CircleZone.lua'
}

files {
	'data/vehicles.meta',
	'data/carvariations.meta',
	'data/handling.meta'
}

data_file 'HANDLING_FILE'			'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE'	'data/vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE'	'data/carvariations.meta'

--thank iak for the wheelchair, its not mine. provided to save you the DL and install time, go follow him on github.



