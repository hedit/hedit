--|| ***************************************************************************************************************** [[
--|| PROJECT:        MTA Ingame Handling Editor
--|| FILE:            handlers/onClick.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:        Manage the button clicks
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function onClick ( )
    if uMenu[source] then
        --[[if isElement ( utilGridList ) and source == cu then hideUtilMenu ( )
        else
            if source == utilButton[#utilButton] then toggleEditor ( )
            else tryDropList ( source ) end
        end
    elseif uItem[source] then]]
        
    else
        if guiGetText ( source ) ~= text.hr then hideUtilMenu ( ) end
        if mButton[source] then
            playSoundFrontEnd ( 41 )
            showData ( mProperty[ mButton[source] ] )
        elseif hButton[source] then
            createHeditBox ( hedit[ hButton[source] ], iProperty[ hData[cm].h[ hButton[source] ] ][3], true )
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function createHeditBox(box,text,bool)
    oldGuiText=text
    guiSetText(mainWnd.info,text)
    showAllTheEdits()
    if(bool==true)then
        local x,y=guiGetPosition(box,false)
        local w,h=guiGetSize(box,false)
        openedHandlingBox=guiCreateEdit(x,y,w,h,guiGetText(box),false,mainWnd.window)
        guiBringToFront(openedHandlingBox)
        guiEditSetCaretIndex(openedHandlingBox,string.len(guiGetText(box)))
        guiSetVisible(box,false)
        hidedHeditButton=hButton[box]
    end
end
-------------------------------------------------------------------------------------------------------------------------
function showAllTheEdits()
    for i,v in ipairs(hedit) do if isElement(hedit[i]) then guiSetVisible(hedit[i],true) end end
    if isElement(openedHandlingBox) then destroyElement(openedHandlingBox) end
end