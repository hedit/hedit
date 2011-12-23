--[[
    local toggleEvents ( element window, bool toggle )
    
    startBuilding ( )
    
    destroyGUI ( )
    
    buildMainWindow ( template )
    buildUtilButtons ( template )
    buildMenuButtons ( template )
    buildMenus ( template )
    buildSpecials ( template )
    buildErrorMenu ( template )
    
    guiCreateElement ( string guiType, int posX, int posY, int sizeW, int sizeH, string text, int alpha, table hovercolor ) -- IN GUIFUNCTIONS.LUA
]]

local function toggleEvents ( window, bool )
    local func = removeEventHandler
    if bool then
        func = addEventHandler
    end
    
    func ( "onClientGUIClick",  window, onClick )
    func ( "onClientGUIDoubleClick",  window, onDoubleClick )
    func ( "onClientMouseEnter", window, onEnter )
    func ( "onClientMouseLeave", window, onLeave )
    func ( "onClientGUIFocus", window, onFocus )
    func ( "onClientGUIBlur", window, onBlur )
    func ( "onClientGUIAccepted", window, onEditBoxAccept )
    func ( "onClientGUIComboBoxAccepted", window, onComboBoxAccept )
    
    return true
end





function startBuilding ( )
    if DEBUGMODE then
        outputDebugString ( "Building the gui.." )
    end
    
    if heditGUI.window then
        destroyGUI ( )
    end
    
    local template = getUserTemplate ( )
    
    if not template then
        if DEBUGMODE then
        end

        return false
    end

    local window = buildMainWindow ( template )
    buildUtilButtons ( template )
    buildMenuButtons ( template )
    buildMenus ( template )
    buildSpecials ( template )
    
    guiSetVisible ( window, false )
    
    toggleEvents ( window, true )
    
    forceVehicleChange ( )

    checkTheUpdates ( ) -- We check the updates after the gui has been build, because like this the updates will get listed upon a setting change too.
    
    bindKey ( getUserConfig ( "usedKey" ), "down", toggleEditor )
    addCommandHandler ( getUserConfig ( "usedCommand" ), toggleEditor )
    
    return true
end





function destroyGUI ( )
    toggleEvents ( heditGUI.window, false )
    
    if heditGUI.window then
        destroyElement ( heditGUI.window )
    end
    
    unbindKey ( "lctrl", "both", showOriginalValue )
    unbindKey ( "rctrl", "both", showOriginalValue )
    unbindKey ( "lshift", "both", showPreviousValue )
    unbindKey ( "rshift", "both", showPreviousValue )
    
    guiElements = {}
    heditGUI = resetGUI
end





function buildMainWindow ( template )
    local wnd = template.window
    heditGUI.window = guiCreateElement ( wnd.type, wnd.pos[1], wnd.pos[2], wnd.size[1], wnd.size[2], getText ( "windowHeader" ), wnd.alpha, wnd.hovercolor )
    
    if wnd.centered then
        guiSetPosition ( heditGUI.window, (scrX/2)-(wnd.size[1]/2), (scrY/2)-(wnd.size[2]/2), false )
    end
    
    guiWindowSetSizable ( heditGUI.window, wnd.sizable or false )
    guiWindowSetMovable ( heditGUI.window, wnd.movable or false )
    
    guiElements[heditGUI.window] = { "window", "window", "none", 1, wnd.events }
    
    for layer,gui in ipairs ( wnd.extraItems ) do
        local element = guiCreateElement ( gui.type, gui.pos[1], gui.pos[2], gui.size[1], gui.size[2], "", gui.alpha, gui.hovercolor )
        guiSetEnabled ( element, false )
        
        table.insert ( heditGUI.background, element )
        guiElements[element] = { "window", "background", "none", layer, gui.events }
    end
    
    return heditGUI.window
end





function buildUtilButtons ( template )
    for util,gui in pairs ( template.utilbuttons ) do
        local utilButton = guiCreateElement ( gui.type, gui.pos[1], gui.pos[2], gui.size[1], gui.size[2], guiTemplateGetUtilButtonText ( util ), gui.alpha, gui.hovercolor )
        
        guiElements[utilButton] = { "utilButton", "button", "none", util, gui.events }
        table.insert ( heditGUI.utilButtons, element )
        
        local buttons = {}
        
        if type ( gui.items ) == "table" then
            local longestName = 100
            
            for item,menu in ipairs ( gui.items ) do
            
                local posY = ( gui.pos[2] + 7 ) + ( 20 * item )
                local itemButton = guiCreateElement ( "button", gui.pos[1], posY, 100, 20, getMenuShortName ( menu ) )
                
                local textextent = guiCreateElement ( "label", gui.pos[1], posY, 100, 20, getMenuShortName ( menu ) )
                local extent = guiLabelGetTextExtent ( textextent )
                
                if extent > longestName then
                    longestName = extent
                end
                
                destroyElement ( textextent )
                
                guiSetVisible ( itemButton, false )
                
                guiElements[itemButton] = { "utilItem", "button", "none", menu, gui.events }
                table.insert ( buttons, itemButton )
                
            end
            
            for i,v in ipairs ( buttons ) do
                guiSetSize ( v, longestName + 10, 20, false )
            end
        end
        
        heditGUI.utilItems[util] = buttons
    end
end





function buildMenuButtons ( template )
    for menu,gui in pairs ( template.menubuttons ) do
        local element = guiCreateElement ( gui.type, gui.pos[1], gui.pos[2], gui.size[1], gui.size[2], guiTemplateGetMenuButtonText ( menu ), gui.alpha, gui.hovercolor )
        
        guiElements[element] = { "menuButton", "button", "none", menu, gui.events }
        table.insert ( heditGUI.menuButtons, element )
    end
end





function buildMenus ( template )
    local function scanSpecialMenu ( menu, itemName, gui )
        local res = {}
        for k,v in pairs ( gui ) do
            if type ( v ) == "table" then
                if not v.type then
                    res[k] = scanSpecialMenu ( menu, k, v )
                else
                    local text = guiTemplateGetItemText ( menu, k )
                
                    local element = guiCreateElement ( v.type, v.pos[1], v.pos[2], v.size[1], v.size[2], text, v.alpha, v.hovercolor )
                    
                    if type ( v.runfunction ) == "function" then
                        v.runfunction ( element )
                    end
                    
                    res[k] = element
                    guiElements[element] = { "menuItem", "special", "none", k, v.events }

                    --[[if v.children then
                        --for name,child in pairs ( v.children ) do
                            res = scanSpecialMenu ( menu, k, v.children )
                        --end
                    end]]
                end
            end
        end
        
        return res
    end
    
    for menu,v in pairs ( template.menucontents ) do
        if v.redirect ~= "THIS_IS_ONE" then
            local items = {}
            
            
            
            if v.redirect == "handlingconfig" then
                -------------------------
                -- HANDLINGCONFIG MENU
                -------------------------
                
                local guiInfo = template.menucontents.redirect_handlingconfig.content
                
                for i,property in ipairs ( v.content ) do
                    
                    if isHandlingPropertyValid ( property ) then
                    
                        local propertyName = getHandlingPropertyFriendlyName ( property )
                        local propertyName = getHandlingPropertyFriendlyName ( property )
                        local labelInfo = guiInfo.labels[i]
                        local label = guiCreateElement ( labelInfo.type, labelInfo.pos[1], labelInfo.pos[2], labelInfo.size[1], labelInfo.size[2], propertyName, labelInfo.alpha, labelInfo.hovercolor )
                        local commode = getUserConfig ( "commode" )
                        
                        
                        
                        local configInfo = guiInfo.buttons[i]
                        
                        if property == "centerOfMass" then
                        
                            local labelPosX = guiGetPosition ( label, false )
                            local labelWidth = guiLabelGetTextExtent ( label )
                            
                            guiSetSize ( label, labelWidth + 5, labelInfo.size[2], false )
                            
                            local labelX = guiCreateElement ( labelInfo.type, labelPosX + labelWidth + 20, labelInfo.pos[2], 15, 20, "X", labelInfo.alpha, labelInfo.hovercolor )
                            local labelY = guiCreateElement ( labelInfo.type, labelPosX + labelWidth + 35, labelInfo.pos[2], 15, 20, "Y", labelInfo.alpha, labelInfo.hovercolor )
                            local labelZ = guiCreateElement ( labelInfo.type, labelPosX + labelWidth + 50, labelInfo.pos[2], 15, 20, "Z", labelInfo.alpha, labelInfo.hovercolor )
                            
                            table.insert ( items, labelX )
                            table.insert ( items, labelY )
                            table.insert ( items, labelZ )
                            
                            guiElements[labelX] = { "menuItem", "infolabel", "centerOfMassX", i, labelInfo.events }
                            guiElements[labelY] = { "menuItem", "infolabel", "centerOfMassY", i, labelInfo.events }
                            guiElements[labelZ] = { "menuItem", "infolabel", "centerOfMassZ", i, labelInfo.events }
                            
                            if getUserConfig ( "commode" ) == "splitted" then
                            
                                local buttonPosX = configInfo.pos[1]
                                local buttonWidth = math.round ( configInfo.size[1] / 3, 0 )
                                
                                local buttonX = guiCreateElement ( "button", buttonPosX,                       configInfo.pos[2], buttonWidth, configInfo.size[2], "", configInfo.alpha, configInfo.hovercolor )
                                local buttonY = guiCreateElement ( "button", buttonPosX + buttonWidth,         configInfo.pos[2], buttonWidth, configInfo.size[2], "", configInfo.alpha, configInfo.hovercolor )
                                local buttonZ = guiCreateElement ( "button", buttonPosX + ( buttonWidth * 2 ), configInfo.pos[2], buttonWidth, configInfo.size[2], "", configInfo.alpha, configInfo.hovercolor )
                                
                                guiSetFont ( buttonX, "default-small" )
                                guiSetFont ( buttonY, "default-small" )
                                guiSetFont ( buttonZ, "default-small" )
                                
                                table.insert ( items, buttonX )
                                table.insert ( items, buttonY )
                                table.insert ( items, buttonZ )
                                
                                guiElements[buttonX] = { "menuItem", "config", "centerOfMassX", i, configInfo.events }
                                guiElements[buttonY] = { "menuItem", "config", "centerOfMassY", i, configInfo.events }
                                guiElements[buttonZ] = { "menuItem", "config", "centerOfMassZ", i, configInfo.events }
                                
                            else
                                
                                local button = guiCreateElement ( "button", configInfo.pos[1], configInfo.pos[2], configInfo.size[1], configInfo.size[2], "", configInfo.alpha, configInfo.hovercolor )
                                table.insert ( items, button )
                                guiElements[button] = { "menuItem", "config", "centerOfMass", i, configInfo.events }
                                
                            end
                            
                        else
                        
                            -- If a table, return table. Otherwise, false.
                            local propertyOptions = type ( handlingLimits[property].options ) == "table" and handlingLimits[property].options or false
                            
                            -- If propertyOptions is not false, return the combobox as type. Otherwise a button.
                            local buttonType = propertyOptions and "combobox" or "button"
                            
                            --If propertyOptions is not false, return a size needed for the height. Otherwise, the normal button size.
                            local buttonHeight = propertyOptions and ( #propertyOptions * 20 ) + 20 or configInfo.size[2]
                            
                            -- Create it with no text
                            local button = guiCreateElement ( buttonType, configInfo.pos[1], configInfo.pos[2], configInfo.size[1], buttonHeight, "", configInfo.alpha, configInfo.hovercolor )
                            
                            
                            
                            -- If we had a combobox with options
                            if propertyOptions then
                                for num,option in ipairs ( propertyOptions ) do
                                    guiComboBoxAddItem ( button, getHandlingPropertyOptionName ( property, option ) )
                                end
                            end
                            
                            table.insert ( items, button )
                            guiElements[button] = { "menuItem", "config", property, i, configInfo.events }
                            
                        end
                        
                        table.insert ( items, label )
                        guiElements[label] = { "menuItem", "infolabel", property, i, labelInfo.events }
                        
                    else
                        outputDebugString ( "Invalid property used for handling menu "..menu..": "..tostring(property) )
                    end
                end
                
                
                
                
                
            elseif v.redirect == "handlingflags" then
                -------------------------
                -- HANDLINGFLAG MENU
                -------------------------
                
                local property = v.content[1]
                
                if isHandlingPropertyHexadecimal ( property ) then
                    
                    local guiInfo = template.menucontents.redirect_handlingflags.content
                    
                    -- Make sure we have extras as it's optional
                    if type ( guiInfo.extras ) == "table" then
                        items.extra = {}
                        for i,gui in ipairs ( guiInfo.extras ) do
                            local element = guiCreateElement ( gui.type, gui.pos[1], gui.pos[2], gui.size[1], gui.size[2], tostring(gui.text), gui.alpha, gui.hovercolor )
                            
                            table.insert ( items.extra, element )
                            guiElements[element] = { "menuItem", "extra", property, i, gui.events }
                        end
                    end
                    
                    for byte,tab in ipairs ( guiInfo.checkboxes ) do
                        items[byte] = {}
                        for value,gui in pairs ( tab ) do
                            local byteName = getHandlingPropertyByteName ( property, byte, value )
                            local element = guiCreateElement ( gui.type, gui.pos[1], gui.pos[2], gui.size[1], gui.size[2], byteName, gui.alpha, gui.hovercolor )
                            
                            items[byte][value] = element
                            guiElements[element] = { "menuItem", "infolabel", property, { byte=byte, value=value }, gui.events }
                        end
                    end
                
                else
                
                    outputDebugString ( "Menu "..menu.." does not have a valid handling/model-flag property!" )
                    outputDebugString ( "Please change the first parameter of this menu to \"modelFlags\" or \"handlingFlags\"!" )
                    
                end
                
                
                
                
                
            else
                -------------------------
                -- SPECIAL MENU
                -------------------------
                
                items = scanSpecialMenu ( menu, "", v.content )
                
                if type ( v.runfunction ) == "function" then
                    v.runfunction ( items )
                end
                
                
                
                
            end
            
            
            
            heditGUI.menuItems[menu] = {
                redirect = v.redirect,
                requireLogin = v.requirelogin,
                requireAdmin = v.requireadmin,
                disabled = v.disable,
                onOpen = v.onOpen,
                onClose = v.onClose,
                guiItems = items
            }
            
            toggleMenuItemsVisibility ( menu, false )
        end
    end
end





function buildSpecials ( template )
    local function create ( gui, parent )
        local element = guiCreateElement ( gui.type, gui.pos[1], gui.pos[2], gui.size[1], gui.size[2], "", gui.alpha, gui.hovercolor )
        
        if type ( gui.runfunction ) == "function" then
            gui.runfunction ( element )
        end
        
        if DEBUGMODE then
            --outputDebugString ( "Created special element of "..parent )
        end
        
        return element
    end
    
    
    
    for parent,v in pairs ( template.specials ) do
        
        local items = {}
        
        if not isValidGUI ( v ) then
            
            for sub,item in pairs ( v ) do
                
                if not isValidGUI ( item ) then -- MiniLog only! We won't go deeper!
                
                    items[sub] = {}
                
                    for logsub,logitem in pairs ( item ) do
                        
                        if isValidGUI ( logitem ) then
                            items[sub][logsub] = create ( logitem, parent )
                            guiElements[ items[sub][logsub] ] = { "special", "special", "none", parent, logitem.events }
                        end
                        
                    end
                    
                else
                
                    items[sub] = create ( item, parent )
                    guiElements[ items[sub] ] = { "special", "special", "none", parent, v.events }
                    
                end
                
            end
            
        else
            
            items = create ( v, parent )
            guiElements[items] = { "special", "special", "none", parent, v.events }
            
        end
        
        heditGUI.specials[parent] = items
    end
end