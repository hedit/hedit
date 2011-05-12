--|| ***************************************************************************************************************** [[
--|| PROJECT:        MTA Ingame Handling Editor
--|| FILE:            gui/loadGui.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:        Creating and verifying the gui and adding keybinds
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function loadTheGui ( )
    if loadTranslation[usedTranslation] then
        loadTranslation[usedTranslation]()
        if isTranslationValid ( ) then
            if loadTemplate[usedTemplate] then
                loadTemplate[usedTemplate]()
                if isTemplateValid ( ) then
                    enableTemplate ( )
                else
                    faultTemplate ( text.invalidTemplate )
                end
            else
                faultTemplate ( text.incorrectTemplate )
            end
        else
            faultTranslation ( "HANDLING EDITOR: Incorrect/corrupted translation. Loading english instead." )
        end
    else
        faultTranslation ( "HANDLING EDITOR: No such translation with that name." )
    end
end
addEventHandler ( "onClientResourceStart", resourceRoot, loadTheGui )
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function enableTemplate ( )
    --------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( defHedit ) do guiSetVisible ( defHedit[k], false ) end
    --------------------------------------------------------------------------------------------------------------------
    --[[for k,v in ipairs ( utilButton ) do
        uMenu[ utilButton[k] ] = k
        guiSetText ( utilButton[k], uItemText[ uProperty[k] ] )
    end]]
    --------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( menuButton ) do
        mButton[ menuButton[k] ] = k
        guiSetAlpha ( menuButton[k], 0.7 )
    end
    --------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( label ) do
        hLabel[ label[k] ] = k
    end
    --------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( hProperty ) do
        sProperty[v] = iProperty[v][1].."\n"..iProperty[v][2]
    end
    --------------------------------------------------------------------------------------------------------------------
    guiSetText      ( mainWnd.window, HEDIT_VERSION )
    --------------------------------------------------------------------------------------------------------------------
    guiSetVisible   ( mainWnd.window,   false )
    guiSetVisible   ( logWnd.window,    false )
    guiSetInputMode ( "no_binds_when_editing" )
    --------------------------------------------------------------------------------------------------------------------
    addEventHandler ( "onClientMouseEnter",             mainWnd.window, onEnter )
    addEventHandler ( "onClientMouseLeave",             mainWnd.window, onLeave )
    addEventHandler ( "onClientGUIClick",               mainWnd.window, onClick )
    addEventHandler ( "onClientGUIAccepted",            mainWnd.window, onEditBoxAccept )
    addEventHandler ( "onClientGUIComboBoxAccepted",    mainWnd.window, onComboBoxAccept )
    --------------------------------------------------------------------------------------------------------------------
    bindKey ( usedKey, "down", toggleEditor )
    addCommandHandler ( usedCommand, toggleEditor )
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
        guiSetVisible ( logWnd.window, false )
        showCursor ( false, false )
        isPointing = false
        pointedButton = nil
        hideUtilMenu ( )
    else
        if not isElement ( popupWnd ) then
            local veh = getPedOccupiedVehicle ( localPlayer )
            if veh then
                if getVehicleController ( veh ) ~= localPlayer and allowPassengersToEdit == false then
                    return outputChatBox ( text.restrictedPassenger ) end
                addEventHandler ( "onClientRender", root, onRenderCheck )
                bindKey ( "lctrl",  "both", showValue )
                bindKey ( "rctrl",  "both", showValue )
                bindKey ( "lshift", "both", showValue )
                bindKey ( "rshift", "both", showValue )
                guiSetVisible ( mainWnd.window, true )
                guiSetVisible ( logWnd.window, true )
                showCursor ( true, true )
                updateHandlingData ( )
            end
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
            local vehID = getElementModel ( getPedOccupiedVehicle ( localPlayer ) )
            local val = "NAH NOT YET"
            -- local val = hDefault[vehID][ hData[cm].h[ hButton[pointedButton] ] ] -- TODO
	        guiSetText ( pointedButton, val )
	        guiSetProperty ( pointedButton, "HoverTextColour", "FF68F000" )
        elseif ( k == "lshift" or k == "rshift" ) and not ( getKeyState ( "lctrl" ) or getKeyState ( "rctrl" ) )  then
			buttonValue = guiGetText ( pointedButton )
            guiSetText ( pointedButton, history[ hData[cm].h[ hButton[pointedButton] ] ] )
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
        if cVeh ~= lVeh then
            updateData ( cm )
            lVeh = cVeh
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function destroyMenuChildren ( )
    oldGuiText = ""
    if isElement ( openedHandlingBox ) then destroyElement ( openedHandlingBox ) end
    for k,v in ipairs ( hedit ) do if isElement ( hedit[k] ) then destroyElement ( hedit[k] ) end end
    for k,v in ipairs ( label ) do guiSetVisible ( label[k], false ) end
end