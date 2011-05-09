--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			functions/onApply/log.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Outputting log into the log window & playing the succes level sound
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

local labelLine = 0

function outputHandlingLog ( logText, err )
	local pane = logWnd.scrollpane
	local curTime = getRealTime( )
	local hours = curTime.hour
	local minutes = curTime.minute
	local seconds = curTime.second
	---------------------------------------------------------------------------------------------------------------------
	if hours < 10 then hours = "0"..hours end
	if minutes < 10 then minutes = "0"..minutes end
	if seconds < 10 then seconds = "0"..seconds end
	---------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	---------------------------------------------------------------------------------------------------------------------
	local logLabel = guiCreateLabel ( 67, labelLine, 267, 20, logText, false, pane )
	local logTime = guiCreateLabel ( 0, labelLine, 67, 20, "["..hours..":"..minutes..":"..seconds.."]", false, pane )
	labelLine = labelLine + 15
	---------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	---------------------------------------------------------------------------------------------------------------------
	if err == 0 then
		playSoundFrontEnd ( 46 )
	---------------------------------------------------------------------------------------------------------------------
	elseif err == 1 then
		guiLabelSetColor ( logLabel, 227, 214, 0 )
		playSoundFrontEnd ( 33 )
	---------------------------------------------------------------------------------------------------------------------
	elseif err == 2 then
		guiLabelSetColor ( logLabel, 200, 0, 0 )
		playSoundFrontEnd ( 4 ) end
	---------------------------------------------------------------------------------------------------------------------
	-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
	---------------------------------------------------------------------------------------------------------------------
	guiScrollPaneSetVerticalScrollPosition ( pane, 100 )
	updateHandlingData ( )
end

addEvent ( "outputLog", true )
addEventHandler ( "outputLog", root, outputHandlingLog )