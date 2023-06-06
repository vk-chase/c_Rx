# c_Rx
### Free Rx / Wheelchair script for QBCore servers



### REQUIRED:
__________
### qb-core

### progressbar

### qb-menu

### qb-target

### PolyZone

### jim-consumables or qb-smallresources, 

jim snippet provided no one uses smallresources for consumables.



### OPTIONAL qb-ambulancejob armory add these , change the slot number to your needed slot#

        [10] = {
            name = "prescription_pad",
            price = 200,
            amount = 1,
            info = {},
            type = "item",
            slot = 10,
        },
        [11] = {
            name = "c_prescriptionform",
            price = 5,
            amount = 5,
            info = {},
            type = "item",
            slot = 11,
        },
        [12] = {
            name = "c_rxpen",
            price = 2,
            amount = 1,
            info = {},
            type = "item",
            slot = 12,
        },



### qb-core/shared/items.lua

	
	['prescription_pad'] 		        	= {['name'] = 'prescription_pad', 			    ['label'] = 'Prescription Pad',            	['weight'] = 10,      ['type'] = 'item',       ['image'] = 'c_prescriptionpad.png',         	        ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
	['c_prescriptionform'] 		        	= {['name'] = 'c_prescriptionform', 			    ['label'] = 'Rx Form',            	['weight'] = 10,      ['type'] = 'item',       ['image'] = 'c_prescriptionform.png',         	        ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},
	['c_rxpen'] 		        	= {['name'] = 'c_rxpen', 			    ['label'] = 'Office Pen',            	['weight'] = 10,      ['type'] = 'item',       ['image'] = 'c_rxpen.png',         	        ['unique'] = true,     ['useable'] = true,     ['shouldClose'] = false,     ['combinable'] = nil,   ['description'] = ''},

	["vicodin_prescription"] 		 	 	 		 = {["name"] = "vicodin_prescription",           				["label"] = "Vicodin Prescription",	 			["weight"] = 250, 		["type"] = "item", 		["image"] = "c_vicodinprescription.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,     ["description"] = ""},
	["adderal_prescription"] 		 	 	 		 = {["name"] = "adderal_prescription",           				["label"] = "Adderal Prescription",	 			["weight"] = 250, 		["type"] = "item", 		["image"] = "c_adderalprescription.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,     ["description"] = ""},
	["morphine_prescription"] 		 	 	 		 = {["name"] = "morphine_prescription",           				["label"] = "Morphine Prescription",	 			["weight"] = 250, 		["type"] = "item", 		["image"] = "c_morphineprescription.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,     ["description"] = ""},
	["xanax_prescription"] 		 	 	 		 = {["name"] = "xanax_prescription",           				["label"] = "Xanax Prescription",	 			["weight"] = 250, 		["type"] = "item", 		["image"] = "c_xanaxprescription.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   ["combinable"] = nil,     ["description"] = ""},
	
	['adderal'] 			    	 = {['name'] = 'adderal', 			  			['label'] = 'Adderal', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'c_adderal.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil, 					 ['description'] = ''},
	['vicodin'] 			     	 = {['name'] = 'vicodin', 			  			['label'] = 'Vicodin', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'c_vicodin.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil, 					 ['description'] = ''},
	['morphine'] 			     	 = {['name'] = 'morphine', 			  			['label'] = 'Morphine', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'c_morphine.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil, 					 ['description'] = ''},
	['xanax'] 			     	 	 = {['name'] = 'xanax', 			  			['label'] = 'Xanax', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'c_xanax.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil, 					 ['description'] = ''},
	
	['adderalbottle'] 			     = {['name'] = 'adderalbottle', 			  			['label'] = 'Adderal Bottle', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'c_pillbottle.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil, 					 ['description'] = ''},
	['vicodinbottle'] 			     = {['name'] = 'vicodinbottle', 			  			['label'] = 'Vicodin Bottle', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'c_pillbottle.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil, 					 ['description'] = ''},
	['morphinebottle'] 			     = {['name'] = 'morphinebottle', 			  			['label'] = 'Morphine Bottle', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'c_pillbottle.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil, 					 ['description'] = ''},
	['xanaxbottle'] 			     = {['name'] = 'xanaxbottle', 			  			['label'] = 'Xanax Bottle', 					['weight'] = 100, 		['type'] = 'item', 		['image'] = 'c_pillbottle.png', 			['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil, 					 ['description'] = ''},



### JIM CONSUMABLES


	["xanax"] = { 				emote = "water",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 10, armor = 10, type = "drug", stats = { screen = "focus", effect = "stamina", widepupils = false, canOD = true } },
	["morphine"] = { 			emote = "water",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { screen = "focus", effect = "strength", widepupils = false, canOD = true } },
	["vicodin"] = { 			emote = "water",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { screen = "focus", effect = "heal", widepupils = false, canOD = true } },
	["adderal"] = { 			emote = "water",		time = math.random(5000, 6000), stress = math.random(12, 24), heal = 0, armor = 10, type = "drug", stats = { screen = "focus", effect = "stamina", widepupils = false, canOD = true } },


then add this to the emotes at the bottom of config in jim consumables 
### you must have RPEmotes, if not change water to drink above! otherwise the water emote will not display prop.

		    ["water"] = {
			"mp_player_intdrink",
			"loop_bottle",
			"Water Bottle",
			AnimationOptions =
			{
				Prop = "vw_prop_casino_water_bottle_01a",
				PropBone = 60309,
				PropPlacement = {0.0080,0.0,-0.0500,0.0,0.0,-40.0000},
				EmoteMoving = true,
				EmoteLoop = true
			}
		    },
        
        
        
        
        
        
        
        
        
        
### ON TO THE WHEELCHAIR README
        
 ### qb-vehiclekeys find and replace this 


### THIS IS ALL OPTIONAL BUT IF YOU FOLLOW THE BELOW, YOUR WHEELCHAIR WILL NOT CONSUME FUEL AND ALSO BE UN STEALABLE BY OTHER PLAYERS.


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










