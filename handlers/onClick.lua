--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			handlers/onClick.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Manage the button clicks
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

openedHandlingBox			= nil

function onClick ( )
	local uMenu		= getElementData ( source, "utilButton" )
	local uItem		= getElementData ( source, "utilItem" )
	if uMenu then
		if isElement ( utilGridList ) and source == getElementData ( localPlayer, "currentUtilMenu" ) then
			hideUtilMenu ( )
		else
			if source == utilButton[#utilButton] then toggleEditor ( )
			else
				tryDropList ( source )
			end
		end
	elseif uItem then
	else
		local mButton	= getElementData ( source, "menuButton" )
		local hButton	= getElementData ( source, "heditButton" )
		if guiGetText ( source ) ~= text.hr then hideUtilMenu ( ) end
		if mButton then
			playSoundFrontEnd ( 41 )
			showData ( buttonMenu[mButton] )
		elseif hButton then
			local cm = getElementData ( localPlayer, "currentMenu" )
			createHeditBox ( hedit[hButton], info[cm].h[hButton], true )
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function createHeditBox(box,text,bool)
	oldGuiText=text
	guiSetText(mainWnd.info,text)
	showAllTheEdits()
	if(bool==true)then
		local x,y=guiGetPosition(box,false)
		local w,h=guiGetSize(box,false)
		openedHandlingBox=guiCreateEdit(x,y,w,h,guiGetText(box),false,mainWnd.window)
		guiBringToFront(openedHandlingBox)
		guiEditSetCaretIndex(openedHandlingBox,string.len(guiGetText(box)))
		guiSetVisible(box,false)
	end
end
-------------------------------------------------------------------------------------------------------------------------
function showAllTheEdits()
	for i,v in ipairs(hedit) do if isElement(hedit[i]) then guiSetVisible(hedit[i],true) end end
	if isElement(openedHandlingBox) then destroyElement(openedHandlingBox) end
end