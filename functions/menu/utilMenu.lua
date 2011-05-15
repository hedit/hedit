--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/menu/utilMenu.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating the dropLists and subMenus
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]
function createSubMenu ( src, int, ...)
    local currentLine   = 10
    local width         = 50
    local arg           = { ... }
    local grdX, grdY    = guiGetPosition ( utilGridList, false )
    local lblX, lblY    = guiGetPosition ( src, false )
    local w, h          = guiGetSize     ( utilGridList, false )
    local posX, posY    = w+grdX+3, grdY+lblY-10
    ----------------------------------------------------------------------------------------------------------------------
    if isElement ( subGridList ) then destroyElement ( subGridList ) end
    subGridList = guiCreateGridList ( posX, posY, width, 400, false, mainWnd.window )
    ----------------------------------------------------------------------------------------------------------------------
    if arg[1] then
        for k,v in ipairs ( arg ) do
            local label = guiCreateLabel ( 10, currentLine, 165, 15, arg[k], false, subGridList )
            if guiLabelGetTextExtent ( label ) > width then width = guiLabelGetTextExtent ( label ) end
            currentLine = currentLine + 15
            uItem[label] = k
            addEventHandler ( "onClientGUIClick", label,
                function ( )
                    if int==0 then outputChatBox ( "Translation: "..arg[k] )
                    elseif int==1 then outputChatBox ( "Template: "..arg[k] ) end
                    hideUtilMenu ( )
                end
            )
        end
    end
    ----------------------------------------------------------------------------------------------------------------------
    guiSetSize  ( subGridList, width+20, currentLine+15, false )
    guiSetAlpha ( subGridList, 1 )
end