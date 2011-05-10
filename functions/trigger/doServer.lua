--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/trigger/doServer.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating serverside functions
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
    else return setVehicleHandling ( veh, handling, data ) end end
function round(num) if type(num)=="number" then return tonumber ( string.format ( "%.3f", num ) ) else return num end end