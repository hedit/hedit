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
        if type(d) == "table" then d = table.concat ( d, "," )
        else local d = tostring(round(data)) end
        ------------------------------------------------------------------
        local pName    = getPlayerName ( source )
        local vName    = getVehicleName ( veh )
        local vModel   = getElementModel ( veh )
        local hCurrent = getVehicleHandling ( veh )[handling]
        local time     = getRealTime ( )
        local tStamp   = string.format ( "%02d/%02d/%02d", time.hour, time.minute, time.second )
        local exists   = fileExists ( "heditLog.txt" )
        local logFile  = nil
        if not exists then logFile = fileCreate ( "heditLog.txt" )
        else logFile = fileOpen ( "heditLog.txt" ) end
        if logFile then
            local size = fileGetSize ( logFile )
            fileSetPos ( logFile, size )
            if type(hCurrent) == "table" then hCurrent = table.concat ( hCurrent, "," ) end
            fileWrite ( logFile, tStamp.." "..pName.." changed his "..vName.."("..vModel..")".." "..handling.." from "..hCurrent.." to "..d.."\n" )
            fileFlush ( logFile )
            fileClose ( logFile )
        end
        ------------------------------------------------------------------
        if setTheHandling ( bool, veh, handling, data ) then
            str = string.format ( log.succes, dname, d )
            lvl = 0
        else
            str = string.format ( log.unable, dname, d )
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
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function saveHandling ( vehID, pName, str )
    -- Coming next weekend
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function loadHandling ( )
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function importHandling ( )
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function resetHandling ( )
end