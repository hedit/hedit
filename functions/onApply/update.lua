--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			functions/onApply/update.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Updating handling data in a correct way
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

local lVeh			= nil

function updateHandlingData ( )
	local cVeh = getPedOccupiedVehicle ( localPlayer )
	if cVeh ~= lVeh then
		showData ( "transmission" )
		lVeh = cVeh
	else
		updateData ( getElementData(localPlayer,"currentMenu") )
	end
end