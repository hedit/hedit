function onClick ( button )
    local parent = guiGetElementParent ( source )
    local event = guiGetElementEvents ( source )
    local info = guiGetElementInfo ( source )
    
    if button == "left" then
        
        if parent == "utilButton" then
            
            if info == "close" then
                toggleEditor ( )
            else
                guiToggleUtilityDropDown ( info )
            end
            
        elseif parent == "utilItem" then
            guiShowMenu ( info )
            
        elseif parent == "menuButton" then
            guiShowMenu ( info )
            
        elseif parent == "menuItem" then
            
            local inputType = guiGetElementInputType ( source )
            
            local property = guiGetElementProperty ( source )
            
            if property then
            
                if inputType == "config" then
                    
                    destroyEditBox ( )
                    
                    local x,y = guiGetPosition ( source, false )
                    local w,h = guiGetSize ( source, false )
                    local text = guiGetText ( source )
                    
                    guiSetVisible ( source, false )
                    
                    hiddenEditBox = source
                    openedEditBox = guiCreateEdit ( x, y, w, h, text, false, heditGUI.window )
                    
                    guiSetFont ( openedEditBox, guiGetFont ( source ) )
                    
                    guiBringToFront ( openedEditBox )
                    guiEditSetCaretIndex ( openedEditBox, string.len ( text ) )
                    
                    local min,max = getHandlingLimits ( property )
                    local propType = getHandlingPropertyValueType ( property ) .. ( min and ": " .. tostring ( min ) .. " - " .. tostring ( max ) or "" )
                    local propInfo = getHandlingPropertyValueInformation ( property )
                    
                    guiSetStaticInfoText ( propType, propInfo )
                    
                    
                    
                elseif inputType == "infolabel" and isHandlingPropertyHexadecimal ( property ) then
                    
                    if pVehicle then
                        
                        guiSetEnabled ( source, false ) -- Spam prevention, stop players to click the button till wierd stuff happens. Need a better spam protection.
                        setTimer ( guiSetEnabled, 500, 1, source, true )

                        local enabled = guiCheckBoxGetSelected ( source )
                        local config = getVehicleHandling ( pVehicle )[property]
                        local reversedHex = string.reverse ( config )..string.rep ( "0", 8 - string.len ( config ) )
                        local byte = 1
                        local str = ""
                        
                        for value in string.gmatch ( reversedHex, "." ) do
                            
                            if byte == info.byte then

                                local curValue = tonumber ( "0x"..value )
                                local addValue = tonumber ( info.value )
                                local calc

                                if enabled then
                                    calc = curValue + addValue
                                else
                                    calc = curValue - addValue
                                end

                                if calc < 0 then
                                    calc = 0
                                end
                                
                                local newValue = string.format ( "%X", calc )

                                value = newValue

                            end
                            
                            str = str..value
                            byte = byte + 1
                        end
                        
                        setVehicleHandling ( pVehicle, property, string.reverse ( str ) )

                        
                        
                    else
                        
                        -- No vehicle
                        
                    end
                    
                end
                
            end
            
        end
        
    elseif button == "right" then
        
        if pressedKey then -- Check whether CTRL or SHIFT is valid pressed with a right-mouse-click
            
            local property = guiGetElementProperty ( source )
            local value = guiGetText ( pointedButton )
            prepareHandlingValue ( pVehicle, property, value )
            
        end
        
    end
    
    if parent ~= "utilButton" then
        guiToggleUtilityDropDown ( currentUtil )
    end
    
    if event and event.onClick then
        event.onClick ( source, button )
    end
    
    return true
end





function onDoubleClick ( )
    local event = guiGetElementEvents ( source )

    if event and event.onDoubleClick then
        event.onDoubleClick ( source, button )
    end
    
    return true
end





function onEnter ( )
    local parent = guiGetElementParent ( source )
    local event = guiGetElementEvents ( source )
    local inputType = guiGetElementInputType ( source )
    local elementInfo = guiGetElementInfo ( source )
    
    if parent == "utilButton" and currentUtil then
        local util = guiGetElementInfo ( source )
        
        if util ~= "close" and util ~= currentUtil then
            guiToggleUtilityDropDown ( util )
        end
        
    elseif parent == "menuButton" or parent == "utilItem" then
    
        guiSetInfoText ( getMenuLongName ( elementInfo ), "" )
    
    elseif parent == "menuItem" then
        
        if inputType == "infolabel" then
        
            local property,name,info = guiGetElementProperty ( source ),nil,nil
            
            if isHandlingPropertyHexadecimal ( property ) then
                local byte, value = elementInfo.byte, elementInfo.value
                name = getHandlingPropertyByteName ( property, byte, value )
                info = getHandlingPropertyByteInformation ( property, byte, value )
            else
                name = getHandlingPropertyFriendlyName ( property )
                info = getHandlingPropertyInformationText ( property )
            end
            
            guiSetInfoText ( name, info )
            
        elseif inputType == "config" then
            
            setPointedElement ( source, true )
            guiSetInfoText ( getText ( "clickToEdit" ), getText ( "enterToSubmit" ) )
            
        elseif inputType == "special" then
            
            
            
        end
        
    elseif parent == "special" then
        
        if elementInfo == "minilog" and guiGetText ( source ) ~= "" then
            
            guiSetInfoText ( getText ( "clickToViewFullLog" ), "" )
            
        end
        
    end
    
    
    
    if event and event.onEnter then
        event.onEnter ( source )
    end
    
    return true
end





function onLeave ( )
    local parent = guiGetElementParent ( source )
    local event = guiGetElementEvents ( source )
    
    setPointedElement ( source, false )
    
    guiResetInfoText ( )
    
    if event and event.onLeave then
        event.onLeave ( source )
    end
    
    return true
end





function onFocus ( )
    local parent = guiGetElementParent ( source )
    local event = guiGetElementEvents ( source )
    
    
    
    if event and event.onFocus then
        event.onFocus ( source )
    end
    
    return true
end





function onBlur ( )
    local parent = guiGetElementParent ( source )
    local event = guiGetElementEvents ( source )
    
    
    
    if event and event.onBlur then
        event.onBlur ( source )
    end
    
    return true
end





function onEditBoxAccept ( box )
    local parent = guiGetElementParent ( source )
    local event = guiGetElementEvents ( box )
    
    
    
    if box == openedEditBox then
        
        if isElement ( pVehicle ) then
        
            local content = guiGetText ( box )
            
            destroyEditBox ( )
            
            local property = guiGetElementProperty ( hiddenEditBox )
            
            prepareHandlingValue ( pVehicle, property, content )
        
        else
            
            -- when not vehicle
            
        end
        
    end
    
    if event and event.onEditBoxAccept then
        event.onEditBoxAccept ( box )
    end
    
    return true
end





function onComboBoxAccept ( )
    local parent = guiGetElementParent ( source )
    local event = guiGetElementEvents ( source )
    local property = guiGetElementProperty ( source )
    
    
    if parent == "menuItem" and property then
        
        if pVehicle then
        
            local selected = guiComboBoxGetSelected ( source )
            
            if selected > -1 then
            
                local text = guiComboBoxGetItemText ( source, selected )
                local value = nil
                if handlingLimits[property] and handlingLimits[property].options then
                    value = handlingLimits[property].options[selected+1]
                end
                
                prepareHandlingValue ( pVehicle, property, value )
                
            end
        
        end
        
    end
    
    if event and event.onComboBoxAccept then
        event.onComboBoxAccept ( source )
    end
    
    return true
end