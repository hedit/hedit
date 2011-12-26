_outputChatBox = outputChatBox
if serverside then
    function outputChatBox ( str, r, g, b )
        return _outputChatBox ( "#FFFFFF[HEDIT] #D00000"..str, root, r or 255, g or 255, b or 255, true )
    end
else
    function outputChatBox ( str, r, g, b )
        return _outputChatBox ( "#FFFFFF[HEDIT] #D00000"..str, r or 255, g or 255, b or 255, true )
    end
end





_getVehicleNameFromModel = getVehicleNameFromModel
function getVehicleNameFromModel ( model )
    if not isValidVehicleModel ( model ) then
        if DEBUGMODE then
            outputDebugString ( "Invalid model "..tostring(model).." in 'getVehicleFromModel'!" )
        end
        
        return false
    end
   
    local name = _getVehicleNameFromModel ( model )
    
    if not name or name == "" then
        name = "ID: "..tostring(v)
    end
    
    return name
end





_getVehicleModelFromName = getVehicleModelFromName
function getVehicleModelFromName ( name )
    local subname = string.gsub ( name, "ID: ", "" )
    
    if subname ~= name then
        return tonumber ( subname )
    end
    
    return _getVehicleModelFromName ( name )
end





_xmlLoadFile = xmlLoadFile
function xmlLoadFile ( file )
    if type ( file ) ~= "string" then
        if DEBUGMODE then
            outputDebugString ( "Need a string at xmlLoadFile!" )
        end

        return false
    end

    if not fileExists ( file ) then
        if DEBUGMODE then
            outputDebugString ( "XML '"..file.."' does not exist." ) 
        end

        return false
    end

    if xmlFile[file] then
        return xmlFile[file]
    end

    local xml = _xmlLoadFile ( file )
    
    if not xml then
        if DEBUGMODE then
            outputDebugString ( "Cannot open XML '"..tostring(file).."' for some reason." )
        end

        return false
    end

    xmlFile[file] = xml
    return xml
end





_xmlCreateFile = xmlCreateFile
function xmlCreateFile ( file, rootNode )
    local xml = _xmlCreateFile ( file, rootNode )
    
    if not xml then
        return false
    end

	xmlSaveFile(xml)
	xmlUnloadFile(xml)
	
	xml = xmlLoadFile(file)
	
    xmlFile[file] = xml
    return xml
end





_xmlSaveFile = xmlSaveFile
function xmlSaveFile ( file )
    if type ( file ) == "string" then
        file = xmlFile[file]
    end
    
    if type ( file ) ~= "userdata" then
        return false
    end

    _xmlSaveFile ( file )

    return true
end





_xmlUnloadFile = xmlUnloadFile
function xmlUnloadFile ( file )
    local strfile
    
    if type ( file ) == "string" then
        strfile = file
        file = xmlFile[file]
    end

    if type ( file ) ~= "userdata" then
        return false
    end

    _xmlSaveFile ( file )
    if not _xmlUnloadFile ( file ) then
        outputChatBox ( "wut" )
    end
    
    if strfile then
        xmlFile[file] = nil
        return true
    end
    
    for k,v in pairs ( xmlFile ) do
        if v == file then
            xmlFile[k] = nil
        end
    end
    
    return false
end