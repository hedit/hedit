--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/onAccept.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Manage the onAccept events
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

function onComboBoxAccept ( )
    if hButton[source] then
        local boxText       = guiComboBoxGetItemText ( source, guiComboBoxGetSelected ( source ) )
        local input         = boxText
        ------------------------------------------------------------------------------------------------------------------
        for i,v in ipairs ( hedit ) do
            if source == hedit[i] then
                if hData[cm].h[i] == hProperty[20] then
                    if      input == "true"        then input = true
                    elseif  input == "false"       then input = false
                    end
                end
                doTry ( pVeh, input, i )
                break
            end
        end
    elseif sItem[source] then subItemHandler[ sItem[source] ](source,"comboAccept")
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function onEditBoxAccept ( box )
    if box == openedHandlingBox then
        resetInfoText ( true )
        local boxText = guiGetText ( openedHandlingBox )
        fixInput ( pVeh, boxText, hidedHeditButton )
        guiSetVisible ( hedit[hidedHeditButton], true )
        destroyElement ( box )
    elseif sItem[source] then subItemHandler[ sItem[source] ](source,"editAccept")
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function fixInput ( veh, text, num )
    if hData[cm].h[num] == hProperty[5] then
        local vX    = round ( tonumber ( gettok ( text, 1, 44 ) ) )
        local vY    = round ( tonumber ( gettok ( text, 2, 44 ) ) )
        local vZ    = round ( tonumber ( gettok ( text, 3, 44 ) ) )
        local input = { vX, vY, vZ }
        doTry ( veh, input, num )
    else
        local input = tonumber ( text )
        if input then doTry ( veh, round(input), num )
        else outputHandlingLog ( clog.needNumber, 2 ) end
    end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function doTry ( veh, input, num )
    local config = getVehicleHandling ( veh )
    if (type(input)=="table") then
        local d_Table = config[hData[cm].h[num]]
        if (type(input[1])=="number" and type(input[2])=="number" and type(input[3])=="number") then
            if (input[1]==round(d_Table[1])) and (input[2]==round(d_Table[2])) and (input[3]==round(d_Table[3])) then
                return outputHandlingLog(string.format(clog.same,iProperty[hData[cm].h[num]][1]),1)
            else
                for i=1,#input do
                    if (input[i] < tonumber(minLimit[hData[cm].h[num]]) or
                        input[i] > tonumber(maxLimit[hData[cm].h[num]]))then
                        return outputHandlingLog(string.format(log.invalid,iProperty[hData[cm].h[num]][1].." ["..input[i].."]".."("..i..")",2))end end
                if triggerServerEvent("setHandling",localPlayer,veh,hData[cm].h[num],input,iProperty[hData[cm].h[num]][1],slog) then
                    return setElementData(veh,"history."..hData[cm].h[num],tostring(round(d_Table[1])..", "..round(d_Table[2])..", "..round(d_Table[3])))
                end
            end
        else
            return outputHandlingLog(clog.needNumber,2)
        end
    else
        if (input==round(config[hData[cm].h[num]])) then
            return outputHandlingLog(string.format(clog.same,iProperty[hData[cm].h[num]][1]),1)
        else
            if (type(input)=="number") then
                if (input < tonumber(minLimit[hData[cm].h[num]]) or
                    input > tonumber(maxLimit[hData[cm].h[num]]))then
                    return outputHandlingLog(string.format(clog.invalid,iProperty[hData[cm].h[num]][1]).." ["..input.."]",2) end end
            if isInt[hData[cm].h[num]] then input = tonumber(string.format("%.0f",input)) end
            if (hData[cm].h[num]==hProperty[25]) and (input==config[hData[cm].h[26]]) then
                return outputHandlingLog(string.format(clog.cantSame,hData[cm].h[num],hProperty[25]),2)
            elseif (hData[cm].h[num]==hProperty[26]) and (input==config[hData[cm].h[25]]) then
                return outputHandlingLog(string.format(clog.cantSame,hData[cm].h[num],hProperty[26]),2)
            end
            if triggerServerEvent("setHandling",localPlayer,veh,hData[cm].h[num],input,iProperty[hData[cm].h[num]][1],slog) then
                if isInt[hData[cm].h[num]] then
                    return setElementData ( veh,"history."..hData[cm].h[num],string.format("%.0f",config[hData[cm].h[num]]) )
                else
                    return setElementData ( veh,"history."..hData[cm].h[num],tostring(round(config[hData[cm].h[num]])))
                end
            end
        end
    end
end