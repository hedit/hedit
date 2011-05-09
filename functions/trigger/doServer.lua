--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			functions/trigger/doServer.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Creating serverside functions
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
-- BY NEONBLACK [http://wiki.multitheftauto.com/wiki/CallServerFunction]
addEvent("onClientCallsServerFunction",true)
addEventHandler("onClientCallsServerFunction",resourceRoot,
function (funcname, ...)
	local arg = { ... }
	if (arg[1]) then for key, value in next, arg do arg[key] = tonumber(value) or value end end
	loadstring("return "..funcname)()(unpack(arg))
end)

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

addEvent ( "stopTheResource", true )
addEventHandler ( "stopTheResource", root, function ( ) stopResource ( getThisResource ( ) ) end )

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addEvent ( "setHandling", true )
addEventHandler ( "setHandling", root,
	function ( veh, handling, data, bool, dname, log )
		local d = round(data)
		if type(d) == "table" then d = round(data[1])..", "..round(data[2])..", "..round(data[3])
		else local d = round(data) end
		------------------------------------------------------------------
		if setTheHandling ( bool, veh, handling, data ) then
			str = string.format ( log.succes, dname, tostring(d) )
			lvl = 0
		else
			str = string.format ( log.unable, dname, tostring(d) )
			lvl = 2
		end
		------------------------------------------------------------------
		triggerClientEvent ( source, "outputLog", source, str, lvl )
	end
)

function setTheHandling ( bool, veh, handling, data )
	if bool == false then return setModelHandling ( getElementModel ( veh ), handling, data )
	else return setVehicleHandling ( veh, handling, data ) end
end
function round(num) if type(num)=="number" then return tonumber ( string.format ( "%.3f", num ) ) else return num end end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function importHandling ( player, cmd, str )
	local veh = getPedOccupiedVehicle ( player )
	--local str = "50400 	100000 	2 	0 	0.5 	-1.7 	70 	7 	7 	0.1 	5 	500 	100 	10 	4 	P 	80 	0.8 	0 	34 	1.28 	0.18 	5 	1.4 	-1.4 	0.5 	0.35 	0.15 	0.0 	45000 	2004 	C00000 	1 	1 "
	local tbl = {}
	local i = 1
	for w in string.gmatch (str, "[^%s]+") do
		tbl[i] = w
		i=i+1
	end
	for k,v in ipairs ( tbl ) do
	end
	setVehicleHandling ( veh, "mass",							tonumber(tbl[1]) )
	setVehicleHandling ( veh, "turnMass",						tonumber(tbl[2]) )
	setVehicleHandling ( veh, "dragCoeff",						tonumber(tbl[3]) )
	setVehicleHandling ( veh, "centerOfMass",					tonumber(tbl[4]), tonumber(tbl[5]), tonumber(tbl[6]) )
	setVehicleHandling ( veh, "percentSubmerged",				tonumber(tbl[7]) )
	setVehicleHandling ( veh, "tractionMultiplier",				tonumber(tbl[8]) )
	setVehicleHandling ( veh, "tractionLoss",					tonumber(tbl[9]) )
	setVehicleHandling ( veh, "tractionBias",					tonumber(tbl[10]) )
	setVehicleHandling ( veh, "numberOfGears",					tonumber(tbl[11]) )
	setVehicleHandling ( veh, "maxVelocity",					tonumber(tbl[12]) )
	setVehicleHandling ( veh, "engineAcceleration",				tonumber(tbl[13]) )
	setVehicleHandling ( veh, "engineInertia",					tonumber(tbl[14]) )
	--setVehicleHandling ( veh, "driveType",						tbl[15] )
	--setVehicleHandling ( veh, "engineType",						tbl[16] )
	setVehicleHandling ( veh, "brakeDeceleration",				tonumber(tbl[17]) )
	setVehicleHandling ( veh, "brakeBias",						tonumber(tbl[18]) )
	--setVehicleHandling ( veh, "ABS",							tbl[19] )
	setVehicleHandling ( veh, "steeringLock",					tonumber(tbl[20]) )
	setVehicleHandling ( veh, "suspensionForceLevel",			tonumber(tbl[21]) )
	setVehicleHandling ( veh, "suspensionDamping",				tonumber(tbl[22]) )
	setVehicleHandling ( veh, "suspensionHighSpeedDamping",		tonumber(tbl[23]) )
	setVehicleHandling ( veh, "suspensionUpperLimit",			tonumber(tbl[24]) )
	setVehicleHandling ( veh, "suspensionLowerLimit",			tonumber(tbl[25]) )
	setVehicleHandling ( veh, "suspensionBias",					tonumber(tbl[26]) )
	setVehicleHandling ( veh, "suspensionAntiDiveMultiplier",	tonumber(tbl[27]) )
	setVehicleHandling ( veh, "seatOffsetDistance",				tonumber(tbl[28]) )
	setVehicleHandling ( veh, "collisionDamageMultiplier",		tonumber(tbl[29]) )
end
addCommandHandler ( "import", importHandling )