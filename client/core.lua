addEventHandler ( "onClientResourceStart", resourceRoot,
    function ( )

        local xml = xmlLoadFile(client_config_file) or xmlCreateFile(client_config_file, "config")
        
		if DEBUGMODE then
			outputDebugString(string.format("fileExists = %s, xml root node = %s", tostring(fileExists(client_config_file)), tostring(xml)))
		end
		
        for cfg,value in pairs ( setting ) do
            if not xmlFindChild ( xml, cfg, 0 ) then
                local node = xmlCreateChild ( xml, cfg )
                xmlNodeSetValue ( node, tostring ( value ) )
				if DEBUGMODE then
					outputDebugString(string.format("Added entry (%s, %s) [node = %s] to the client config file.", tostring(cfg), tostring(value), tostring(node)))
				end
            end
        end
        --xmlSaveFile(xml)
		outputDebugString(tostring(#xmlNodeGetChildren(xml)))
		
        local ver = getUserConfig ( "version" )
        --[[if ver and ver < HVER then -- Prevent older versions of hedit removing your new settings
			for _,node in ipairs(xmlNodeGetChildren(xml)) do
                local name = xmlNodeGetName ( node )
                if not setting[name] then
                    xmlDestroyNode ( node )
                end
            end

        end]]

        xmlSaveFile ( xml )
        xmlUnloadFile ( xml )



        cacheClientSaves ( )
        
        
        
        triggerServerEvent ( "requestRights", root )
        
        
        
        startBuilding ( )
        return true
    end
)





addEventHandler ( "onClientResourceStop", resourceRoot,
    function ( )
        
        xmlUnloadFile ( client_handling_file )
        
        return true

    end
)