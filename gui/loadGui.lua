--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			gui/loadGui.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Creating and verifying the gui and adding keybinds
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function loadTheGui ( )
	if loadTranslation[usedTranslation] then
		loadTranslation[usedTranslation]()
		if isTranslationValid ( ) then
			if loadTemplate[usedTemplate] then
				loadTemplate[usedTemplate]()
				if isTemplateValid ( ) then
					enableTemplate ( )
				else
					faultTemplate ( text.invalidTemplate )
				end
			else
				faultTemplate ( text.incorrectTemplate )
			end
		else
			faultTranslation ( "HANDLING EDITOR: Incorrect/corrupted translation. Loading english instead." )
		end
	else
		faultTranslation ( "HANDLING EDITOR: No such translation with that name." )
	end
end
addEventHandler ( "onClientResourceStart", resourceRoot, loadTheGui )
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function enableTemplate ( )
	--------------------------------------------------------------------------------------------------------------------
	for k,v in ipairs ( defHedit )	do guiSetVisible	( defHedit[k], false )	end
	--------------------------------------------------------------------------------------------------------------------
	for k,v in ipairs ( utilButton ) do
		setElementData	( utilButton[k], "utilButton", k )
		guiSetText		( utilButton[k], utilText[k] )
	end
	--------------------------------------------------------------------------------------------------------------------
	for k,v in ipairs ( menuButton ) do
		setElementData	( menuButton[k], "menuButton", k )
		guiSetAlpha		( menuButton[k], 0.7 )
	end
	--------------------------------------------------------------------------------------------------------------------
	for k,v in ipairs ( label ) do
		setElementData	( label[k], "heditLabel", k )
	end
	--------------------------------------------------------------------------------------------------------------------
	local xmlRoot	= xmlLoadFile		( "VERSION" )
	local xmlChild	= xmlFindChild		( xmlRoot, "version", 0 )
	local xmlValue	= xmlNodeGetValue	( xmlChild )
	xmlNodeSetValue	( xmlChild, tostring(tonumber(xmlValue)+1) )
	xmlSaveFile		( xmlRoot )
	xmlUnloadFile	( xmlRoot )
	guiSetText		( mainWnd.window, HEDIT_VERSION.."-r"..xmlValue )
	--------------------------------------------------------------------------------------------------------------------
	guiSetVisible	( mainWnd.window,	false )
	guiSetVisible	( logWnd.window,	false )
	guiSetInputMode	( "no_binds_when_editing" )
	--------------------------------------------------------------------------------------------------------------------
	addEventHandler	( "onClientMouseEnter",				mainWnd.window,	onEnter )
	addEventHandler	( "onClientMouseLeave",				mainWnd.window,	onLeave )
	addEventHandler	( "onClientGUIClick",				mainWnd.window,	onClick )
	addEventHandler	( "onClientGUIAccepted",			mainWnd.window,	onEditBoxAccept )
	addEventHandler	( "onClientGUIComboBoxAccepted",	mainWnd.window,	onComboBoxAccept )
	--------------------------------------------------------------------------------------------------------------------
	bindKey ( usedKey, "down", toggleEditor )
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function toggleEditor (  )
	if guiGetVisible ( mainWnd.window ) then
		guiSetVisible ( mainWnd.window, false )
		guiSetVisible ( logWnd.window, false )
		showCursor ( false, false )
		hideUtilMenu ( )
	else
		if not isElement ( popupWnd ) then
			if isPedInVehicle ( localPlayer ) then
				if pSeat > 0 and allowPassengersToEdit == false then
					return
				end
				guiSetVisible ( mainWnd.window, true )
				guiSetVisible ( logWnd.window, true )
				showCursor ( true, true )
				updateHandlingData ( )
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "onClientPlayerVehicleEnter", root,
	function ( veh, seat )
		if source == localPlayer then
			pSeat = seat end end )
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "onClientPlayerVehicleExit", root,
	function ( )
		if source == localPlayer then
			if guiGetVisible ( mainWnd.window ) then
				guiSetVisible ( mainWnd.window, false )
				guiSetVisible ( logWnd.window, false )
				showCursor ( false, false )
			end
		end
	end
)
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
function destroyMenuChildren ( )
	oldGuiText = ""
	if isElement ( openedHandlingBox ) then destroyElement ( openedHandlingBox ) end
	for k,v in ipairs ( hedit ) do if isElement ( hedit[k] ) then destroyElement ( hedit[k] ) end end
	for k,v in ipairs ( label ) do guiSetVisible ( label[k], false ) end
end