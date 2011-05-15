--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/onHover.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Handling the mouse-hover effects
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function onEnter ( )
    if uButton[source] and cu and uButton[source] ~= #utilButton then showUtilMenu ( dropList[source] )
    elseif uItem[source] then guiLabelSetColor ( source, 237, 134, 0 )
    elseif mButton[source] then setButtonEffect ( source, mInfo[ mButton[source] ] )
    elseif hButton[source] then
        isPointing = true
        pointedButton = source
        handleKeyState ( "down" )
    elseif hLabel[source] then
        guiLabelSetColor ( source, 255, 255, 128 )
        guiSetText ( mainWnd.info, sProperty[ hData[cm].h[ hLabel[source] ] ] )
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function onLeave ( )
    if not uItem[source] then
        guiSetText ( mainWnd.info, oldGuiText )
        if mButton[source] then guiSetAlpha ( source, 0.7 )
        elseif hButton[source] then 
            isPointing = false
            handleKeyState ( "up" )
        end
    end
    if getElementType ( source ) == "gui-label" then return guiLabelSetColor ( source, 255, 255, 255 ) end 
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function setButtonEffect ( button, txt )
    guiSetAlpha          ( button, 1 )
    playSoundFrontEnd    ( 42 )
    guiSetText           ( mainWnd.info, txt )
end
-------------------------------------------------------------------------------------------------------------------------
function handleKeyState ( str )
    if getKeyState ( "lctrl" ) or getKeyState ( "rctrl" ) then showValue ( "lctrl", str )
    elseif getKeyState ( "lshift" ) or getKeyState ( "rshift" ) then showValue ( "lshift", str )
    end
end