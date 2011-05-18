--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/menu/menuSwitch.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Showing and updating the correct menus
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]
function updateData ( m )
    if not m then m         = cm end
    local veh               = getPedOccupiedVehicle ( localPlayer )
    if veh then
        local config        = getVehicleHandling ( veh )
        for i=1,#hData[m].h do
            if comboItem[ hData[m].h[i] ] then
                local cI=-1
                for v=1,#comboItem[ hData[m].h[i] ] do 
                    if config[ hData[m].h[i] ] == comboItem[ hData[m].h[i] ][v] then cI = v-1 end end
                guiComboBoxSetSelected ( hedit[i], cI )
            elseif hData[m].h[i] == hProperty[5] then
                local com   = config[ hData[m].h[i] ]
                if getKeyStateEx ( ) and hButton[pointedButton] == i then
                    buttonValue = tostring ( round(com[1]) ) ..", "..tostring ( round(com[2]) ) ..", "..tostring ( round(com[3]) )
                else
                guiSetText (
                           hedit[i],
                           tostring   ( round(com[1]) ) ..", "
                           ..tostring ( round(com[2]) ) ..", "
                           ..tostring ( round(com[3]) )
                           )
                end
            else
            	if getKeyStateEx ( ) and hButton[pointedButton] == i then buttonValue = round ( config[ hData[m].h[i] ] )
            	else guiSetText ( hedit[i], round ( config[ hData[m].h[i] ] ) ) end
            end
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function showData ( m )
    if guiGetVisible ( mainWnd.window ) then
        cm=m
        guiSetText ( mainWnd.menuHeader, mInfo[m] )
        destroyMenuChildren ( )
        if m == mProperty[7] then
        elseif m == mProperty[8] then
        elseif m == mProperty[9] then guiSetVisible ( logPane, true )
        else
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
        end
    end
end     