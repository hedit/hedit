--[[
    guiCreateID ( element gui, string id )
    guiGetElementFromID ( string id )
    
    guiGetElementParent ( element gui )
    guiGetElementInputType ( element gui ) -- Only for menu items!
    guiGetElementProperty ( element gui ) -- Only for config menu items!
    guiGetElementInfo ( element gui )
    guiGetElementEvents ( element gui )
    
    toggleEditor ( )
    setVisible ( bool visible )
    
    setPointedElement ( element guiElement, bool pointing )
    showOriginalValue ( string key, string state )
    showPreviousValue ( string key, string state )
    handleKeyState ( string "up"/"down" )
    
    guiSetInfoText ( string header, string text )
    guiSetStaticInfoText ( string header, string text )
    guiResetInfoText ( )
    guiResetStaticInfoText ( )
    
    guiToggleUtilityDropDown ( [string utility = all] )
    guiShowMenu ( string menu )
    guiUpdateMenu ( )
    
    guiTemplateGetUtilButtonText ( string utilbutton )
    guiTemplateGetMenuButtonText ( string menubutton )
    guiTemplateGetItemText ( string menu, string item )
    
    getMenuShortName ( string menu )
    getMenuLongName ( string menu )
    getMenuRedirect ( string menu )
    
    guiCreateWarningMessage ( string text, int level, table {function1, args... }, table {function2, args...} )
    guiDestroyWarningWindow ( )
]]

function guiSetElementID ( guiElement, id )
    if not isElement ( guiElement ) then
        return false
    end
    
    if type ( id ) ~= "string" then
        return false
    end
    
    if guiID[id] and DEBUGMODE then
        outputDebugString ( "Overwriting guiID "..tostring(id) )
    end
    
    guiID[id] = guiElement
    
    return true
end




function guiGetElementFromID ( id )
    if not guiID[id] then
        if DEBUGMODE then
            outputDebugString ( "Unexisting guiID '"..tostring(id) )
        end
        
        return false
    end
    
    return guiID[id]
end





function guiGetElementParent ( guiElement )
    if guiElements[guiElement] then
        return guiElements[guiElement][1]
    end
    
    return nil
end





function guiGetElementInputType ( guiElement )
    if guiGetElementParent ( guiElement ) ~= "menuItem" then
        return false
    end
    
    if guiElements[guiElement] then
        return guiElements[guiElement][2]
    end
    
    return nil
end





function guiGetElementProperty ( guiElement )
    if guiGetElementParent ( guiElement ) ~= "menuItem" then
        return false
    end
    
    local inputType = guiGetElementInputType ( guiElement )
    if inputType ~= "infolabel" and inputType ~= "config" then
        return false
    end
    
    return guiElements[guiElement][3]
end





function guiGetElementInfo ( guiElement )
    if guiElements[guiElement] then
        return guiElements[guiElement][4]
    end
    
    return nil
end





function guiGetElementEvents ( guiElement )
    if guiElements[guiElement] then
        return guiElements[guiElement][5]
    end
    
    return nil
end





function toggleEditor ( )
    local window = heditGUI.window
    
    if guiGetVisible ( window ) then
        guiToggleUtilityDropDown ( currentUtil )
        
		if heditGUI.prevLockState == false then
			setVehicleLocked(pVehicle, false)
			heditGUI.prevLockState = nil
		end
		
        setVisible ( false )
        return true
    end
    
    if pVehicle then
        
        -- When you abort entering a vehicle, hedit will still think you own a vehicle. Hax for thiz
        -- I need onClientVehicleAbortEnter, NOAW
        if not getPedOccupiedVehicle ( localPlayer ) then
            if DEBUGMODE then
                outputDebugString ( "pVehicle exist, but you do not own a vehicle!" )
            end
            
            pVehicle = false
            guiCreateWarningMessage(getText ( "needVehicle" ), 1)
            return false
        end
        
        
        
        local vehicleController = getVehicleController ( pVehicle )
        
        if vehicleController ~= localPlayer --[[and not setting.allowPassengersToEdit]] then
            guiCreateWarningMessage ( getText ( "restrictedPassenger" ), 1)
            return false
        end
        
        -- Hack to destroy the warning messages from "Youre not in a vehicle" when opening the editor WITH a vehicle
        if isElement ( warningWnd ) and guiGetVisible ( warningWnd ) then
            guiDestroyWarningWindow ( )
        end
        
        -- Show the editor before notifying updates or upgrades.
        setVisible ( true )

		-- Lock the vehicle, if the user has set the setting.
		if getUserConfig("lockVehicleWhenEditing") then
			if not isVehicleLocked(pVehicle) then
				setVehicleLocked(pVehicle, true)
				heditGUI.prevLockState = false
			end
		end
		
        -- If a server runs an older version, or doesnt meet your version of data files, show a message.
        local ver = tonumber ( getUserConfig ( "version" ) )
        local minver = tonumber ( getUserConfig ( "minVersion" ) )

        if ver > HREV then

            if minver > HMREV then
                guiCreateWarningMessage ( getText ( "outdatedUpgrade" ), 0 )
            else
                guiCreateWarningMessage ( getText ( "outdatedUpdate" ), 1 )
            end

        end

        -- Notify the player upon an update or upgrade
        if getUserConfig ( "notifyUpdate" ) == "true" then

            guiDestroyWarningWindow ( )
            guiCreateWarningMessage ( getText ( "notifyUpdate" ), 2, {guiShowMenu,"updatelist"} )
            setUserConfig ( "notifyUpdate", "false" )

        elseif getUserConfig ( "notifyUpgrade" ) == "true" then

            guiDestroyWarningWindow ( )
            guiCreateWarningMessage ( getText ( "notifyUpgrade" ), 2, {guiShowMenu,"updatelist"} )
            setUserConfig ( "notifyUpgrade", "false" )
        
        elseif tonumber ( getUserConfig ( "mtaVersion" ) ) < MTAVER then
            
            guiDestroyWarningWindow ( )
            guiCreateWarningMessage ( getText ( "mtaUpdate" ), 1)
            setUserConfig ( "mtaVersion", tostring ( MTAVER ) )

        end

        return true
    end
    
    guiCreateWarningMessage ( getText ( "needVehicle" ), 1 )
    
    return false
end





function setVisible ( bool )
    if type ( bool ) ~= "boolean" then
        if DEBUGMODE then
            error ( "No boolean value at 'setVisible'!", 2 )
        end
        
        return false
    end

    local window = heditGUI.window
    
    -- We shouldnt call all the stuff when the state of the window is already the state we want
    -- Otherwise we will call showCursor again, which will cause major problems with hiding or showing it
    if guiGetVisible ( window ) == bool then
        return false
    end
    
    local bind = unbindKey
    
    if bool then
        bind = bindKey
        guiSetInputMode ( "no_binds_when_editing" )
    end
    
    bind ( "lctrl", "both", showOriginalValue )
    bind ( "rctrl", "both", showOriginalValue )
    bind ( "lshift", "both", showPreviousValue )
    bind ( "rshift", "both", showPreviousValue )
    --[[bind ( "mouse_wheel_up", "up", onScroll, "up" )
    bind ( "mouse_wheel_down", "up", onScroll, "down" )
    bind ( "delete", "down", tryDelete )]]
    
    guiSetVisible ( window, bool )
    
    if isElement ( warningWnd ) then
        guiSetVisible ( warningWnd, bool )
    end
    
    showCursor ( bool, bool )
    
    return true
end





function setPointedElement ( element, bool ) -- Consider another name!
    if element == pointedButton and buttonValue then
        guiSetText ( pointedButton, buttonValue )
        guiSetProperty ( pointedButton, "HoverTextColour", buttonHoverColor )
        buttonValue = nil
        pressedKey = nil
    end
    
    if bool then
        pointedButton = element
        buttonHoverColor = guiGetProperty ( element, "HoverTextColour" )
        handleKeyState ( "down" )
        return true
    end
    
    pointedButton = nil
    buttonHoverColor = nil
    --handleKeyState ( "up" )
    
    return true
end





function showOriginalValue ( key, state ) -- Maybe merge with showPreviousValue?
    if pointedButton then
        if state == "down" then
            if pressedKey ~= "shift" then
                local property = guiGetElementProperty ( pointedButton )
                local original = getOriginalHandling ( getElementModel ( pVehicle ) )[property]
                
                if property == "centerOfMass" then
                    local hnd = getOriginalHandling ( getElementModel ( pVehicle ) )
                    original = math.round ( hnd.centerOfMassX )..", "..math.round ( hnd.centerOfMassY )..", "..math.round ( hnd.centerOfMassZ )
                end

                buttonValue = guiGetText ( pointedButton )
                guiSetText ( pointedButton, valueToString ( property, original ) )
                guiSetProperty ( pointedButton, "HoverTextColour", "FF68F000" )
                pressedKey = "ctrl"
            end
            
            return true
        end
        
        if buttonValue then
            guiSetText ( pointedButton, buttonValue )
            guiSetProperty ( pointedButton, "HoverTextColour", buttonHoverColor )
            buttonValue = nil
            pressedKey = nil
            
            handleKeyState ( "down" )
            return true
        end
        
        return true
    end
    
    return false
end





function showPreviousValue ( key, state ) -- Maybe merge with showOriginalValue?
    if pointedButton then
        if state == "down" then
            if pressedKey ~= "ctrl" then
                local property = guiGetElementProperty ( pointedButton )
                local previous = getHandlingPreviousValue ( pVehicle, property )
                
                if previous then
                    buttonValue = guiGetText ( pointedButton )
                    guiSetText ( pointedButton, valueToString ( property, previous ) )
                    guiSetProperty ( pointedButton, "HoverTextColour", "FFF0D400" )
                    pressedKey = "shift"
                end
            end
            
            return true
        end
        
        if buttonValue then
            guiSetText ( pointedButton, buttonValue )
            guiSetProperty ( pointedButton, "HoverTextColour", buttonHoverColor )
            buttonValue = nil
            pressedKey = nil
            
            handleKeyState ( "down" )
            return true
        end
        
        return true
    end
    
    return false
end





function handleKeyState ( state )
    if getKeyState ( "lctrl" ) or getKeyState ( "rctrl" ) then
        showOriginalValue ( "lctrl", state )
    elseif getKeyState ( "lshift" ) or getKeyState ( "rshift" ) then
        showPreviousValue ( "lshift", state )
    end
end





function guiSetInfoText ( header, text )
    local infobox = heditGUI.specials.infobox
    
    guiSetText ( infobox.header, header )
    guiSetText ( infobox.text, text )
    
    return true
end





function guiSetStaticInfoText ( header, text )
    local infobox = heditGUI.specials.infobox
    
    guiSetText ( infobox.header, header )
    guiSetText ( infobox.text, text )
    
    staticinfo.header = header
    staticinfo.text = text
    
    return true
end





function guiResetInfoText ( )
    local infobox = heditGUI.specials.infobox
    
    guiSetText ( infobox.header, staticinfo.header )
    guiSetText ( infobox.text, staticinfo.text )
    
    return true
end





function guiResetStaticInfoText ( )
    local infobox = heditGUI.specials.infobox
    
    if guiGetText ( infobox.header ) == staticinfo.header then
        guiSetText ( infobox.header, "" )
        guiSetText ( infobox.text, "" )
    end
    
    staticinfo.header = ""
    staticinfo.text = ""
    
    return true
end




function toggleMenuItemsVisibility ( menu, bool )
    local function toggleVisibility ( tab )
        if type ( tab ) ~= "table" then
            if DEBUGMODE then
                outputChatBox ( "Error when showing menu items from menu '"..tostring ( menu ).."'" )
            end
        else
            for k,gui in pairs ( tab ) do
                if type ( gui ) == "table" then
                    toggleVisibility ( gui )
                else
                    guiSetVisible ( gui, bool )
					guiSetEnabled(gui, isHandlingPropertyEnabled(guiGetElementProperty(gui)))
                end
            end
        end
    end
    toggleVisibility ( heditGUI.menuItems[menu].guiItems )
    
    return true
end





function guiToggleUtilityDropDown ( util )
    if not util then
        for util,tab in pairs ( heditGUI.utilItems ) do
            for i,gui in ipairs ( tab ) do
                guiSetVisible ( gui, false )
            end
        end
        
        currentUtil = nil
        return true
    end
    
    if currentUtil then
        for i,gui in ipairs ( heditGUI.utilItems[currentUtil] ) do
            guiSetVisible ( gui, false )
        end
    end
    
    if util == currentUtil then
        currentUtil = nil
        return false
    end
    
    local show = not guiGetVisible ( heditGUI.utilItems[util][1] )
    
    for i,gui in ipairs ( heditGUI.utilItems[util] ) do
        guiSetVisible ( gui, show )
        guiBringToFront ( gui )
    end
    
    currentUtil = util
    
    return true
end





function guiShowMenu ( menu )
    if menu == "previous" then
        guiShowMenu ( previousMenu )
        return true
    end

    if menu == currentMenu then
        guiUpdateMenu ( currentMenu )
        return false
    end
    
    if not heditGUI.menuItems[menu] then
        guiCreateWarningMessage ( getText ( "invalidMenu" ), 0 )
        return false
    end
    
    if heditGUI.menuItems[menu].requireLogin and not pData.loggedin then
        guiCreateWarningMessage ( getText ( "needLogin" ), 1 )
        return false
    end
    
    if heditGUI.menuItems[menu].requireAdmin and not pData.isadmin then
        guiCreateWarningMessage ( getText ( "needAdmin" ), 1 )
        return false
    end

    if heditGUI.menuItems[menu].disabled then
        guiCreateWarningMessage ( getText ( "disabledMenu" ), 1 )
        return false
    end
    
    
    
    guiSetText ( heditGUI.specials.menuheader, getMenuLongName ( menu ) )
    
    destroyEditBox ( )
    
    guiUpdateMenu ( menu )
    
    if currentMenu then
        if type ( heditGUI.menuItems[currentMenu].onClose ) == "function" then
            heditGUI.menuItems[currentMenu].onClose ( heditGUI.menuItems[currentMenu].guiItems )
        end

        toggleMenuItemsVisibility ( currentMenu, false )
    end
    
    toggleMenuItemsVisibility ( menu, true )
    
    if type ( heditGUI.menuItems[menu].onOpen ) == "function" then
        heditGUI.menuItems[menu].onOpen ( heditGUI.menuItems[menu].guiItems )
    end

    previousMenu = currentMenu
    currentMenu = menu
    
    return true
end
addEvent ( "showMenu", true )
addEventHandler ( "showMenu", root, guiShowMenu )





function guiUpdateMenu ( menu )
    if menu then
        local veh = getPedOccupiedVehicle ( localPlayer )
        if not veh or veh ~= pVehicle then
            if DEBUGMODE then
                outputDebugString ( "guiUpdateMenu is called while your vehicle differs from pVehicle or dont have a vehicle!" )
            end
            
            return false
        end
        
        
        
        destroyEditBox ( )
        
        local redirect = getMenuRedirect ( menu )
        
        if redirect == "handlingconfig" then
            
            local content = heditGUI.menuItems[menu].guiItems
            local handling = getVehicleHandling ( pVehicle )
            
            for i,gui in ipairs ( content ) do
                local input = guiGetElementInputType ( gui )
                
                if input == "config" then
                
                    local property = guiGetElementProperty ( gui )
                    local config = handling[property]
                    
                    if handlingLimits[property] and handlingLimits[property].options then
                    
                        local id = getHandlingOptionID ( property, string.lower ( config ) )
                        guiComboBoxSetSelected ( gui, id-1 )
                        
                    else
                        
                        local str = valueToString ( property, config )

                        if property == "centerOfMass" then
                            local x,y,z = handling.centerOfMassX,handling.centerOfMassY,handling.centerOfMassZ
                            str = math.round ( x )..", "..math.round ( y )..", "..math.round ( z )
                        end
                        
                        if pressedKey and pointedButton == gui then
                            if pressedKey == "ctrl" then
                                guiSetText ( gui, str )
                                buttonValue = str
                            elseif pressedKey == "shift" then
                                guiSetText ( gui, buttonValue )
                                buttonValue = str
                            end
                        else
                            guiSetText ( gui, str )
                        end
                        
                    end
                
                end
                
            end
        
        
        
        elseif redirect == "handlingflags" then
        
            local content = heditGUI.menuItems[menu].guiItems
            local property = guiGetElementProperty ( content[1]["1"] )
            local config = getVehicleHandling ( pVehicle )[property]
            local reversedHex = string.reverse ( config )..string.rep ( "0", 8 - string.len ( config ) )
            local num = 1
            
            
            
            for byte in string.gmatch ( reversedHex, "." ) do
            
                local enabled = getEnabledValuesFromByteValue ( byte )
                local byteEnabled = {}
                
                for i,v in ipairs ( enabled ) do
                    byteEnabled[v] = true
                end
                
                for value,gui in pairs ( content[num] ) do
                    guiCheckBoxSetSelected ( gui, byteEnabled[value] or false )
                end
                
                num = num + 1
                
            end
            
        end
        
        
        
        return false
    end
    
    return false
end
addEvent ( "updateClientMenu", true )
addEventHandler ( "updateClientMenu", root, guiUpdateMenu )





function vehicleTextUpdater ( )
    local vehicleName = getVehicleName ( source )
    local saved = isVehicleSaved ( source )
    local t_vehicle = getText ( "vehicle" )
    local t_unsaved = getText ( "unsaved" )
    
    if saved then
        guiSetText ( heditGUI.specials.vehicleinfo, t_vehicle..": "..vehicleName )
        guiLabelSetColor ( heditGUI.specials.vehicleinfo, 255, 255, 255 )
        return true
    end
    
    guiSetText ( heditGUI.specials.vehicleinfo, t_vehicle..": "..vehicleName.." ("..t_unsaved..")" )
    guiLabelSetColor ( heditGUI.specials.vehicleinfo, 255, 0, 0 )
    return true
end
addEvent ( "updateVehicleText", true )
addEventHandler ( "updateVehicleText", root, vehicleTextUpdater )





function guiTemplateGetUtilButtonText ( util )
    return getText ( "utilbuttons", util )
end





function guiTemplateGetMenuButtonText ( menu )
    return getText ( "menubuttons", menu )
end





function guiTemplateGetItemText ( menu, item )
    local text = getText ( "menuinfo", menu, "itemtext", item )
    return text == "NO_TEXT" and "" or text
end





function getMenuShortName ( menu )
    return getText ( "menuinfo", menu, "shortname" )
end





function getMenuLongName ( menu )
    return getText ( "menuinfo", menu, "longname" )
end





function getMenuRedirect ( menu )
    if heditGUI.menuItems and heditGUI.menuItems[menu] and heditGUI.menuItems[menu].redirect then
        return heditGUI.menuItems[menu].redirect
    end
    
    return false
end





function destroyEditBox ( )
    if openedEditBox then
        guiResetStaticInfoText ( )
        guiSetVisible ( hiddenEditBox, true )
        destroyElement ( openedEditBox )
        openedEditBox = nil
    end
end