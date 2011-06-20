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

function fixInput ( veh, txt, num )
    local input = nil
    if hData[cm].h[num] == hProperty[5] then
        input = {
                  round ( tonumber ( gettok ( txt, 1, 44 ) ) ),
                  round ( tonumber ( gettok ( txt, 2, 44 ) ) ),
                  round ( tonumber ( gettok ( txt, 3, 44 ) ) )
                }
        return doTry ( veh, input, num )
    elseif isInt[ hData[cm].h[num] ] then input = tonumber(string.format("%.0f",txt))
    elseif isHex[ hData[cm].h[num] ] then input = tonumber("0x"..txt)
    else   input = tonumber(txt) end
    if not input then return outputHandlingLog ( clog.needNumber, 2 ) end
    return doTry ( veh, input, num, byte, value )
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function doTry ( veh, input, num )
    if not veh or not input or not num then return false end
    local config = getVehicleHandling ( veh )
    local prop = iProperty[hData[cm].h[num]][1]
    if isHex[hData[cm].h[num]] then prop = iProperty[hData[cm].h[num]][byte][value][1] end
    if (type(input)=="table") then
        local d_Table = config[hData[cm].h[num]]
        if (type(input[1])=="number" and type(input[2])=="number" and type(input[3])=="number") then
            if (input[1]==round(d_Table[1])) and (input[2]==round(d_Table[2])) and (input[3]==round(d_Table[3])) then
                return outputHandlingLog(string.format(clog.same,prop),1)
            else
                for i=1,#input do
                    if (input[i] < tonumber(minLimit[hData[cm].h[num]]) or
                        input[i] > tonumber(maxLimit[hData[cm].h[num]]))then
                        return outputHandlingLog(string.format(log.invalid,prop.." ["..input[i].."]".."("..i..")",2))end end
                if triggerServerEvent("setHandling",localPlayer,veh,hData[cm].h[num],input,prop,slog) then
                    return setElementData(veh,"history."..hData[cm].h[num],tostring(round(d_Table[1])..", "..round(d_Table[2])..", "..round(d_Table[3])))
                end
            end
        else
            return outputHandlingLog(clog.needNumber,2)
        end
    else
        if (input==round(config[hData[cm].h[num]])) then
            return outputHandlingLog(string.format(clog.same,prop),1)
        else
            if (type(input)=="number" and minLimit[hData[cm].h[num]] and maxLimit[hData[cm].h[num]]) then
                if (input < tonumber(minLimit[hData[cm].h[num]]) or
                    input > tonumber(maxLimit[hData[cm].h[num]]))then
                    return outputHandlingLog(string.format(clog.invalid,prop).." ["..input.."]",2) end end
            if (hData[cm].h[num]==hProperty[25]) and (input==config[hData[cm].h[26]]) then
                return outputHandlingLog(string.format(clog.cantSame,hData[cm].h[num],hProperty[25]),2)
            elseif (hData[cm].h[num]==hProperty[26]) and (input==config[hData[cm].h[25]]) then
                return outputHandlingLog(string.format(clog.cantSame,hData[cm].h[num],hProperty[26]),2)
            end
            if triggerServerEvent("setHandling",localPlayer,veh,hData[cm].h[num],input,prop,slog) then
                if isSaved[pVeh] then
                    guiSetText(extraInfo,guiGetText(extraInfo).." - "..text.unsaved)
                    isSaved[pVeh]=false
                end
                if isInt[hData[cm].h[num]] then
                    return setElementData(veh,"history."..hData[cm].h[num],string.format("%.0f",config[hData[cm].h[num]]))
                elseif isHex[hData[cm].h[num]] then
                    return setElementData(veh,"history."..hData[cm].h[num],toHex(config[hData[cm].h[num]]))
                else
                    return setElementData(veh,"history."..hData[cm].h[num],tostring(round(config[hData[cm].h[num]])))
                end
            end
        end
    end
end