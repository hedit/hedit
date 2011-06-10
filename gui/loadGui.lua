--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          gui/loadGui.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating and verifying the gui and adding keybinds
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

function loadTheTranslation ( )
    loadVariables ( )
    if loadTranslation[ setting["language"] ] then
        loadTranslation[ setting["language"] ]()
        if isTranslationValid ( ) then
            loadTheTemplate ( )
        else
            faultTranslation ( "HANDLING EDITOR: Incorrect/corrupted translation.["..setting["language"].."] Loading english instead." )
        end
    else
        faultTranslation ( "HANDLING EDITOR: No such translation with name "..setting["language"].."." )
    end
end
-------------------------------------------------------------------------------------------------------------------------
function loadTheTemplate ( )
    if loadTemplate[ setting["template"] ] then
        loadTemplate[ setting["template"] ]()
        if isTemplateValid ( ) then
            enableTemplate ( )
        else
            faultTemplate ( text.invalidTemplate, setting["template"] )
        end
    else
        faultTemplate ( text.incorrectTemplate, setting["template"] )
    end
end
addEventHandler ( "onClientResourceStart", resourceRoot, loadTheTranslation )
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function enableTemplate ( )
    loadXmlFiles        ( )
    loadErrorPage       ( )
    ---------------------------------------------------------------------------------------------------------------------
    for i,v in ipairs ( hProperty ) do
        if minLimit[v] and maxLimit[v] then
            iProperty[v][3] = iProperty[v][3]..": "..minLimit[v].." - "..maxLimit[v]
        end
    end
    ---------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( defHedit ) do guiSetVisible ( v, false ) end
    ---------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( menuButton ) do
        if mProperty[k] then mButton[v] = k 
        else guiSetEnabled ( v, false ) end
        guiSetAlpha ( v, 0.7 )
    end
    ---------------------------------------------------------------------------------------------------------------------
    for i,c in pairs ( menuContent ) do for k,v in pairs ( c ) do
        guiSetVisible ( v, false )
        if subItemHandler[i] then sItem[v] = i
        else guiSetEnabled ( v, false ) end
    end end
    ---------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( utilButton ) do
        uButton[v] = k
        if utilButtonText[k] then guiSetText ( v, utilButtonText[k] ) end
    end
    ---------------------------------------------------------------------------------------------------------------------
    for i,c in pairs ( utilContent ) do for k,v in pairs ( c ) do
        guiSetProperty ( v, "HoverTextColour", "FFFF8000" )
        guiSetVisible ( v, false )
        if menuContent[k] then uItem[v] = k
        else uItem[v] = "corruptedlink" end
        if utilItemText[k] then guiSetText ( v, utilItemText[k] ) end
    end end
    ---------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( label )   do hLabel[v]  = k end
    for k,v in ipairs ( logText ) do logItem[v] = k end
    ---------------------------------------------------------------------------------------------------------------------
    guiSetText        ( mainWnd.window, text.header )
      -------------------------------------------------------------------------------------------------------------------
    loadSavesIntoGrid ( menuContent["saveclient"].grid )
    loadSavesIntoGrid ( menuContent["loadclient"].grid )
    ---------------------------------------------------------------------------------------------------------------------
    guiSetInputMode   ( "no_binds_when_editing" )
    ---------------------------------------------------------------------------------------------------------------------
    addEventHandler   ( "onClientMouseEnter",             mainWnd.window, onEnter )
    addEventHandler   ( "onClientMouseLeave",             mainWnd.window, onLeave )
    addEventHandler   ( "onClientGUIClick",               mainWnd.window, onClick )
    addEventHandler   ( "onClientGUIAccepted",            mainWnd.window, onEditBoxAccept )
    addEventHandler   ( "onClientGUIComboBoxAccepted",    mainWnd.window, onComboBoxAccept )
    ---------------------------------------------------------------------------------------------------------------------
    bindKey           ( "mouse_wheel_up",   "up",   onScroll, "up"   )
    bindKey           ( "mouse_wheel_down", "up",   onScroll, "down" )
    bindKey           ( "delete",           "down", tryDelete        )
    bindKey           ( setting["usedKey"], "down", toggleEditor     )
    addCommandHandler ( setting["usedCommand"],     toggleEditor     )
    ---------------------------------------------------------------------------------------------------------------------
    toggleEditor      ( )
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function toggleEditor (  )
    if guiGetVisible ( mainWnd.window ) then
        removeEventHandler ( "onClientRender", root, onRenderCheck )
        unbindKey ( "lctrl",  "both", showValue )
        unbindKey ( "rctrl",  "both", showValue )
        unbindKey ( "lshift", "both", showValue )
        unbindKey ( "rshift", "both", showValue )
        guiSetVisible ( mainWnd.window, false )
        showCursor ( false, false )
        isPointing = false
        pointedButton = nil
        if um then
            for k,v in pairs ( utilContent[um] ) do guiSetVisible ( v, false ) end
            um = nil
        end
        if isElement ( warningWnd ) then guiSetVisible ( warningWnd, false ) end
    else
        local cVeh = getPedOccupiedVehicle ( localPlayer )
        if cVeh then
            if getVehicleController ( cVeh ) ~= localPlayer and setting["allowPassengersToEdit"] == false then
                return outputChatBox ( text.restrictedPassenger ) end
            if cVeh ~= pVeh then
                if isElement ( vehLog[pVeh] ) then guiSetVisible ( vehLog[pVeh], false ) end
                if isElement ( warningWnd ) then
                    destroyElement ( warningWnd )
                    guiSetEnabled ( mainWnd.window, true )
                end
                pVeh = cVeh
                showData ( mProperty[1] )
                if not vehLog[pVeh] then
                    for i,v in ipairs ( logTime ) do
                        guiSetText ( logTime[i], "" )
                        guiSetText ( logText[i], "" )
                    end
                    logX, logY    = guiGetPosition      ( logPane, false )
                    logW, logH    = guiGetSize          ( logPane, false )
                    vehLog[pVeh]  = guiCreateScrollPane ( logX, logY, logW, logH, false, mainWnd.window )
                    guiSetVisible ( vehLog[pVeh], false )
                    logLine[pVeh] = 0
                else
                    local childs = getElementChildren ( vehLog[pVeh] )
                    for i,v in ipairs ( logTime ) do
                        local oldColor = logColor [ childs[#childs-(-1+i)] ]
                        if not oldColor then oldColor = {0,0,0} end
                        guiSetText       ( logTime[i], guiGetText ( childs[#childs-i] ) )
                        guiSetText       ( logText[i], guiGetText ( childs[#childs-(-1+i)] ) )
                        guiLabelSetColor ( logText[i], unpack ( oldColor ) )
                        logColor [ logText[i] ] = oldColor
                    end
                end
            else
                if isElement ( warningWnd ) then guiSetVisible ( warningWnd, true ) end
                updateData ( cm )
            end
            addEventHandler ( "onClientRender", root, onRenderCheck )
            bindKey ( "lctrl",  "both", showValue )
            bindKey ( "rctrl",  "both", showValue )
            bindKey ( "lshift", "both", showValue )
            bindKey ( "rshift", "both", showValue )
            guiSetVisible ( mainWnd.window, true )
            showCursor ( true, true )
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function showValue ( k, s )
    if s == "down" and pointedButton and isPointing then
      	if ( k == "lctrl" or k == "rctrl" ) and not ( getKeyState ( "lshift" ) or getKeyState ( "rshift" ) )  then 
            buttonValue = guiGetText ( pointedButton )
            local pVehID = getElementModel ( pVeh )
            local val = handlingToString ( defaultHandling[pVehID][hData[cm].h[ hButton[pointedButton] ] ] )
            guiSetText ( pointedButton, val )
            guiSetProperty ( pointedButton, "HoverTextColour", "FF68F000" )
        elseif ( k == "lshift" or k == "rshift" ) and not ( getKeyState ( "lctrl" ) or getKeyState ( "rctrl" ) )  then
            buttonValue = guiGetText ( pointedButton )
            guiSetText ( pointedButton, getElementData ( pVeh, "history."..hData[cm].h[ hButton[pointedButton] ] ) )
            guiSetProperty ( pointedButton, "HoverTextColour", "FFF0D400" )
        end
    else
        guiSetText ( pointedButton, buttonValue )
        guiSetProperty ( pointedButton, "HoverTextColour", "FFFFFFFF" )
        buttonValue = nil
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function onRenderCheck ( )
    local cVeh = getPedOccupiedVehicle ( localPlayer )
    if not cVeh then
        toggleEditor ( )
    else
        if cVeh ~= pVeh then
            toggleEditor ( )
            pVeh = cVeh
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function getKeyStateEx ( str )
	if str then
		if str == "ctrl" and ( getKeyState ( "lctrl" ) or getKeyState ( "rctrl" ) ) then
		elseif str == "shift" and ( getKeyState ( "lshift" ) or getKeyState ( "rshift" ) )then end
	elseif (
	    getKeyState ( "lctrl" )   or
        getKeyState ( "rctrl" )   or
        getKeyState ( "lshift" )  or
        getKeyState ( "rshift" )) then return true end
	return false
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function setInfoText ( header, text, bool )
    guiSetText ( mainWnd.infoHeader, header     )
    guiSetText ( mainWnd.infoText,   text or "" )
    if bool == true then
        oldInfoHeader = header
        oldInfoText   = text
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function resetInfoText ( bool )
    if bool == true then
        oldInfoHeader = ""
        oldInfoText   = ""
    end
    guiSetText ( mainWnd.infoHeader, oldInfoHeader )
    guiSetText ( mainWnd.infoText,   oldInfoText   )
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function loadErrorPage ( )
    mInfo[ mProperty[20] ]= "Missing buttonlink!"
    menuContent["corruptedlink"] = {
    }
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function guiCreateWarningMessage ( txt, level, one, two )
    if type(txt) == "string" and type(level) == "number" then
        warningWnd = guiCreateWindow ( (scrX/2)-200, (scrY/2)-67, 400, 134, wHeader[level], false )
        local lbl  = guiCreateLabel  ( 114, 25,  276, 57, txt,         false, warningWnd )
        local bt1  = guiCreateButton ( 114, 100, 136, 25, text.accept, false, warningWnd )
        local bt2  = guiCreateButton ( 255, 100, 136, 25, text.cancel, false, warningWnd )
        guiCreateButton ( 9, 25, 100,100, "lolwut", false, warningWnd )
        -- guiCreateImage ( 9, 25, 100, 100, wImg[level], false, warningWnd )
        guiLabelSetHorizontalAlign ( lbl, "left", true )
        guiSetEnabled ( mainWnd.window, false )
        guiBringToFront ( warningWnd )
        addEventHandler ( "onClientGUIClick", warningWnd,
            function ( )
                if source == bt1 or source == bt2 then
                    local args = {}
                    if source == bt1 and one and type(one[1]) == "function" then
                        for i=2,#one do args[i-1] = one[i] end
                        one[1] ( unpack ( args ) )
                    elseif source == bt2 and two and type(two[1]) == "function" then
                        for i=2,#two do args[i-1] = two[i] end
                        two[1] ( unpack ( args ) )
                    end
                    destroyElement ( warningWnd )
                    guiSetEnabled ( mainWnd.window, true )
                    guiBringToFront ( mainWnd.window )
                end
            end
        )
        return warningWnd, bt1, bt2
    else return false end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function destroyMenuChildren ( )
    oldGuiText = ""
    um         = nil
    ---------------------------------------------------------------------------------------------------------------------
    if isElement ( vehLog[pVeh] )      then guiSetVisible ( vehLog[pVeh], false ) end
    if isElement ( openedHandlingBox ) then destroyElement ( openedHandlingBox ) end
    ---------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( hedit ) do if isElement  ( v ) then destroyElement ( v ) end end
    for k,v in ipairs ( label ) do guiSetVisible ( v, false ) end
    ---------------------------------------------------------------------------------------------------------------------
    for i,c in pairs ( menuContent ) do for k,v in pairs ( c ) do guiSetVisible ( v, false ) end end
    for i,c in pairs ( utilContent ) do for k,v in pairs ( c ) do guiSetVisible ( v, false ) end end
end