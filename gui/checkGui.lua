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
        mainWnd.window, menuButton[1], menuButton[2], menuButton[3], menuButton[4],
        utilButton.file, utilButton.view, utilButton.options, utilButton.close,
        label[1], label[2], label[3], label[4], label[5], label[6], label[7], label[8], label[9], label[10], label[11], label[12], label[13],
        defHedit[1], defHedit[2], defHedit[3], defHedit[4], defHedit[5], defHedit[6], defHedit[7],
        defHedit[8], defHedit[9], defHedit[10], defHedit[11], defHedit[12], defHedit[13],
        mainWnd.info,
        logWnd.window, logWnd.scrollpane
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
