--|| ***************************************************************************************************************** [[
--|| PROJECT:        MTA Ingame Handling Editor
--|| FILE:            handlers/onHover.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:        Handling the mouse-hover effects
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function onEnter ( )
    if uMenu[source] and isElement ( utilGridList ) then
        --[[tryDropList ( source ) 
    elseif uItem[source] then
        guiLabelSetColor ( source, 237, 134, 0 )
        if guiGetText ( source ) == text.pickLanguage then
            local t_Lang = {}
            local i = 1
            for k,v in pairs ( loadTranslation ) do
                t_Lang[i] = k
                i=1+1
            end
            createSubMenu ( source, 0, unpack(t_Lang) )
        elseif guiGetText ( source ) == text.pickTemplate then
            local t_Temp = {}
            local i = 1
            for k,v in pairs ( loadTemplate ) do
                t_Temp[i] = k
                i=1+1
            end
            createSubMenu ( source, 1, unpack(t_Temp) )
        end]]
    elseif mButton[source] then setButtonEffect ( source, mInfo[ mButton[source] ] )
    elseif hLabel[source] then
        guiLabelSetColor ( source, 255, 255, 128 )
        guiSetText ( mainWnd.info, sProperty[ hData[cm].h[ hLabel[source] ] ] )
    end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function onLeave ( )
    if not uItem[source] then
        guiSetText ( mainWnd.info, oldGuiText )
        guiSetAlpha ( hProperty[ mButton[source] ], 0.7 )
    end
    if getElementType ( source ) == "gui-label" then return guiLabelSetColor ( source, 255, 255, 255 ) end 
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function setButtonEffect ( button, txt )
    guiSetAlpha          ( button, 1 )
    playSoundFrontEnd    ( 42 )
    guiSetText           ( mainWnd.info, txt )
end