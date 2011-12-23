addEventHandler ( "onClientResourceStart", resourceRoot,
    function ( )

        local xml = xmlLoadFile ( client_config_file )
        
        if not xml then

            xml = xmlCreateFile ( client_config_file, "config" )

            if DEBUGMODE then
                outputDebugString ( "Created new settings file ["..tostring(xml).."]" )
            end
            
        end
        
        for cfg,value in pairs ( setting ) do
            if not xmlFindChild ( xml, cfg, 0 ) then
                local node = xmlCreateChild ( xml, cfg )
                xmlNodeSetValue ( node, tostring ( value ) )
            end
        end
        
        local ver = getUserConfig ( "version" )
        if ver and ver < HVER then -- Prevent older versions of hedit removing your new settings

            for num,node in ipairs ( xmlNodeGetChildren ( xml ) ) do
                local name = xmlNodeGetName ( node )
                if not setting[name] then
                    xmlDestroyNode ( node )
                end
            end

        end

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