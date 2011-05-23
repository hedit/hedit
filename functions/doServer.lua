--|| ***************************************************************************************************************** [[--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/doServer.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating serverside functions
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

updateForAll = false
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
logFile  = nil
xmlNode  = nil
xmlTable = {}
--------------------------------------------------------------------------------------------------------------------------
addEvent ( "saveTheHandling", true )
addEvent ( "loadTheHandling", true )
addEvent ( "setHandling",     true )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "onResourceStart", resourceRoot,
    function ( )
        local exists   = fileExists ( "heditLog.txt" )
        if not exists then logFile = fileCreate ( "heditLog.txt" )
        else logFile = fileOpen ( "heditLog.txt" ) end
        ------------------------------------------------------------------------------------------------------------------
        local saveRes = getResourceFromName ( "hedit_saves" )
        if not saveRes then
            saveRes = createResource ( "hedit_saves" )
            if saveRes then addResourceConfig ( ":hedit_saves/saves.xml", "client" ) end
        end
        ------------------------------------------------------------------------------------------------------------------
        startResource ( saveRes )
        xmlNode = xmlLoadFile ( ":hedit_saves/saves.xml" )
        if not xmlNode then xmlNode = addResourceConfig ( ":hedit_saves/saves.xml", "client" ) end
        
        for uIndex,uNode in ipairs ( xmlNodeGetChildren ( xmlNode ) ) do
            local aName       = xmlNodeGetAttribute ( uNode, "account" )
            xmlTable[aName]   = {}
            xmlTable[aName].u = uNode
            for sIndex, sNode in ipairs ( xmlNodeGetChildren ( uNode ) ) do
                local sName = string.lower ( xmlNodeGetAttribute ( sNode, "name" ) )
                local hConf = xmlFindChild ( sNode, "handling", 0 )
                xmlTable[aName][sName]   = {}
                xmlTable[aName][sName].h = {}
                xmlTable[aName][sName].s = sNode
                xmlTable[aName][sName].i = hConf
                for k,v in pairs ( xmlNodeGetAttributes ( hConf ) ) do
                    xmlTable[aName][sName].h[k] = v
                end
            end
        end
    end
)
--------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "onResourceStop", resourceRoot, function ( )       fileClose ( logFile ); xmlUnloadFile ( xmlNode )              end )
addEventHandler ( "onPlayerJoin",   root,         function ( )       setElementData ( source, "hAccount", "guest" )                end )
addEventHandler ( "onPlayerLogin",  root,         function ( _,acc ) setElementData ( source, "hAccount", getAccountName ( acc ) ) end )
addEventHandler ( "onPlayerLogout", root,         function ( )       setElementData ( source, "hAccount", "guest" )                end )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function saveHandling ( veh, aName, sName, log )
    if not xmlTable[aName] then
        xmlTable[aName] = {}
        xmlTable[aName].u = xmlCreateChild ( xmlNode, "user" )
        xmlNodeSetAttribute ( xmlTable[aName].u, "account", aName )
        xmlNodeSetAttribute ( xmlTable[aName].u, "name",    pName )
    end
    ----------------------------------------------------------------------------------------------------------------------
    if not xmlTable[aName][sName] then
        xmlTable[aName][sName]   = {}
        xmlTable[aName][sName].h = {}
        xmlTable[aName][sName].s = xmlCreateChild ( xmlTable[aName].u,        "save"     )
        xmlTable[aName][sName].i = xmlCreateChild ( xmlTable[aName][sName].s, "handling" )
        xmlNodeSetAttribute ( xmlTable[aName][sName].s, "name", sName )
    end
    ----------------------------------------------------------------------------------------------------------------------
    xmlNodeSetAttribute ( xmlTable[aName][sName].i, "model", getElementModel ( veh ) )
    for k,v in pairs ( getVehicleHandling ( veh ) ) do
        local str = handlingToString ( v )
        xmlNodeSetAttribute ( xmlTable[aName][sName].i, k, str )
        xmlTable[aName][sName].h[k] = str
    end
    ----------------------------------------------------------------------------------------------------------------------
    xmlSaveFile        ( xmlNode )
    triggerClientEvent ( source, "outputLog", source, log.saved, 0 )
    restartResource    ( getResourceFromName ( "hedit_saves" ) )
end
addEventHandler ( "saveTheHandling", root, saveHandling )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function loadHandling ( veh, aName, sName, log )
    if xmlNode and xmlTable[aName][sName] then
        for k,v in pairs ( xmlTable[aName][sName].h ) do
            if k ~= "model" then
                setVehicleHandling ( veh, k, stringToHandling ( k, v ) )
            end
        end
        triggerClientEvent ( source, "outputLog", source, log.loaded, 0 )
    end
end
addEventHandler ( "loadTheHandling", root, loadHandling )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addEvent ( "stopTheResource", true )
addEventHandler ( "stopTheResource", root, function ( ) stopResource ( getThisResource ( ) ) end )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "setHandling", root,
    function ( veh, handling, data, bool, dname, log )
        local d = handlingToString ( data )
        ------------------------------------------------------------------------------------------------------------------
        local pName    = getPlayerName ( source )
        local vName    = getVehicleName ( veh )
        local vModel   = getElementModel ( veh )
        local hCurrent = getVehicleHandling ( veh )[handling]
        local time     = getRealTime ( )
        local tStamp   = string.format ( "[%02d:%02d:%02d]", time.hour, time.minute, time.second )
        if logFile then
            local size = fileGetSize ( logFile )
            fileSetPos ( logFile, size )
            if type ( hCurrent ) == "table" then hCurrent = tostring(round(hCurrent[1])..", "..round(hCurrent[2])..", "..round(hCurrent[3])) end
            fileWrite ( logFile, tStamp.." "..pName.." changed his "..vName.."("..vModel..")".." "..handling.." from "..hCurrent.." to "..d.."\r\n" )
            fileFlush ( logFile )
        end
        ------------------------------------------------------------------------------------------------------------------
        if setTheHandling ( bool, veh, handling, data ) then
            str = string.format ( log.succes, dname, d )
            lvl = 0
        else
            str = string.format ( log.unable, dname, d )
            lvl = 2
        end
        ------------------------------------------------------------------------------------------------------------------
        triggerClientEvent ( source, "outputLog", source, str, lvl )
    end
)
--------------------------------------------------------------------------------------------------------------------------
function setTheHandling ( bool, veh, handling, data )
    if bool == false then return setModelHandling ( getElementModel ( veh ), handling, data )
    else return setVehicleHandling ( veh, handling, data ) end
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function round(num) if type(num)=="number" then return tonumber ( string.format ( "%.3f", num ) ) else return num end end
--------------------------------------------------------------------------------------------------------------------------
function handlingToString ( d )
    if type(d) == "table" then return tostring(round(d[1])..", "..round(d[2])..", "..round(d[3]))
    else return tostring ( round ( d ) ) end
end
--------------------------------------------------------------------------------------------------------------------------
function stringToHandling ( property, str )
    local handling = tonumber ( str )
    if not handling then
        if property == "centerOfMass" then
            local vX  = round ( tonumber ( gettok ( str, 1, 44 ) ) )
            local vY  = round ( tonumber ( gettok ( str, 2, 44 ) ) )
            local vZ  = round ( tonumber ( gettok ( str, 3, 44 ) ) )
                  str = { vX, vY, vZ }
        elseif property == "ABS" then if str == "true" then str = true else str = false end
        end
    else str = handling end
    return str
end