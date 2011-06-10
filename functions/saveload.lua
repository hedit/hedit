--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/saveload.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Managing save and load functions
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

function trySave ( )
    local sName       = guiGetText ( menuContent["saveclient"].nameEdit )
    local description = "description" --guiGetText ( menuContent["saveclient"].descriptionEdit )
    if sName and sName ~= "" and description and description ~= "" then
        local lName = string.lower ( sName )
        if xmlSavesTable[lName] then guiCreateWarningMessage ( text.askToReplace, 1, {saveClient,sName,lName,description} )
        else saveClient ( sName, lName, description ) end
    else outputHandlingLog ( clog.invalidSave, 2 ) end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function saveClient ( sName, lName, description )
    local model = tostring ( getElementModel ( pVeh ) )
    if not xmlSavesTable[lName] then
        xmlSavesTable[lName]       = {h={}}
        xmlSavesTable[lName].m     = model
        xmlSavesTable[lName].s     = sName
        xmlSavesTable[lName].d     = description
        xmlSavesTable[lName].sNode = xmlCreateChild ( xmlSavesNode,               "save"     )
        xmlSavesTable[lName].hNode = xmlCreateChild ( xmlSavesTable[lName].sNode, "handling" )
    end
    xmlNodeSetAttribute ( xmlSavesTable[lName].sNode, "model",       model )
    xmlNodeSetAttribute ( xmlSavesTable[lName].sNode, "name",        sName )
    xmlNodeSetAttribute ( xmlSavesTable[lName].sNode, "description", description )
    for p,v in pairs ( getVehicleHandling ( pVeh ) ) do
        xmlSavesTable[lName].h[p] = handlingToString ( v )
        xmlNodeSetAttribute ( xmlSavesTable[lName].hNode, p, handlingToString ( v ) )
    end
    xmlSaveFile ( xmlSavesNode )
    reloadClientSaves ( )
    showData ( pm )
    outputHandlingLog ( clog.saved, 0 )
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function tryDelete ( )
    if     guiGetVisible ( menuContent["saveclient"].grid ) then grid = menuContent["saveclient"].grid
    elseif guiGetVisible ( menuContent["loadclient"].grid ) then grid = menuContent["loadclient"].grid
    end
    if grid then
        local row,col = guiGridListGetSelectedItem ( grid )
        if row > -1 and col > -1 then
            local name = string.lower ( guiGridListGetItemText ( grid, row, col ) )
            if name and xmlSavesTable[name] then
                guiCreateWarningMessage ( text.askToDelete, 1, {deleteHandling,name} )
            end
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function deleteHandling ( name )
    xmlDestroyNode ( xmlSavesTable[name].sNode )
    xmlSaveFile ( xmlSavesNode )
    outputHandlingLog ( string.format ( clog.deletedHandling, xmlSavesTable[name].s ), 0 )
    xmlSavesTable[name] = nil
    reloadClientSaves ( )
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function loadSavesIntoGrid ( gridList )
    if xmlSavesTable and gridList then
        guiGridListClear ( gridList )
        for n,v in pairs ( xmlSavesTable ) do
            if xmlSavesTable[n].sNode then
                local row   = guiGridListAddRow ( gridList )
                local model = getVehicleNameFromModel ( tonumber ( xmlSavesTable[n].m ) )
                guiGridListSetItemText ( gridList, row, 1, xmlSavesTable[n].s, false, false )
                guiGridListSetItemText ( gridList, row, 2, model,              false, false )
            end
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function reloadClientSaves ( )
    loadSavesIntoGrid ( menuContent["saveclient"].grid )
    loadSavesIntoGrid ( menuContent["loadclient"].grid )
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function loadXmlFiles ( )
    xmlSavesTable = {}
    xmlSavesNode  = xmlLoadFile ( "saves/saves.xml" )
    if not xmlSavesNode then xmlSavesNode = xmlCreateFile ( "saves/saves.xml", "root" ) end
    ----------------------------------------------------------------------------------------------------------------------
    for i,node in ipairs ( xmlNodeGetChildren ( xmlSavesNode ) ) do
        local model       = xmlNodeGetAttribute ( node, "model" )
        local name        = xmlNodeGetAttribute ( node, "name" )
        local description = xmlNodeGetAttribute ( node, "description" )
        local lName       = string.lower ( name )
        xmlSavesTable[lName]       = {h={}}
        xmlSavesTable[lName].m     = model
        xmlSavesTable[lName].s     = name
        xmlSavesTable[lName].d     = description
        xmlSavesTable[lName].sNode = node
        xmlSavesTable[lName].hNode = xmlFindChild ( node, "handling", 0 )
        for p,v in pairs ( xmlNodeGetAttributes ( xmlSavesTable[lName].hNode ) ) do
            xmlSavesTable[lName].h[p] = v
        end
    end
end