--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/menu/subMenu.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Handling subMenu stuff
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

subItemHandler["saveclient"] = function ( r, src, event )
    if not xmlSavesNode then return end
    if event == "click" then
        if src == r.button then
            trySave ( )
        elseif src == r.grid then
            local row,col = guiGridListGetSelectedItem ( src )
            if row > -1 and col > -1 then
                local name = string.lower ( guiGridListGetItemText ( src, row, col ) )
                guiSetText ( r.nameEdit, xmlSavesTable[name].s )
                setInfoText ( xmlSavesTable[name].s, xmlSavesTable[name].d, true )
            end
        end
    elseif event == "editAccept" then
        if src == r.nameEdit then
            trySave ( )
        end
    elseif event == "blur" then
        if src == r.nameEdit and guiGetText ( src ) == "" then guiBringToFront ( r.nameLabel )
        elseif src == r.descriptionEdit and guiGetText ( src ) == "" then guiBringToFront ( r.descriptionLabel ) end
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

subItemHandler["loadclient"] = function ( r, src, event )
    if event == "click" then
        if src == menuContent["loadclient"].button or src == menuContent["loadclient"].grid then
            local row,col = guiGridListGetSelectedItem ( menuContent["loadclient"].grid )
            if row ~= -1 and col ~= -1 then
                local name = string.lower ( guiGridListGetItemText ( menuContent["loadclient"].grid, row, col ) )
                if xmlSavesTable[name].s then
                    local data = {}
                    for k,v in pairs ( xmlSavesTable[name].h ) do
                        data[k] = stringToHandling ( k, v )
                    end
                    if src == menuContent["loadclient"].button then
                        if data then
                            triggerServerEvent ( "loadClientHandling", localPlayer, pVeh, data, slog )
                            showData ( pm )
                        end
                    elseif src == menuContent["loadclient"].grid then
                        setInfoText ( xmlSavesTable[name].s, xmlSavesTable[name].d, true )
                    end
                end
            end
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
--[[subItemHandler["dynamometer"] = function ( r, src, event )
    if event == "click" and src == menuContent["dynamometer"].button then
        fadeCamera        ( false )
        guiSetVisible     ( mainWnd.window, false )
        guiSetVisible     ( dynoWnd.window, true )
        unbindKey         ( setting["usedKey"], "down", toggleEditor )
        -----------------------------------------------------------------------------------------------------------------
        oldData           = {
                              "setElementPosition("..table.concat({getElementPosition(pVeh)})..")",
                              "setVehicleGravity("..table.concat({getVehicleGravity(pVeh)})..")",
                              "setGravity("..tostring(getGravity())..")",
                              "setGameSpeed("..tostring(getGameSpeed())..")",
                              "setCloudsEnabled("..tostring(getCloudsEnabled())..")"
                            }
        -----------------------------------------------------------------------------------------------------------------
        fadeCamera        ( false )
        setGravity        ( 0.008 )
        setVehicleGravity ( veh, 0, 0, 0 )
        setGameSpeed      ( 1 )
        setCloudsEnabled  ( false )
        setTimer          ( ) -- Set positions
        setTimer          ( ) -- Start testing
        -----------------------------------------------------------------------------------------------------------------
        setElementPosition ( )
        setElementRotation ( )
    end
end]]