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
function callServer(funcname, ...)
	local arg = {...}
	if (arg[1]) then
		for key,value in next,arg do
			if (type(value)=="number") then arg[key] = tostring(value) end end end
	triggerServerEvent("onClientCallsServerFunction",resourceRoot,funcname,unpack(arg))
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function round(num, idp) 
  local mult = 10^(idp or 0)
  return math.floor(num*mult+0.5)/mult
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function stopResource()
	triggerServerEvent("stopTheResource",resourceRoot) end