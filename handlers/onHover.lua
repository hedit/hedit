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
        guiLabelSetColor ( source, 255, 255, 128 )
        setInfoText ( iProperty[ hData[cm].h[ hLabel[source] ] ][1],
                      iProperty[ hData[cm].h[ hLabel[source] ] ][2] )
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
    end
    if hLabel[source] then return guiLabelSetColor ( source, 255, 255, 255 ) end 
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
function handleKeyState ( str )
    if getKeyState ( "lctrl" ) or getKeyState ( "rctrl" ) then showValue ( "lctrl", str )
    elseif getKeyState ( "lshift" ) or getKeyState ( "rshift" ) then showValue ( "lshift", str )
    end
end