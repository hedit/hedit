--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/doClient.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating clientside functions
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

_outputChatBox = outputChatBox
function outputChatBox ( str, r, g, b )
    _outputChatBox ( str, r or 255, g or 255, b or 255, true )
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function round ( num )
    if type(num)=="number" then
        return tonumber ( string.format ( "%.3f", num ) ) end
    return num
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function updateHandlingData ( )
    local cVeh = getPedOccupiedVehicle ( localPlayer )
    if cVeh then
        if cVeh ~= pVeh then
            showData ( mProperty[1] )
            pVeh = cVeh
        else updateData ( cm ) end
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function handlingToString ( d )
    if type(d) == "table" then return round(d[1])..", "..round(d[2])..", "..round(d[3])
    elseif type(d) == "number" then return tostring ( round ( d ) )
    end
    return tostring(d)
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function stringToHandling ( property, str )
    if property == "centerOfMass" then
        local vX  = round ( tonumber ( gettok ( str, 1, 44 ) ) )
        local vY  = round ( tonumber ( gettok ( str, 2, 44 ) ) )
        local vZ  = round ( tonumber ( gettok ( str, 3, 44 ) ) )
              str = { vX, vY, vZ }
    elseif property == "ABS" then if str == "true" then str = true else str = false end
    elseif property == "driveType" then
        if     str == "F" then str = "fwd"
        elseif str == "R" then str = "rwd"
        elseif str == "4" then str = "awd"
        end
    elseif property == "engineType" then
        if     str == "E" then str = "electric"
        elseif str == "P" then str = "petrol"
        elseif str == "D" then str = "diesel"
        end
    else
        str = tonumber ( str )
    end
    return str
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function unpackHandling ( str )
    local tbl = {}
    local i = 1
    for w in string.gmatch ( str, "[^%s]+" ) do
        if i==1 and not tonumber(w) then
            tbl[2] = w
            i=i+2
        else
            tbl[i] = w
            i=i+1
        end
    end
    return tbl
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function packHandling ( veh )
    local hnd = getVehicleHandling ( veh )
    local mdl = getElementModel ( veh )
    local tbl = { mdl }
    --------------------------------------------------------
    for i=2,#hProperty do
        if hnd[ hProperty[i] ] then
            if type ( hnd[ hProperty[i] ] ) == "table" then
                tbl[i]   = hnd[ hProperty[i] ][1]
                tbl[i+1] = hnd[ hProperty[i] ][2]
                tbl[i+2] = hnd[ hProperty[i] ][3]
                i=i+3
            else
                tbl[i] = hnd[ hProperty[i] ]
            end
        else tbl[i] = 0
        end
    end
    --------------------------------------------------------
    return table.concat ( tbl, " " )
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function loadVariables ( )
    for k,v in pairs ( getElementData ( resourceRoot, "hedit.settings" ) ) do
        setting[k] = v
    end
    ----------------------------------------------------------------------------------------------------------------------
    local limitsXML = xmlLoadFile ( "config/limits.xml" )
    for i,v in ipairs ( xmlNodeGetChildren ( limitsXML ) ) do
        local p = xmlNodeGetName ( v )
        minLimit[p] = xmlNodeGetAttribute ( v, "minLimit" )
        maxLimit[p] = xmlNodeGetAttribute ( v, "maxLimit" )
    end
    ----------------------------------------------------------------------------------------------------------------------
    defaultHandling = {}
    if getElementData ( resourceRoot, "usingCustoms" ) then
        local node = xmlLoadFile ( "config/defaults.xml" )
        for _,uNode in ipairs ( xmlNodeGetChildren ( node ) ) do
            local model   = xmlNodeGetAttribute ( uNode, "model" )
            local modelID = tonumber( model )
            if modelID then
                defaultHandling[model] = {}
                for p,v in pairs ( xmlNodeGetAttributes ( uNode ) ) do
                    if k ~= "model" then
                        defaultHandling[model][p] = stringToHandling ( p, v )
                    end
                end
            end
        end
    end
    for i=400,611 do
        if not defaultHandling[i] then
            defaultHandling[i] = {}
            for p,v in pairs ( getOriginalHandling ( i ) ) do
                defaultHandling[i][p] = v
            end
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function stopResource() triggerServerEvent("stopTheResource",resourceRoot) end