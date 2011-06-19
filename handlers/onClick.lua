--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/onClick.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Manage the button clicks
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

function onClick ( b )
    if mButton[source] then
        playSoundFrontEnd ( 41 )
        showData ( mProperty[ mButton[source] ] )
    elseif logItem[source] then if cm == mProperty[9] then showData ( pm ) else showData ( mProperty[9] ) end
    elseif hButton[source] then
        if getKeyStateEx ( ) and b == "right" then return fixInput ( pVeh, guiGetText ( source ), hButton[source] ) end
        createHeditBox ( hedit[ hButton[source] ], iProperty[ hData[cm].h[ hButton[source] ] ], true )
    elseif hexBox[source] then
        if guiCheckBoxGetSelected ( source ) then
            if not hexValue[ hexBox[source][1] ] then hexValue[ hexBox[source][1] ] = 0 end
            hexValue[ hexBox[source][1] ] = toHex ( tonumber ( "0x"..hexValue[ hexBox[source][1] ] ) + tonumber ( hexBox[source][2] ) )
        else
            hexValue[ hexBox[source][1] ] = toHex ( tonumber ( "0x"..hexValue[ hexBox[source][1] ] ) - tonumber ( hexBox[source][2] ) )
        end
        fixInput ( pVeh, string.reverse ( table.concat ( hexValue, "" ) ), 1, hexBox[source][1], hexBox[source][2] )
    elseif uButton[source] then
        if source == utilButton[#utilButton] then toggleEditor ( )
        else
            if um == source then
                um = nil
                for k,v in pairs ( utilContent[source] ) do guiSetVisible ( v, false ) end
            elseif utilContent[source] then
                um = source
                for k,v in pairs ( utilContent[source] ) do
                    guiSetVisible ( v, true )
                    guiBringToFront ( v )
                end
            end
        end
    elseif uItem[source] then
        if menuContent[ uItem[source] ] then
            showData ( uItem[source] )
        else
            utilItemHandler[ uItem[source] ]()
        end
    elseif sItem[source] then subItemHandler[ sItem[source] ]( menuContent[ sItem[source] ], source, "click" )
    end
    
    if um and not uButton[source] then
        for k,v in pairs ( utilContent[ um ] ) do guiSetVisible ( v, false ) end
        um = nil
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
        local boxtext        = "PEDOBEAR SPOTTED!"
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