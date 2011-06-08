--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/log.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Outputting log into the log window & playing the succes level sound
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

function outputHandlingLog ( txt, err )
    local curTime = getRealTime ( )
    local time    = {
                      string.format ( "%02d", curTime.hour ),
                      string.format ( "%02d", curTime.minute ),
                      string.format ( "%02d", curTime.second )
                    }
    local tStamp  = "["..table.concat(time,":").."]"
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    -- Fuck'd up code, didnt knew anything better atm
    local oldTime  = {}
    local oldText  = {}
    local oldColor = {}
    ---------------------------------------------------------------------------------------------------------------------
    for i=1,3 do
        oldTime[i]  = guiGetText ( logTime[i] )
        oldText[i]  = guiGetText ( logText[i] )
        oldColor[i] = logColor[ logText[i] ]
        if not oldColor[i] then oldColor[i] = {0,0,0} end
    end
    ---------------------------------------------------------------------------------------------------------------------
    for i=2,3 do
        guiSetText       ( logTime[i], oldTime[i-1] )
        guiSetText       ( logText[i], oldText[i-1] )
        guiLabelSetColor ( logText[i], unpack ( oldColor[i-1] ) )
        logColor [ logText[i] ] = oldColor[i-1]
    end
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    if vehLog[pVeh] then
        local labelTime = guiCreateLabel ( 0,  logLine[pVeh], 45,  20, tStamp, false, vehLog[pVeh] )
        local labelText = guiCreateLabel ( 45, logLine[pVeh], 220, 20, txt,    false, vehLog[pVeh] )
        guiSetFont ( labelTime, "default-small" )
        guiSetFont ( labelText, "default-small" )
        guiScrollPaneSetVerticalScrollPosition ( vehLog[pVeh], 100 )
        guiLabelSetColor ( labelText, unpack ( errColor[err] ) )
        logLine[pVeh] = logLine[pVeh] + 15
    else outputDebugString ( "[HEDIT] No vehicle log found!", 1 ) end
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    guiSetText         ( logTime[1], tStamp  )
    guiSetText         ( logText[1], txt )
    guiLabelSetColor   ( logText[1], unpack ( errColor[err] ) )
    playSoundFrontEnd  ( errSound[err] )
    logColor [ logText[1] ] = errColor[err]
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    updateData ( cm )
end

addEvent ( "outputLog", true )
addEventHandler ( "outputLog", root, outputHandlingLog )