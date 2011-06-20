--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          gui/checkGui.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Verifying the current GUI
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
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
    if setting["language"] == "english" then
        stopResource ( "HANDLING EDITOR: No english translation available! Handling editor will not work now." )
    else
        if loadTranslation["english"] then
            loadTranslation["english"]()
            if isTranslationValid ( ) then
                loadTheTemplate ( )
                outputChatBox ( txt, 255, 0, 0 )
            else
                stopResource ( "HANDLING EDITOR: No english translation available! Handling editor will not work now." )
            end
        else
            stopResource ( "HANDLING EDITOR: No english translation available! Handling editor will not work now." )
        end
    end
end
-------------------------------------------------------------------------------------------------------------------------------
function faultTemplate ( txt, template )
    if setting["template"] == "extended" then
        stopResource ( text.noDefaultTemplate )
    else
        if loadTemplate["extended"] then
            loadTemplate["extended"]()
            if isTemplateValid ( ) then
                enableTemplate ( )
                outputChatBox ( string.format ( txt, template ), 255, 0, 0 )
            else
                stopResource ( text.noDefaultTemplate )
            end
        else
            stopResource ( text.noDefaultTemplate )
        end
    end
end
