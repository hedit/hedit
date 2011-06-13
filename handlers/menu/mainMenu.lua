--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/menu/menuSwitch.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Showing and updating the correct menus
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]
function updateData ( m )
    if not hData[m] then return false end
    if not m then m = cm end
    if pVeh then
        local config = getVehicleHandling ( pVeh )
        for i=1,#hData[m].h do
            if comboItem[ hData[m].h[i] ] then
                local cI=-1
                for v=1,#comboItem[ hData[m].h[i] ] do 
                    if config[ hData[m].h[i] ] == comboItem[ hData[m].h[i] ][v] then cI = v-1 end end
                guiComboBoxSetSelected ( hedit[i], cI )
            else
                local str = tostring ( round ( config[ hData[m].h[i] ] ) )
                if isHex[ hData[m].h[i] ] then str = toHex ( config[ hData[m].h[i] ] ) 
                elseif type(config[ hData[m].h[i] ]) == "table" then
                    local tbl = {}
                    for n,v in ipairs ( config[ hData[m].h[i] ] ) do tbl[n] = tostring(round(v)) end
                    str = table.concat ( tbl, ", " )
                end
                if getKeyStateEx ( ) and hButton[pointedButton] == i then buttonValue = str
                else guiSetText ( hedit[i], str ) end
            end
        end
    else outputDebugString ( "[HEDIT] Unable to update." ) end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function showData ( m )
    if cm~=m then
        pm=cm
        cm=m
    else return end
    local txt = {
                  guiGetText ( mainWnd.infoHeader ),
                  guiGetText ( mainWnd.infoText )
                }
    resetInfoText ( true )
    setInfoText ( unpack ( txt ) )
    guiSetText ( mainWnd.menuHeader, mInfo[m] )
    destroyMenuChildren ( )
    if m == mProperty[7] then
    elseif m == mProperty[8] then
    elseif m == mProperty[9] then guiSetVisible ( vehLog[pVeh], true )
    else
        if hData[m] then
            for i=1,#hData[m].h do
                local gX, gY = guiGetPosition   ( defHedit[i], false )
                local wX, wY = guiGetSize       ( defHedit[i], false )
                guiSetText ( label[i], iProperty[ hData[m].h[i] ][1] )
                guiSetVisible ( label[i], true )
                if comboItem[ hData[m].h[i] ] then
                    hedit[i] = guiCreateComboBox ( gX, gY, wX, (20*#comboItem[ hData[m].h[i] ])+20, "", false, mainWnd.window )
                    for cI=1,#comboItem[ hData[m].h[i] ] do
                        guiComboBoxAddItem ( hedit[i], comboItem[ hData[m].h[i] ][cI] )
                    end
                else
                    hedit[i] = guiCreateButton ( gX, gY, wX, wY, "", false, mainWnd.window )
                end
                hButton [ hedit[i] ] = i
            end
            updateData ( m )
        else
            for k,v in pairs ( menuContent[m] ) do guiSetVisible ( v, true ) end
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
addCommandHandler ( "hm",
    function ( cmd, arg )
        if tonumber ( arg ) and mProperty[tonumber(arg)] then showData ( mProperty[tonumber(arg)] )
        else showData ( arg ) end
    end
)