--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/onHover.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Handling the mouse-hover effects
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

function onEnter ( )
    if mButton[source] then setButtonEffect ( source, mInfo[ mProperty [ mButton[source] ] ] )
    elseif hButton[source] then
        isPointing       = true
        pointedButton    = source
        handleKeyState   ( "down" )
    elseif hLabel[source] then
        setInfoText ( iProperty[ hData[cm].h[ hLabel[source] ] ][1],
                      iProperty[ hData[cm].h[ hLabel[source] ] ][2] )
        guiLabelSetColor ( source, 255, 255, 128 )
    elseif hexBox[source] then
        setInfoText ( iProperty[ hData[cm].h[1] ][ hexBox[source][1] ][ hexBox[source][2] ][1],
                      iProperty[ hData[cm].h[1] ][ hexBox[source][1] ][ hexBox[source][2] ][2] )
    elseif uButton[source] and um and um ~= source and utilContent[source] then
        for k,v in pairs ( utilContent[um] )     do guiSetVisible ( v, false ) end
        for k,v in pairs ( utilContent[source] ) do
            guiSetVisible ( v, true )
            guiBringToFront ( v )
        end
        um = source
    elseif uItem[source] then
        setInfoText ( guiGetText ( source ), mInfo[ mProperty[ uItem[source] ] ] )
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function onLeave ( )
    resetInfoText ( )
    if mButton[source] then guiSetAlpha ( source, 0.7 )
    elseif hButton[source] then 
        isPointing = false
        handleKeyState ( "up" )
    elseif hLabel[source] then guiLabelSetColor ( source, 255, 255, 255 )
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function setButtonEffect ( button, txt )
    guiSetAlpha          ( button, 1 )
    playSoundFrontEnd    ( 42 )
    setInfoText          ( txt )
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function handleKeyState ( str )
    if getKeyState ( "lctrl" ) or getKeyState ( "rctrl" ) then showValue ( "lctrl", str )
    elseif getKeyState ( "lshift" ) or getKeyState ( "rshift" ) then showValue ( "lshift", str )
    end
end