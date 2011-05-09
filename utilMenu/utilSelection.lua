--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			utilMenu/utilSelection.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Creating handlers for item selections
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function showUtilSelection ( sel )
	local scrW, scrH = guiGetScreenSize ( )
	if sel == text.newHandling then
		createPopup ( 300, 150, text.resetHeader, text.resetLabel, text.continue, text.cancel )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.openHandling then
		createPopup ( 400, 300, text.openHeader, text.openLabel, text.open, text.cancel )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.importHandling then
		createPopup ( 400, 300, text.importHeader, text.importLabel, text.import, text.cancel )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.exportHandling then
		createPopup ( 400, 300, text.exportHeader, text.exportLabel, text.accept, text.cancel )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.saveHandling then
		createPopup ( 400, 300, text.saveHeader, text.saveLabel, text.save, text.cancel )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.saveHandlingAs then
		createPopup ( 400, 300, text.saveAsHeader, text.saveLabel, text.save, text.cancel )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.closeWindow then
		toggleEditor ( )
	----------------------------------------------------------------------------------------------------------------------
	--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.showTransmission then
		showData ( "transmission" )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.showSuspension then
		showData ( "suspension" )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.showOther then
		showData ( "other" )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.showTest then
		showData ( "test" )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.showHelp then
		showData ( "help" )
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.showLog then
		if guiGetVisible ( logWnd.window ) then guiSetVisible ( logWnd.window, false )
		else guiSetVisible ( logWnd.window, true ) end
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.showDyno then
	----------------------------------------------------------------------------------------------------------------------
	--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.pickLanguage then
	----------------------------------------------------------------------------------------------------------------------
	elseif sel == text.pickTemplate then
	----------------------------------------------------------------------------------------------------------------------
	end
end

function createPopup ( width, height, header, label, btn1, btn2 )
	hideUtilMenu ( )
	local scrW, scrH		= guiGetScreenSize ( )
	local posX, posY		= (scrW/2)-(width/2), (scrH/2)-(height/2)
	local btnW				= ((width-20)/2)-2
	local btnX				= btnW+14
	local btnY				= height-35
	-----------------------------------------------------------------------------------------------------------------------
	popupWnd				= guiCreateWindow	( posX,	posY,	width,	height,	header,	false )
	popupAccept				= guiCreateButton	( 10,	btnY,	btnW,	25,		btn1,	false, popupWnd )
	popupCancel				= guiCreateButton	( btnX,	btnY,	btnW,	25,		btn2,	false, popupWnd )
	-----------------------------------------------------------------------------------------------------------------------
	guiSetVisible ( mainWnd.window,	false )
	guiSetVisible ( logWnd.window,	false )
	-----------------------------------------------------------------------------------------------------------------------
	if header == text.resetHeader then
		popupLabel				= guiCreateLabel	( 10,	25,		280,	70,		label,	false, popupWnd )
		guiLabelSetHorizontalAlign	( popupLabel, "center", true )
	-----------------------------------------------------------------------------------------------------------------------
	elseif header == text.openHeader then
		local grdX, grdY		= 10, 20
		local ngrdW, ngrdH		= ((width-20)/4),height-45
		local cgrdW, cgrdH		= 0,0
		popupNameGrid			= guiCreateGridList ( grdX, grdY, ngrdW, ngrdH, false, popupWnd )
		--popupContentGrid		= guiCreateGridList ( )
	-----------------------------------------------------------------------------------------------------------------------
	end
	addEventHandler ( "onClientGUIClick", popupWnd,
		function ( )
			if getElementType ( source ) == "gui-button" then
				if source == popupAccept then
					if header == text.resetHeader then resetHandling ( )
					end
				end
				destroyElement	( popupWnd )
				guiSetVisible	( mainWnd.window,	true )
				guiSetVisible	( logWnd.window,	true )
				playSoundFrontEnd ( 32 )
			end
		end
	)
	
	playSoundFrontEnd ( 5 )
end