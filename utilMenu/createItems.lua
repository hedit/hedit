--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          utilMenu/createItems.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating the dropLists and subMenus
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function createDropList ( src, ... )
    local currentLine   = 0
    local width         = 50
    local arg           = { ... }
    local posX, posY    = guiGetPosition ( src, false )
    local _, height     = guiGetSize     ( src, false )
    ----------------------------------------------------------------------------------------------------------------------
    if isElement ( utilGridList ) then destroyElement ( utilGridList ) end
    if isElement ( subGridList ) then destroyElement ( subGridList ) end
    utilGridList        = guiCreateGridList ( posX, posY+height+3, width, 400, false, mainWnd.window )
    ----------------------------------------------------------------------------------------------------------------------
    if arg[1] then
        currentLine    = 10
        for k,v in ipairs ( arg ) do
            if arg[k] == "LINE" then
                local label = guiCreateLabel ( 0, currentLine-5, 165, 20, text.hr, false, utilGridList )
                guiSetAlpha ( label, 0.3 )
            end
            currentLine = currentLine + 15
        end
        currentLine    = 10
        for k,v in ipairs ( arg ) do
            if arg[k] ~= "LINE" then
                local label = guiCreateLabel ( 10, currentLine, 165, 15, arg[k], false, utilGridList )
                if guiLabelGetTextExtent ( label ) > width then width = guiLabelGetTextExtent ( label ) end
                uItem[label] = k
            end
            currentLine = currentLine + 15
        end
    end
    ----------------------------------------------------------------------------------------------------------------------
    guiSetSize      ( utilGridList, width+20, currentLine+15, false )
    guiSetAlpha     ( utilGridList, 1 )
    ----------------------------------------------------------------------------------------------------------------------
    cu=src
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function hideUtilMenu ( )
    if isElement ( utilGridList ) then
        cu=nil
        destroyElement ( utilGridList )
        if isElement ( subGridList ) then destroyElement ( subGridList ) end
    end
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function tryDropList ( src )
    if src == utilButton[1] then
        createDropList (
            source,
            text.newHandling,
            text.openHandling,
            "LINE",
            text.importHandling,
            text.exportHandling,
            "LINE",
            text.saveHandling,
            text.saveHandlingAs,
            "LINE",
            text.closeWindow
        )
    ----------------------------------------------------------------------------------------------------------------------
    elseif src == utilButton[2] then
        createDropList (
            source,
            text.showTransmission,
            text.showSuspension,
            text.showOther,
            text.showTest,
            text.showHelp,
            "LINE",
            text.showLog,
            text.showDyno
        )
    ----------------------------------------------------------------------------------------------------------------------
    elseif src == utilButton[3] then
        createDropList (
            source,
            text.pickLanguage,
            text.pickTemplate
        )
    end
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------