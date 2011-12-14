--[[
    getText ( ... )
    
    getHandlingPropertyFriendlyName ( string property )
    getHandlingPropertyInformationText ( string property )
    getHandlingPropertyValueType ( string property )
    getHandlingPropertyValueInformation ( string property )
    getHandlingPropertyOptionNames ( string property )
    getHandlingPropertyByteName ( string property, integer byte, string value )
    getHandlingPropertyByteInformation ( string property, integer byte, string value )
    getHandlingHexadecimalChangeDetails ( element vehicle, string property, var value )
    
	cacheClientSaves ( )
    getClientSaves ( )
	isClientHandlingExisting ( string name )
    saveClientHandling ( string name, string description )
	loadClientHandling ( string name )

    loadHandling ( element vehicle, lowerCaseName, cacheLib ) -- Not for general use! It's called by functions.
    
    importHandling ( element vehicle, string handlingLine/table handlingTable )
    exportHandling ( element vehicle )
    
    resetVehicleHandling ( element vehicle, int baseID )
    
    prepareHandlingValue ( element vehicle, string property, var value )
    
    getPlayerCorrectTime ( int hours, int minutes, int seconds )
    setUserConfig ( string config, string value )
    getUserConfig ( string config )
    getUserTemplate ( )
    getUserLanguage ( )
    updateXMLCache ( string cahchelib, string cachename, table entry )
    updateRights ( bool loggedin, bool admin )
]]

function getText ( ... )
    local entry = getUserLanguage()
    
	if not entry then
		if DEBUGMODE then
		end

		return false
	end

    for i,tab in ipairs ( {...} ) do
    
        entry = entry[tab]
        
        if not entry then
        
            if DEBUGMODE then
                outputDebugString ( "No language entry in "..getUserConfig ( "language" )..": "..table.concat ( {...}, "." ) )
            end
            
            return "NO_TEXT"
            
        elseif type ( entry ) == "string" then
            return entry
        end
        
    end
    
    if DEBUGMODE then
        error ( "Cannot loop in getText!", 2 )
    end
    
    return "NO_TEXT"
end





function getHandlingPropertyFriendlyName ( property )
    if not isHandlingPropertyValid ( property ) then
        if DEBUGMODE then
            error ( "Invalid property '"..tostring(property).."' at getHandlingPropertyFriendlyName!", 2 )
        end
        return nil
    end
    
    return getText ( "handlingPropertyInformation", property, "friendlyName" ) or "NO_FRIENDLY_NAME"
end




function getHandlingPropertyInformationText ( property )
    if not isHandlingPropertyValid ( property ) then
        if DEBUGMODE then
            error ( "Invalid property '"..tostring(property).."' at getHandlingPropertyInformationText!", 2 )
        end
        return nil
    end
    
    return getText ( "handlingPropertyInformation", property, "information" ) or "NO_INFORMATION_TEXT"
end





function getHandlingPropertyValueType ( property )
    if not isHandlingPropertyValid ( property ) then
        if DEBUGMODE then
            error ( "Invalid property '"..tostring(property).."' at getHandlingPropertyValueType!", 2 )
        end
        return nil
    end
    
    return getText ( "handlingPropertyInformation", property, "syntax", 1 ) or "NO_VALUE_TYPE"
end





function getHandlingPropertyValueInformation ( property )
    if not isHandlingPropertyValid ( property ) then
        if DEBUGMODE then
            error ( "Invalid property '"..tostring(property).."' at getHandlingPropertyValueInformation!", 2 )
        end
        return nil
    end
    
    return getText ( "handlingPropertyInformation", property, "syntax", 2 ) or "NO_VALUE_INFORMATION"
end





function getHandlingPropertyOptionName ( property, option )
    if not isHandlingPropertyValid ( property ) then
        if DEBUGMODE then
            error ( "Invalid property '"..tostring(property).."' at getHandlingPropertyOptionNames!", 2 )
        end
        return nil
    end
    
    return getText ( "handlingPropertyInformation", property, "options", option ) or "NO_OPTION_NAME"
end





function getHandlingPropertyByteName ( property, byte, value )
    if not isHandlingPropertyValid ( property ) then
        if DEBUGMODE then
            error ( "Invalid property '"..tostring(property).."' at getHandlingPropertyByteName!", 2 )
        end
        return nil
    end
    
    if not isHandlingPropertyHexadecimal ( property ) then
        if DEBUGMODE then
            error ( "Property '"..tostring(property).."' is not hexadecimal at getHandlingPropertyByteName!", 2 )
        end
        return nil
    end
    
    return getText ( "handlingPropertyInformation", property, "items", byte, value, 1 ) or "NO_BYTE_NAME"
end





function getHandlingPropertyByteInformation ( property, byte, value )
    if not isHandlingPropertyValid ( property ) then
        if DEBUGMODE then
            error ( "Invalid property '"..tostring(property).."' at getHandlingPropertyByteInformation!", 2 )
        end
        return nil
    end
    
    if not isHandlingPropertyHexadecimal ( property ) then
        if DEBUGMODE then
            error ( "Property '"..tostring(property).."' is not hexadecimal at getHandlingPropertyByteInformation!", 2 )
        end
        return nil
    end
    
    return getText ( "handlingPropertyInformation", property, "items", byte, value, 2 ) or "NO_BYTE_INFORMATION"
end





function getHandlingHexadecimalChangeDetails ( vehicle, property, value )
    if not isValidVehicle ( vehicle ) then
        if DEBUGMODE then
            error ( "Invalid vehicle '"..tostring(vehicle).."' at getHandlingHexadecimalChangeDetails!", 2 )
        end
        
        return false
    end
    
    if not isHandlingPropertyValid ( property ) then
        if DEBUGMODE then
            error ( "Invalid property '"..tostring(property).."' at getHandlingHexadecimalChangeDetails!", 2 )
        end
        
        return false
    end
    
    if not isHandlingPropertyHexadecimal ( property ) then
        if DEBUGMODE then
            error ( "Property '"..tostring(property).."' is not hexadecimal at getHandlingHexadecimalChangeDetails!", 2 )
        end
        return nil
    end
    
    
    
    return hexChanges, hexByte, hexValue, hexBool
end





function cacheClientSaves ( )
    local saves = xmlLoadFile ( client_handling_file )
    xmlCache.clientsaves = {}


    if not saves then
        saves = xmlCreateFile ( client_handling_file, "saves" )

        if DEBUGMODE then
            outputDebugString ( "Added new client handling saves file." )
        end
    end

    for i,node in ipairs ( xmlNodeGetChildren ( saves ) ) do

        local model = xmlNodeGetAttribute ( node, "model" )
        local name = xmlNodeGetAttribute ( node, "name" )
        local description = xmlNodeGetAttribute ( node, "description" )
        local lowername = string.lower ( name )
        local handlingNode = xmlFindChild ( node, "handling", 0 )
        local handling = {}

        for p,v in pairs ( xmlNodeGetAttributes ( handlingNode ) ) do
            handling[p] = v
        end

        xmlCache.clientsaves[lowername] = {
            model = model,
            name = name,
            description = description,
            saveNode = node,
            handling = handling
        }

    end

    return true
end





function getClientSaves ( )
    return xmlCache.clientsaves
end





function isClientHandlingExisting ( name )
    if type ( name ) ~= "string" then
        if DEBUGMODE then
            error ( "Need a string at 'isClientHandling'! ["..tostring(name).."]", 2 )
        end

        return false
    end

    name = string.lower ( name )

    return xmlCache.clientsaves[name] and true or false
end





function saveClientHandling ( vehicle, name, description )
    if not isValidVehicle ( vehicle ) then
        if DEBUGMODE then
            error ( "Invalid vehicle element at 'saveClientHandling'! ["..tostring(vehicle).."]", 2 )
        end

        return false
    end

    if type ( name ) ~= "string" then
        if DEBUGMODE then
            error ( "Name needs to be a string at 'saveClientHandling'! ["..tostring(name).."]", 2 )
        end

        return false
    end

    if type ( description ) ~= "string" then
        if DEBUGMODE then
            error ( "Description needs to be a string at 'saveClientHandling'! ["..tostring(description).."]", 2 )
        end

        return false
    end



    local lowername = string.lower ( name )

    if xmlCache.clientsaves[lowername] then
        xmlDestroyNode ( xmlCache.clientsaves[lowername].saveNode )
        xmlCache.clientsaves[lowername] = nil
    end

    local savenode = xmlCreateChild ( xmlFile[client_handling_file], "save" )
    local handlingnode = xmlCreateChild ( savenode, "handling" )
    local handling = {}

    local model = tostring ( getElementModel ( vehicle ) )

    xmlNodeSetAttribute ( savenode, "model", model )
    xmlNodeSetAttribute ( savenode, "name", name )
    xmlNodeSetAttribute ( savenode, "description", description )

    for p,v in pairs ( getVehicleHandling ( vehicle ) ) do
        local str = valueToString ( p, v )
        handling[p] = str
        --[[if not xmlNodeSetAttribute ( handlingnode, p, str ) then
            outputChatBox ( "str: "..tostring ( str ) )
        end]]
    end

    xmlSaveFile ( xmlFile[client_handling_file] )

    xmlCache.clientsaves[lowername] = {
        model = model,
        name = name,
        description = description,
        saveNode = savenode,
        handling = handling
    }

    setVehicleSaved ( vehicle, true )

    return true
end





function loadClientHandling ( vehicle, name )
    if not isValidVehicle ( vehicle ) then
        if DEBUGMODE then
            error ( "Invalid vehicle element at 'loadClientHandling'! ["..tostring(vehicle).."]", 2 )
        end

        return false
    end

    if not isClientHandlingExisting ( name ) then
        if DEBUGMODE then
            error ( "Handling name given at 'loadClientHandling' does not exist! ["..tostring(name).."]", 2 )
        end

        return false
    end

    name = string.lower ( name )
    local handling = xmlCache.clientsaves[name].handling

    triggerServerEvent ( "loadClientHandling", vehicle, handling )

    return true
end





function importHandling ( vehicle, handlingLine, method )
    if not isValidVehicle ( vehicle ) then
        if DEBUGMODE then
            error ( "Invalid vehicle '"..tostring(vehicle).."' at importHandling!", 2 )
        end
        return false
    end
    
    
    
    local handlingTable = {}
    
    local id = 1
    local vIdentifierFound = false
    
    for value in string.gmatch ( handlingLine, "[^%s]+" ) do
        if not vIdentifierFound and tonumber ( value ) then
            vIdentifierFound = true
        end
        
        if vIdentifierFound then
            id = id + 1
            local property = getHandlingPropertyNameFromID ( id )
            
            if property then
                handlingTable[property] = stringToValue ( property, value )
            end
        end
    end
    
    if id ~= 36 then
        addLogEntry ( vehicle, localPlayer, "invalidImport", nil, nil, 3 )
        return false
    end
    
    
    
    local function func ( )
        triggerServerEvent ( "importHandling", vehicle, handlingTable )
    end
    
    if not isVehicleSaved ( vehicle ) then
        guiCreateWarningMessage ( getText ( "confirmImport" ), 1, {func} )
        return true
    end
    
    func ( )
    return true
end





function exportHandling ( vehicle )
    if not isValidVehicle ( vehicle ) then
        if DEBUGMODE then
            error ( "Invalid vehicle '"..tostring(vehicle).."' at exportHandling!", 2 )
        end
        return false
    end
    
    local str = {}
    local handling = getVehicleHandling ( vehicle )
    
    for id=1,36 do
        local property = getHandlingPropertyNameFromID ( id )
        local inputType = getHandlingPropertyInputType ( property )
        
        str[id] = tostring ( inputType == "float" and math.round ( handling[property], 3 ) or handling[property] )
    end
    
    return table.concat ( str, " " )
end





function resetVehicleHandling ( vehicle, baseID )
    if not isValidVehicle ( vehicle ) then
        if DEBUGMODE then
            error ( "Invalid vehicle '"..tostring(vehicle).."' at resetVehicleHandling!", 2 )
        end
        return false
    end
    
    if type ( baseID ) ~= "number" then
        baseID = getElementModel ( vehicle )
    end
    
    triggerServerEvent ( "resetHandling", vehicle, baseID )
    return true
end





function prepareHandlingValue ( vehicle, property, value )
    outputDebugString ( "VALUE: "..tostring(value).." - strval: "..tostring(stringToValue ( property, value )).. " - Type: "..type ( value ) )
    setVehicleHandling ( vehicle, property, value )
    
    return true
end





function getUserConfig ( config )
    if type ( config ) ~= "string" then
        return false
    end
    
    if pData.userconfig[config] then
        return pData.userconfig[config]
    end
    
    
    
    local xml = _xmlLoadFile ( client_config_file ) -- Avoid calling any wrappers!
    
    if not xml then
        error ( "Client config file doesn't exist!", 2 )
    end
    
    local node = xmlFindChild ( xml, config, 0 )
    
    if not node then
        if DEBUGMODE then
            outputDebugString ( "Node '"..config.."' doesn't exist in the userconfig, can't return value." )
        end

        _xmlUnloadFile ( xml ) -- Avoid calling any wrappers!
        return nil
    end
    
    
    
    local value = xmlNodeGetValue ( node )
    pData.userconfig[config] = value
    
    if DEBUGMODE then
        outputDebugString ( "Added userconfig "..config.." with value '"..tostring(value).."' to pData." )
    end
    
    _xmlUnloadFile ( xml ) -- Avoid calling any wrappers!
    
    return value
end





function setUserConfig ( config, value )
    if type ( config ) ~= "string" then
        return false
    end
    
    if not value then 
        return false
    end
    
    
    
    local xml = _xmlLoadFile ( client_config_file ) -- Avoid calling any wrappers!
    
    if not xml then
        error ( "Client config file doesn't exist!" )
    end
    
    local node = xmlFindChild ( xml, config, 0 )
    
    if not node then
        node = xmlCreateChild ( xml, config )
    end
    
    
    
    xmlNodeSetValue ( node, tostring ( value ) )
    pData.userconfig[config] = value
    
    if DEBUGMODE then
        outputDebugString ( "Changed config "..config.." to '"..tostring(value).."'" )
    end
    
    _xmlSaveFile ( xml ) -- Avoid calling any wrappers!
    _xmlUnloadFile ( xml ) -- Avoid calling any wrappers!
    
    return true
end





function getUserLanguage ( )
    local config = getUserConfig ( "language" )
    
    if config then
        return guiLanguage[config]
    end
    
    return guiLanguage.english
end





function getUserTemplate ( )
    local config = getUserConfig ( "template" )
    
    if config then
        return guiTemplate[config]
    end
    
    return guiTemplate.default
end





function getPlayerCorrectTime ( hours, minutes, seconds )
    return hours, minutes, seconds
end





function updateXMLCache ( cacheLib, cacheName, cacheEntry )
    if not xmlCache[cacheLib] then
        outputDebugString ( "No cacheLib present for "..tostring(cacheLib).."! Can't update cache, aborting.", 2 )
        return false
    end
    
    xmlCache[cacheLib][cacheName] = cacheEntry
    return true
end
addEvent ( "updateClientXMLCache", true )
addEventHandler ( "updateClientXMLCache", root, updateXMLCache )





function updateRights ( loggedin, admin )
    pData.loggedin = loggedin
    pData.isadmin = admin
    
    if DEBUGMODE then
        outputDebugString ( "Updated rights: loggedin:"..tostring(loggedin).." | isadmin:"..tostring(admin) )
    end
    
    return true
end
addEvent ( "updateClientRights", true )
addEventHandler ( "updateClientRights", root, updateRights )