--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/saveload.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Managing save and load functions
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

--[[utilAccept[ mProperty[10] ] = function ( sName )
    if not sName then sName = guiGetText ( saveMenu.edit ) end
    local aName = getElementData ( localPlayer, "hAccount" )
    if not allowGuestsToSave and aName == "guest" then return outputHandlingLog ( clog.noAccount, 2 ) end
    local str = string.lower ( sName )
    if xmlTable[aName] and xmlTable[aName][str] then
        outputChatBox ( "ALREADY EXISTS" )
    else
        outputHandlingLog ( clog.saving, 0 )
        showData ( pm )
        triggerServerEvent ( "saveTheHandling", localPlayer, lVeh, aName, str, slog )
    end
end]]

addCommandHandler ( "save",
    function ( cmd, sName )
        if sName and pVeh then
            local aName = "guest"
            local str = string.lower ( sName )
            if xmlTable[aName] and xmlTable[aName][str] then
                outputChatBox ( "ALREADY EXISTS" )
            else
                outputHandlingLog ( clog.saving, 0 )
                triggerServerEvent ( "saveTheHandling", localPlayer, pVeh, aName, str, slog )
            end
        else
            outputChatBox ( "Error" )
        end
    end
)

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

--[[utilAccept[ mProperty[11] ] = function ( )
    local aName = nil
    local sName = nil
    outputChatBox ( "omg" )
    if guiGetVisible ( loadMenu.gridMy ) then
        local row,col = guiGridListGetSelectedItem ( loadMenu.gridMy )
        if row ~= -1 then
            aName = getElementData ( localPlayer, "hAccount" )
            sName = guiGridListGetItemData ( loadMenu.gridMy, row, col )
        end
    else
        local nRow,nCol = guiGridListGetSelectedItem ( loadMenu.gridName )
        local sRow,sCol = guiGridListGetSelectedItem ( loadMenu.gridSave )
        if nRow ~= -1 and sRow ~= -1 then
            aName = guiGridListGetItemData ( loadMenu.gridName, nRow, nCol )
            sName = guiGridListGetItemData ( loadMenu.gridSave, sRow, sCol )
        end
    end
    outputChatBox ( tostring ( aName ) )
    outputChatBox ( tostring ( sName ) )
    if aName and sName  then
        outputHandlingLog ( clog.loading, 0 )
        showData ( pm )
        triggerServerEvent ( "loadTheHandling", localPlayer, aName, sName, slog )
    end
end]]

addCommandHandler ( "load",
    function ( cmd, sName )
        if sName and pVeh then
            local aName = "guest"
            local str = string.lower ( sName )
            if xmlTable[aName] and xmlTable[aName][str] then
                outputHandlingLog ( clog.loading, 0 )
                triggerServerEvent ( "loadTheHandling", localPlayer, pVeh, aName, str, slog )
            end
        else
            outputChatBox ( "Error" )
        end
    end
)

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function loadSaveFile ( )
    xmlNode  = xmlLoadFile ( ":hedit_saves/saves.xml" )
    xmlTable = {}
    ----------------------------------------------------------------------------------------------------------------------
    for uIndex,uNode in ipairs ( xmlNodeGetChildren ( xmlNode ) ) do
        local aName       = xmlNodeGetAttribute ( uNode, "account" )
        xmlTable[aName]   = {}
        for sIndex, sNode in ipairs ( xmlNodeGetChildren ( uNode ) ) do
            local sName = xmlNodeGetAttribute ( sNode, "name" )
            local hConf = xmlFindChild ( sNode, "handling", 0 )
            xmlTable[aName][sName]   = {}
            xmlTable[aName][sName].h = {}
            for k,v in pairs ( xmlNodeGetAttributes ( hConf ) ) do
                xmlTable[aName][sName].h[k] = v
            end
        end
    end
    xmlUnloadFile ( xmlNode )
end
addEventHandler ( "onClientResourceStart", root,
    function ( res ) if res == getResourceFromName ( "hedit_saves" ) then loadSaveFile ( ) end end )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function loadXMLToGrid ( grid, name )
    if not isElement ( grid ) then return false end
    guiGridListClear ( grid )
    loadSaveFile ( )
    if not name then
        for k,v in pairs ( xmlTable ) do
            local row = guiGridListAddRow ( grid )
            guiGridListSetItemText ( grid, row, 1, k,  false, false )
            guiGridListSetItemText ( grid, row, 2, #v, false, false )
            guiGridListSetItemData ( grid, row, 1, k )
        end
    else
        if not xmlTable[name] then return false end
        for k,v in pairs ( xmlTable[name] ) do
            local row = guiGridListAddRow ( grid )
            guiGridListSetItemText ( grid, row, 1, k,            false, false )
            guiGridListSetItemText ( grid, row, 2, v.h["model"], false, false )
            guiGridListSetItemData ( grid, row, 1, k )
        end
    end
end