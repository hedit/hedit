--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/onAccept.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Manage the onAccept events
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function onComboBoxAccept ( )
    local boxText       = guiComboBoxGetItemText ( source, guiComboBoxGetSelected ( source ) )
    local veh           = getPedOccupiedVehicle ( localPlayer )
    local input         = boxText
    ----------------------------------------------------------------------------------------------------------------------
    for i,v in ipairs ( hedit ) do
        if source == hedit[i] then
            if hData[cm].h[i] == hProperty[20] then
                if      input == "true"        then input = true
                elseif  input == "false"       then input = false
                end
            end
            doTry ( veh, input, i )
            break
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function onEditBoxAccept ( box )
    if box == openedHandlingBox then
        oldGuiText = ""
        guiSetText ( mainWnd.info, oldGuiText )
        ------------------------------------------------------------------------------------------------------------------
        local boxText       = guiGetText ( openedHandlingBox )
        local veh           = getPedOccupiedVehicle ( localPlayer )
        ------------------------------------------------------------------------------------------------------------------
        if hData[cm].h[hidedHeditButton] == hProperty[5] then
            local   vX      = round ( tonumber ( gettok ( boxText, 1, 44 ) ) )
            local   vY      = round ( tonumber ( gettok ( boxText, 2, 44 ) ) )
            local   vZ      = round ( tonumber ( gettok ( boxText, 3, 44 ) ) )
            local   input   = { vX, vY, vZ }
            doTry   ( veh, input, hidedHeditButton )
        else
            local input     = tonumber ( boxText )
            if input then doTry ( veh, round(input), hidedHeditButton )
            else
                outputHandlingLog ( log.needNumber, 2 )
            end
        end
        ------------------------------------------------------------------------------------------------------------------
        guiSetVisible ( hedit[hidedHeditButton], true )
        ------------------------------------------------------------------------------------------------------------------
        destroyElement ( box )
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function doTry ( veh, input, num )
    local config = getVehicleHandling ( veh )
    if (type(input)=="table") then
        local d_Table = config[ hData[cm].h[num] ]
        if (type(input[1])=="number" and type(input[2])=="number" and type(input[3])=="number") then
            if (input[1]==round(d_Table[1])) and (input[2]==round(d_Table[2])) and (input[3]==round(d_Table[3])) then
                return outputHandlingLog(string.format(log.same,iProperty[hData[cm].h[num]][1]),1)
            else
                if (withLimits) then
                    for i=1,#input do
                        if (input[i] < tonumber(minLimit[hData[cm].h[num]]) or
                            input[i] > tonumber(maxLimit[hData[cm].h[num]]))then
                            return outputHandlingLog(string.format(log.invalid,iProperty[hData[cm].h[num]][1].." ["..input[i].."]".."("..i..")",2))end end end
                if triggerServerEvent("setHandling",localPlayer,veh,hData[cm].h[num],input,individualHandling,iProperty[hData[cm].h[num]][1],log) then
                    history[hData[cm].h[num]]=tostring(round(d_Table[1])..", "..round(d_Table[2])..", "..round(d_Table[3]))
                    return true
                else
                    return outputHandlingLog(log.unableToCallServer,0)
                end
            end
        else
            return outputHandlingLog(log.needNumber,2)
        end
    else
        if (input==round(config[ hData[cm].h[num] ])) then
            return outputHandlingLog(string.format(log.same,iProperty[hData[cm].h[num]][1]),1)
        else
            if (type(input)=="number" and withLimits) then
                if (input < tonumber(minLimit[hData[cm].h[num]]) or
                    input > tonumber(maxLimit[hData[cm].h[num]]))then
                    return outputHandlingLog(string.format(log.invalid,iProperty[hData[cm].h[num]][1]).." ["..input.."]",2) end end
            if isInt[hData[cm].h[num]] then input = tonumber(string.format("%.0f",input)) end
            if triggerServerEvent("setHandling",localPlayer,veh,hData[cm].h[num],input,individualHandling,iProperty[hData[cm].h[num]][1],log) then
                if isInt[hData[cm].h[num]] then
                    history[hData[cm].h[num]]=string.format("%.0f",config[hData[cm].h[num]])
                else
                    history[hData[cm].h[num]]=tostring(round(config[hData[cm].h[num]])) end
                return true
            else
                return outputHandlingLog(log.unableToCallServer,0)
            end
        end
    end
end