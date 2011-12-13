addEventHandler ( "onResourceStart", resourceRoot, function ( )
    
    -- !HIGH PRIORITY!
    -- KEEP THIS IN ORDER TO LET CLIENTS SYNC THEIR SAVED HANDLINGS BETWEEN SERVERS!
    -- BY KEEPING THE DEFAULT RESOURCENAME PLAYERS CAN STORE THEIR HANDLINGS CLIENTSIDE,
    -- SO WHENEVER THEY JOIN ANOTHER SERVER, THEY WILL BE ABLE TO LOAD THEIR OWN HANDLINGS!
    if getVersion().number < 262 then
        outputChatBox ( "Handling Editor failed to start, see the log's for more information." )
        print ( "===============================================================================" )
        print ( "[HEDIT] Server needs version 1.1 or newer, in order for HEDIT to work" )
        print ( "===============================================================================" )
        return cancelEvent ( true, "Server is not running MTA:SA 1.1 or later. Install 1.1 or newer." )
    end
    
    local resName = getResourceName ( resource )
    
    if resName ~= "hedit" and not DEBUGMODE then
        outputChatBox ( "Handling Editor failed to start, see the log's for more information." )
        print ( "===============================================================================" )
        print ( "[HEDIT] Please rename resource '"..resName.."' to 'hedit' in order to work." )
        print ( "[HEDIT] This is needed to sync the clients handlings properly." )
        print ( "[HEDIT] The handling editor will not work now. Please rename first." )
        print ( "===============================================================================" )
        return cancelEvent ( true, "Rename the handling editor resource to 'hedit' in order to work." )
    end
    
    
    
    print ( "===============================================================================" )
    print ( " HANDLING EDITOR BY REMI-X [V2.0 unstable]" )
    print ( "===============================================================================" )
    if fileExists ( "handling.cfg" ) then
        print ( " Handling.cfg found." )
        print ( " Type 'loadcfg' to load handling.cfg into the memory." )
        print ( " After this, you can import the handling into defaults.xml." )
        print ( "===============================================================================" )
    end
    
    
    
    for model=400,611 do
        setElementData ( root, "originalHandling."..tostring ( model ), getOriginalHandling ( model, true ) )
    end
    
    initiateCFGLoader ( )
    
    return true
end )





addEventHandler ( "onPlayerLogin", root, function ( )
    local admin = isObjectInACLGroup ( "user."..getAccountName ( getPlayerAccount ( source ) ), aclGetGroup ( "Admin" ) )
    triggerClientEvent ( source, "updateClientRights", source, true, admin )
end )





addEventHandler ( "onPlayerLogout", root, function ( )
    triggerClientEvent ( source, "updateClientRights", source, false, false )
end )