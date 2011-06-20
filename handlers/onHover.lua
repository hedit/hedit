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
    if mButton[source] then
        setButtonEffect ( source, mInfo[ mProperty [ mButton[source] ] ] )
    elseif hButton[source] then
        setPointing ( source, true )
    elseif hLabel[source] then
        setInfoText ( iProperty[ hData[cm].h[ hLabel[source] ] ][1],
                      iProperty[ hData[cm].h[ hLabel[source] ] ][2] )
        guiLabelSetColor ( source, 255, 255, 128 )
    elseif hexBox[source] then
        setInfoText ( iProperty[ hData[cm].h[1] ][ hexBox[source][1] ][ hexBox[source][2] ][1],
                      iProperty[ hData[cm].h[1] ][ hexBox[source][1] ][ hexBox[source][2] ][2] )
    elseif uButton[source] and utilContent[source] and um and um ~= source then
        toggleUtilMenu ( source, true )
    elseif uItem[source] then
        setInfoText ( guiGetText ( source ), mInfo[ mProperty[ uItem[source] ] ] )
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function onLeave ( )
    resetInfoText ( )
    if     mButton[source] then guiSetAlpha      ( source, 0.7 )
    elseif hButton[source] then setPointing      ( src, false )
    elseif hLabel[source]  then guiLabelSetColor ( source, 255, 255, 255 )
    end
end