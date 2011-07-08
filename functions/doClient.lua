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

function table.size ( tab )
    local length = 0
    for _ in pairs ( tab ) do
        length = length + 1 end
    return length
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function round ( num )
    if type(num)=="number" then return tonumber ( string.format ( "%.3f", num ) ) end
    return num
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function toHex ( num )
    if type(num) ~= "number" then return false end
    local hexnums = {"0","1","2","3","4","5","6","7",
                     "8","9","A","B","C","D","E","F"}
    local hex,r = "",num%16
    if num-r == 0 then hex = hexnums[r+1]
    else hex = toHex((num-r)/16)..hexnums[r+1] end
    return hex
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function toValue ( hex )
    local tbl = { ["1"]={"1"},         ["2"]={"2"},         ["3"]={"1","2"},     ["4"]={"4"},     ["5"]={"1","4"},
                  ["6"]={"2","4"},     ["7"]={"1","2","4"}, ["8"]={"8"},         ["9"]={"1","8"}, ["A"]={"2","8"}, 
                  ["B"]={"1","2","8"}, ["C"]={"4","8"},     ["D"]={"1","4","8"}, ["E"]={"1","2","4","8"} }
    return tbl[hex]
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

function handlingToString ( p, h )
    if p == "centerOfMass" then return round(h[1])..", "..round(h[2])..", "..round(h[3])
    elseif isInt[p] then return string.format ( "%.0f", h )
    elseif isHex[p] then return toHex ( h )
    else return tostring ( h ) end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function stringToHandling ( property, str )
    if property == "centerOfMass" then
        local vX  = round ( tonumber ( gettok ( str, 1, 44 ) ) )
        local vY  = round ( tonumber ( gettok ( str, 2, 44 ) ) )
        local vZ  = round ( tonumber ( gettok ( str, 3, 44 ) ) )
              return { vX, vY, vZ }
    elseif property == "ABS" then if str == "true" then return true else return false end
    elseif property == "driveType" then
        if     str == "F" then return "fwd"
        elseif str == "R" then return "rwd"
        elseif str == "4" then return "awd"
        end
    elseif property == "engineType" then
        if     str == "E" then return "electric"
        elseif str == "P" then return "petrol"
        elseif str == "D" then return "diesel"
        end
    elseif property == "modelFlags" or property == "handlingFlags" then
        return tonumber ( "0x"..str )
    else
        return tonumber ( str )
    end
    return nil
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function unpackHandling ( str )
    local tbl,i = {},1
    local massChecked = false
    for w in string.gmatch ( str, "[^%s]+" ) do
        if not massChecked and tonumber(w) then massChecked = true end
        if massChecked then
            if tbl[ hProperty[i+1] ] then tbl[ hProperty[i+1] ] = tbl[ hProperty[i+1] ]..", "..w
            else tbl[ hProperty[i+1] ] = w end
            i=i+1
        end
    end
    return tbl -- table.size should return 33!
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function packHandling ( p, c, veh )
    local hnd = getVehicleHandling ( pVeh )
    local mdl = getElementModel ( pVeh )
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
    return outputChatBox ( table.concat ( tbl, " " ) )
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function loadVariables ( )
    if not loadTranslation["english"] then
        outputChatBox ( "HANDLING EDITOR: No english translation available! Handling editor will not work now.", 255, 0, 0 )
        stopResource ( )
    end
    if not loadTemplate["extended"] then
        outputChatBox ( "HANDLING EDITOR: No default template available! Handling editor will not work now.", 255, 0, 0 )
        stopResource ( )
    end
    ----------------------------------------------------------------------------------------------------------------------
    local xmlSettings = xmlLoadFile ( "config/settings.xml" )
    if not xmlSettings then
        xmlSettings = xmlCreateFile ( "config/settings.xml", "root" )
        for k,v in pairs ( getElementData ( resourceRoot, "hedit.settings" ) ) do
            local node = xmlCreateChild ( xmlSettings, "setting" )
            xmlNodeSetAttribute ( node, k, v )
            setting[k] = v
        end
    else
        for i,n in ipairs ( xmlNodeGetChildren ( xmlSettings ) ) do
            for k,v in pairs ( xmlNodeGetAttributes ( n ) ) do
                setting[k] = v
            end
        end
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

function setSaved ( bool )
    if not pVeh then return end
    guiSetText ( extraInfo, text.vehicle..": "..getVehicleName ( pVeh ) )
    if bool == false then
        guiSetText ( extraInfo, guiGetText ( extraInfo ).." - "..text.unsaved ) end
    if bool == nil then isSaved[pVeh] = true
    else isSaved[pVeh] = bool end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function stopResource ( txt )
    outputChatBox ( txt, 255, 0, 0 )
    triggerServerEvent ( "stopTheResource", resourceRoot )
end