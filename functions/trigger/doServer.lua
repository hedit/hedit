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
	function ( veh, handling, data, bool, dname, txt, log )
		------------------------------------------------------------------
		if setTheHandling ( bool, veh, handling, data ) then
			str = string.format ( log.succes, dname, txt )
			lvl = 0
		else
			str = string.format ( log.unable, dname, txt )
			lvl = 2
		end
		------------------------------------------------------------------
		triggerClientEvent ( source, "outputLog", source, str, lvl, veh, handling )
	end
)

function setTheHandling ( bool, veh, handling, data )
	if type(data) == "table" then
		if bool == false then return setModelHandling ( getElementModel ( veh ), handling, data[1], data[2], data[3] )
		else return setVehicleHandling ( veh, handling, data[1], data[2], data[3] ) end
	else
		if bool == false then return setModelHandling ( getElementModel ( veh ), handling, data )
		else return setVehicleHandling ( veh, handling, data ) end
	end
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function importHandling ( player )
	local veh = getPedOccupiedVehicle ( player )
	local str = "50400 	100000 	2 	0 	0.5 	-1.7 	70 	7 	7 	0.1 	5 	500 	100 	10 	4 	P 	80 	0.8 	0 	34 	1.28 	0.18 	5 	1.4 	-1.4 	0.5 	0.35 	0.15 	0.0 	45000 	2004 	C00000 	1 	1 "
	local tbl = {}
	local i = 1
	for w in string.gmatch (str, "[^%s]+") do
		tbl[i] = w
		i=i+1
	end
	for k,v in ipairs ( tbl ) do
	end
	--setVehicleHandling ( veh, "mass", tonumber(tbl[1]) )
end
addCommandHandler ( "import", importHandling )