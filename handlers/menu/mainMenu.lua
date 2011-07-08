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
        if isHex[ hData[m].h[1] ] then
            unmarkHexFlags ( )
            local i = 1
            hexValue = {}
            local hex = string.reverse ( toHex ( config[ hData[m].h[1] ] ) )
            local add = 8 - string.len ( hex )
            if add > 0 then for i=1,add do hex = hex.."0" end end
            for byte in string.gmatch ( hex, "." ) do
                hexValue[i] = byte
                if toValue ( byte ) then for num,value in ipairs ( toValue ( byte ) ) do
                    guiCheckBoxSetSelected ( hexMenu.cb[i][value], true )
                end end
                i = i+1
            end
        else
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
        end
    else outputDebugString ( "[HEDIT] Unable to update." ) end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function showData ( m )
    if requireLogin[m] and getElementData ( localPlayer, "hAccount" ) == "guest" then
        return guiCreateWarningMessage ( text.login, 0 ) end
    if cm~=m then
        pm=cm
        cm=m
    else return false end
    local txt = {
                  guiGetText ( mainWnd.infoHeader ),
                  guiGetText ( mainWnd.infoText )
                }
    resetInfoText ( true )
    setInfoText ( unpack ( txt ) )
    guiSetText ( mainWnd.menuHeader, mInfo[m] )
    destroyMenuChildren ( )
    if m == mProperty[9] then guiSetVisible ( vehLog[pVeh], true )
    else
        if hData[m] and not isHex[ hData[m].h[1] ] then
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
                hButton[ hedit[i] ] = i
            end
            updateData ( m )
        else
            if hData[m] and isHex[ hData[m].h[1] ] then
                for i,c in pairs ( hexMenu ) do
                    for b,t in ipairs ( c ) do
                        for v,g in pairs ( t ) do
                            guiSetVisible ( g, true )
                            if c == hexMenu.cb then
                                guiSetText ( g, iProperty[ hData[m].h[1] ][b][v][1] )
                            end
                        end
                    end
                end
                updateData ( m )
            elseif menuContent[m] then
                for k,v in pairs ( menuContent[m] ) do guiSetVisible ( v, true ) end
            end
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