--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			handlers/onHover.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Handling the mouse-hover effects
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function onEnter ( )
	local uMenu		= getElementData ( source, "utilButton" )
	local uItem		= getElementData ( source, "utilItem" )
	local mButton	= getElementData ( source, "menuButton" )
	local hLabel	= getElementData ( source, "heditLabel" )
	local hButton	= getElementData ( source, "heditButton" )
	if uMenu and isElement ( utilGridList ) then
		tryDropList ( source ) 
	elseif uItem then
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
		end
	elseif mButton then setButtonEffect ( source, info[mButton] )
	elseif hLabel then
		local cm = getElementData	( localPlayer, "currentMenu" )
		guiLabelSetColor			( source, 255, 255, 128 )
		guiSetText					( mainWnd.info, info[cm].l[hLabel] )
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function onLeave ( )
	if not getElementData ( source, "utilItem" ) then
		local mButton  = getElementData ( source, "menuButton" )
		guiSetText ( mainWnd.info, oldGuiText )
		guiSetAlpha ( menuButton[mButton], 0.7 )
	end
	if getElementType ( source ) == "gui-label" then return guiLabelSetColor ( source, 255, 255, 255 ) end 
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function setButtonEffect ( button, txt )
	guiSetAlpha			( button, 1 )
	playSoundFrontEnd	( 42 )
	guiSetText			( mainWnd.info, txt )
end