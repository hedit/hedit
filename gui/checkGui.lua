--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          gui/checkGui.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Verifying the current GUI
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function isTranslationValid ( )
    local valid = {
        -- Fill text variables
    }
    for k,v in ipairs(valid) do
        if type(valid[k])~="string" then
            return false
        end
    end
    return true
end
-------------------------------------------------------------------------------------------------------------------------------
function isTemplateValid ( )
    local valid = {
        -- Fill gui variables
    }
    for k,v in ipairs(valid) do
        if not isElement(valid[k]) then
            return false
        end
    end
    return true
end
-------------------------------------------------------------------------------------------------------------------------------
function faultTranslation ( txt )
    if usedTranslation == "english" then
        outputChatBox ( "HANDLING EDITOR: No english translation available! Handling editor will not work now.", 255, 0, 0 )
        stopResource ( )
    else
        if loadTemplate["default"] then
            loadTemplate["default"]()
            if isTemplateValid ( ) then
                enableTemplate ( )
                outputChatBox ( txt, 255, 0, 0 )
            else
                outputChatBox ( "HANDLING EDITOR: No english translation available! Handling editor will not work now.", 255, 0, 0 )
                stopResource ( )
            end
        else
            outputChatBox ( "HANDLING EDITOR: No english translation available! Handling editor will not work now.", 255, 0, 0 )
            stopResource ( )
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------------
function faultTemplate ( txt )
    if usedTemplate == "default" then
        outputChatBox ( text.noDefaultTemplate, 255, 0, 0 )
        stopResource ( )
    else
        if loadTemplate["default"] then
            loadTemplate["default"]()
            if isTemplateValid ( ) then
                enableTemplate ( )
                outputChatBox ( txt, 255, 0, 0 )
            else
                outputChatBox ( text.noDefaultTemplate, 255, 0, 0 )
                stopResource ( )
            end
        else
            outputChatBox ( text.noDefaultTemplate, 255, 0, 0 )
            stopResource ( )
        end
    end
end
