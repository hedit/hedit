--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			config/text/english.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		English Language File
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

loadTranslation["english"] = function ( )
	text.header					= "Handling Editor "..HEDIT_VERSION.." - By Remi-X"
	text.logheader				= "Log"
	text.hr						= "____________________________________________________"
	text.reenter				= "Please re-enter your vehicle to get the handlingeditor working properly."
	text.incorrectTemplate		= "HANDLING EDITOR: Incorrect/corrupted template. Default template has been loaded."
	text.invalidTemplate		= "HANDLING EDITOR: No such template with that name. Default template has been loaded."
	text.noDefaultTemplate		= "HANDLING EDITOR: Default template has not been found or is incorrect. Please fix. HandlingEditor will not work now."
	-------------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	-------------------------------------------------------------------------------------------------------------------------
	utilText[1]					= "File"
	utilText[2]					= "View"
	utilText[3]					= "Options"
	-------------------------------------------------------------------------------------------------------------------------
	text.newHandling			= "New"
	text.openHandling			= "Open"
	text.importHandling			= "Import"
	text.exportHandling			= "Export"
	text.saveHandling			= "Save"
	text.saveHandlingAs			= "Save As"
	text.closeWindow			= "Close Window"
	-------------------------------------------------------------------------------------------------------------------------
	text.showTransmission		= "Transmission Menu"
	text.showSuspension			= "Suspension Menu"
	text.showOther				= "Other Menu"
	text.showTest				= "Dynamometer Menu"
	text.showHelp				= "Help Menu"
	text.showLog				= "Log"
	text.showDyno				= "Dynamometer Results"
	-------------------------------------------------------------------------------------------------------------------------
	text.pickLanguage			= "Language"
	text.pickTemplate			= "Template"
	-------------------------------------------------------------------------------------------------------------------------
	text.resetHeader			= "Reset Handling"
	text.resetLabel				= "Are you sure you want to reset your current handling? You might lose unsaved data."
	-------------------------------------------------------------------------------------------------------------------------
	text.openHeader				= "Open Handling"
	text.openLabel				= ""
	-------------------------------------------------------------------------------------------------------------------------
	text.saveHeader				= "Save Handling"
	text.saveLabel				= ""
	text.saveAsHeader			= "Save Handling To Resource"
	-------------------------------------------------------------------------------------------------------------------------
	text.importHeader			= "Import Handling"
	text.importLabel			= ""
	-------------------------------------------------------------------------------------------------------------------------
	text.exportHeader			= "Export Handling"
	text.exportLabel			= ""
	-------------------------------------------------------------------------------------------------------------------------
	text.accept					= "Accept"
	text.continue				= "Continue"
	text.open					= "Open"
	text.save					= "Save"
	text.import					= "Import"
	text.cancel					= "Cancel"
	-------------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	-------------------------------------------------------------------------------------------------------------------------
	log.same					= "The %s is already that!"
	log.succes					= "%s set to %s."
	log.unable					= "Unable to set the %s to %s!"
	log.invalid					= "Invalid %s!"
	log.needNumber				= "You need to use a number!"
	-------------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	-------------------------------------------------------------------------------------------------------------------------
	info["transmission"]		= {h={},l={}}
	info["suspension"]			= {h={},l={}}
	info["other"]				= {h={},l={}}
	-------------------------------------------------------------------------------------------------------------------------
	info[1]						= "Show transmission options"
	info[2]						= "Show mass&suspension options"
	info[3]						= "Show other options"
	info[4]						= "Test the current configuration"
	info[5]						= "Show help page"
	-------------------------------------------------------------------------------------------------------------------------
	info["transmission"].l[1]	= "Number of Gears\nSets the number of gears you want to have on your vehicle."
	info["transmission"].l[2]	= "Maximum Velocity\nSets the maximum speed of your vehicle in KM/H."
	info["transmission"].l[3]	= "Acceleration\nSets the acceleration in MS^2 of your vehicle."
	info["transmission"].l[4]	= "Inertia\nSmooths or sharpens the acceleration curve."
	info["transmission"].l[5]	= "Drive Type\nSets the type of driving for your vehicle."
	info["transmission"].l[6]	= "Engine Type\nSets the type of engine for your vehicle."
	info["transmission"].l[7]	= "Brake Deceleration\nSets your deceleration in MS^2."
	info["transmission"].l[8]	= "Brake Bias\nSets the main position of the brakes."
	info["transmission"].l[9]	= "Anti-Lock Braking\nEnable or disable ABS on your vehicle."
	info["transmission"].l[10]	= "Steering Lock\nSets the maximum angle your vehicle can steer."
	info["transmission"].l[11]	= "Traction Multiplier\nSets the amount of grip your vehicle will have while cornering."
	info["transmission"].l[12]	= "Traction Loss\nSets the amount of grip your vehicle will have when accelerating and decelerating."
	info["transmission"].l[13]	= "Traction Bias\nSets where all the grip of your wheels will go to."
	-------------------------------------------------------------------------------------------------------------------------
	info["suspension"].l[1]		= "Mass\nSets the weight of your vehicle in KG."
	info["suspension"].l[2]		= "Turn Mass\nUsed to calculate motion effects."
	info["suspension"].l[3]		= "Drag Multiplier\nChanges resistance to movement."
	info["suspension"].l[4]		= "Centre Of Mass\nSets the point where all the weight of your vehicle will go to in meters."
	info["suspension"].l[5]		= "Percent Submerged\nSets how deep your vehicle needs to be in the water before it will float in percent."
	info["suspension"].l[6]		= "Suspension Force Level\nExplanation Here"	-- *** ADD EXPLANATION ***
	info["suspension"].l[7]		= "Suspension Damping Level\nExplanation Here"	-- *** ADD EXPLANATION ***
	info["suspension"].l[8]		= "Suspension High Speed Com Damp\nSets the stiffer your suspension will be when driving faster."
	info["suspension"].l[9]		= "Suspension Lower Limit\nExplanation Here"	-- *** ADD EXPLANATION ***
	info["suspension"].l[10]	= "Suspension Upper Limit\nExplanation Here"	-- *** ADD EXPLANATION ***
	info["suspension"].l[11]	= "Suspension Anti-Dive Multiplier\nChanges the amount of body pitching under braking and acceleration."
	info["suspension"].l[12]	= "Suspension Bias\nSets where most of the suspension power will go to."
	-------------------------------------------------------------------------------------------------------------------------
	info["other"].l[1]			= "Seat Offset Distance\nSets how far the seat is from the door of your vehicle."
	info["other"].l[2]			= "Collision Damage Multiplier\nSets the damage your vehicle will get from collisions."
	info["other"].l[3]			= "Monetary Value\nSets the exact price of your vehicle."
	info["other"].l[4]			= "Front Lights\nSets the type of front lights your vehicle will have."
	info["other"].l[5]			= "Rear Lights\nSets the type of rear lights your vehicle will have."
	info["other"].l[6]			= "Vehicle Anim Group\nSets the group of animation your ped will use for it's vehicle."
	-------------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	-------------------------------------------------------------------------------------------------------------------------
	info["transmission"].h[1]	= "Integer: Use "..limit.minGears.." - "..limit.maxGears.."."
	info["transmission"].h[2]	= "Float: Use values starting from "..limit.minVelocity..".\nVelocity is in KM/H."
	info["transmission"].h[3]	= "Float: Use "..limit.minAcceleration.." - "..limit.maxAcceleration.."."
	info["transmission"].h[4]	= "Float: Use "..limit.minInertia.." - "..limit.maxInertia.."."
	info["transmission"].h[5]	= "fwd = Front Wheel Drive\nrwd = Rear Wheel Drive\nawd = All Wheel Drive"
	info["transmission"].h[6]	= "wtf"											-- *** CHECK THIS ***
	info["transmission"].h[7]	= "Float: Use "..limit.minBrakedecel.." - "..limit.maxBrakedecel.."."
	info["transmission"].h[8]	= "Float: Use "..limit.minBias.." - "..limit.maxBias.."\n"..limit.minBias.." means all the power goes to your rear wheels, "..limit.maxBias.." to your front wheels and "..limit.midBias.." will use them both equally."
	info["transmission"].h[9]	= "true = Enable ABS\nfalse = Disable ABS"
	info["transmission"].h[10]	= "Float: Use "..limit.minSteering.." - "..limit.maxSteering.."."
	info["transmission"].h[11]	= "Float: Use "..limit.minTractionmult.." - "..limit.maxTractionmult.."."
	info["transmission"].h[12]	= "Float: Use "..limit.minTractionloss.." - "..limit.maxTractionloss.."."
	info["transmission"].h[13]	= "Float: Use "..limit.minBias.." - "..limit.maxBias.."\n"..limit.minBias.." means that all the grip goes to your rear wheels, "..limit.maxBias.." to your front wheels and "..limit.midBias.." will use them equally."
	-------------------------------------------------------------------------------------------------------------------------
	info["suspension"].h[1]		= "still need to add syntax"
	info["suspension"].h[2]		= "still need to add syntax"
	info["suspension"].h[3]		= "still need to add syntax"
	info["suspension"].h[4]		= "still need to add syntax"
	info["suspension"].h[5]		= "still need to add syntax"
	info["suspension"].h[6]		= "still need to add syntax"
	info["suspension"].h[7]		= "still need to add syntax"
	info["suspension"].h[8]		= "still need to add syntax"
	info["suspension"].h[9]		= "still need to add syntax"
	info["suspension"].h[10]	= "still need to add syntax"
	info["suspension"].h[11]	= "still need to add syntax"
	info["suspension"].h[12]	= "still need to add syntax"
	-------------------------------------------------------------------------------------------------------------------------
	info["other"].h[1]			= "still need to add syntax"
	info["other"].h[2]			= "still need to add syntax"
	info["other"].h[3]			= "still need to add syntax"
	info["other"].h[4]			= "still need to add syntax"
	info["other"].h[5]			= "still need to add syntax"
	info["other"].h[6]			= "still need to add syntax"
	-------------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	-------------------------------------------------------------------------------------------------------------------------
	dyno.header					= "Results"
	dyno.topspeed				= "Top Speed:"
	dyno.accel					= "0 to 100 KMH:"
	dyno.zerototop				= "0 to Top Speed:"
	dyno.quartertime			= "Quarter KM time:"
	dyno.quarterspeed			= "Quarter KM speed:"
	-------------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	-------------------------------------------------------------------------------------------------------------------------
	hName["transmission"]		= {h={}}
	hName["suspension"]			= {h={}}
	hName["other"]				= {h={}}
	-------------------------------------------------------------------------------------------------------------------------
	hName["transmission"].h[1]	= "Number of Gears"
	hName["transmission"].h[2]	= "Maximum velocity"
	hName["transmission"].h[3]	= "Engine Acceleration"
	hName["transmission"].h[4]	= "Engine Inertia"
	hName["transmission"].h[5]	= "Drive Type"
	hName["transmission"].h[6]	= "Engine Type"
	hName["transmission"].h[7]	= "Brake Deceleration"
	hName["transmission"].h[8]	= "Brake Bias"
	hName["transmission"].h[9]	= "Anti-Lock Braking"
	hName["transmission"].h[10]	= "Steering Lock"
	hName["transmission"].h[11]	= "Traction Multiplier"
	hName["transmission"].h[12]	= "Traction Loss"
	hName["transmission"].h[13]	= "Traction Bias"
	-------------------------------------------------------------------------------------------------------------------------
	hName["suspension"].h[1]	= "Mass"
	hName["suspension"].h[2]	= "Turn Mass"
	hName["suspension"].h[3]	= "Drag Coefficient"
	hName["suspension"].h[4]	= "Center Of Mass"
	hName["suspension"].h[5]	= "Percent Submerged"
	hName["suspension"].h[6]	= "Force Level"
	hName["suspension"].h[7]	= "Damping Level"
	hName["suspension"].h[8]	= "High Speed Damping"
	hName["suspension"].h[9]	= "Lower Limit"
	hName["suspension"].h[10]	= "Upper Limit"
	hName["suspension"].h[11]	= "Anti-Dive Multiplier"
	hName["suspension"].h[12]	= "Suspension Bias"
	-------------------------------------------------------------------------------------------------------------------------
	hName["other"].h[1]			= "Seat Offset Distance"
	hName["other"].h[2]			= "Damage Multiplier"
	hName["other"].h[3]			= "Head lights"
	hName["other"].h[4]			= "Tail Lights"
	hName["other"].h[5]			= "Monetary Value"
	hName["other"].h[6]			= "Animation Group"
end