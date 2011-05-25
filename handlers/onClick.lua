--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/onClick.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Manage the button clicks
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function onClick ( b )
    if mButton[source] then
        playSoundFrontEnd ( 41 )
        showData ( mProperty[ mButton[source] ] )
    elseif logItem[source] then if cm == mProperty[9] then showData ( pm ) else showData ( mProperty[9] ) end
    elseif hButton[source] then
        if getKeyStateEx ( ) and b == "right" then return fixInput ( pVeh, guiGetText ( source ), hButton[source] ) end
        createHeditBox ( hedit[ hButton[source] ], iProperty[ hData[cm].h[ hButton[source] ] ], true )
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function createHeditBox ( box, text, bool )
    setInfoText ( text[3], text[4], true )
    showAllTheEdits ( )
    if bool == true then
        local x,y            = guiGetPosition ( box, false )
        local w,h            = guiGetSize     ( box, false )
        local boxtext        = "PROBLEM PAL?"
        if getKeyStateEx ( ) then
            boxtext          = buttonValue
        else boxtext         = guiGetText ( box ) end
        hidedHeditButton     = hButton[box]
        openedHandlingBox    = guiCreateEdit ( x, y, w, h, guiGetText ( box ), false, mainWnd.window )
        guiBringToFront      ( openedHandlingBox )
        guiEditSetCaretIndex ( openedHandlingBox, string.len ( guiGetText ( box ) ) )
        guiSetVisible        ( box, false )
    end
end
-------------------------------------------------------------------------------------------------------------------------
function showAllTheEdits()
    for i,v in ipairs(hedit) do if isElement(hedit[i]) then guiSetVisible(hedit[i],true) end end
    if isElement(openedHandlingBox) then destroyElement(openedHandlingBox) end
end