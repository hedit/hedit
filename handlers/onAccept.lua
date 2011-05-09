--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			handlers/onAccept.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Manage the onAccept events
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function onComboBoxAccept ( )
	local boxText		= guiComboBoxGetItemText ( source, guiComboBoxGetSelected ( source ) )
	local veh			= getPedOccupiedVehicle ( localPlayer )
	local cm			= getElementData ( localPlayer, "currentMenu" )
	local input			= boxText
	----------------------------------------------------------------------------------------------------------------------
	for i,v in ipairs ( hedit ) do
		if source == hedit[i] then
			if (cm=="transmission") and (i==9) then
				if		input == "true"		then input = true
				elseif	input == "false"	then input = false
				end
			end
			doTry ( veh, input, boxText, cm, i )
			break
		end
	end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function onEditBoxAccept ( box )
	if box == openedHandlingBox then
		oldGuiText = ""
		guiSetText ( mainWnd.info, oldGuiText )
		------------------------------------------------------------------------------------------------------------------
		local boxText		= guiGetText ( openedHandlingBox )
		local veh			= getPedOccupiedVehicle ( localPlayer )
		local cm			= getElementData ( localPlayer, "currentMenu" )
		local input			= tonumber ( boxText )
		------------------------------------------------------------------------------------------------------------------
		if cm == "suspension" and not guiGetVisible ( hedit[4] ) then
			local	vX		= gettok ( boxText, 1, 44 )
			local	vY		= gettok ( boxText, 2, 44 )
			local	vZ		= gettok ( boxText, 3, 44 )
					input	= { vX, vY, vZ }
			doTry	( veh, input, boxText, cm, 4 )
		else
			if input then
				for i,v in ipairs ( hedit ) do
					if not guiGetVisible ( hedit[i] ) then
						doTry ( veh, input, boxText, cm, i )
						break
					end
				end
			else
				outputHandlingLog ( log.needNumber, 2 )
			end
		end
		------------------------------------------------------------------------------------------------------------------
		for i,v in ipairs ( hedit ) do
			if isElement ( hedit[i] ) then
				guiSetVisible ( hedit[i], true )
			end
		end
		------------------------------------------------------------------------------------------------------------------
		destroyElement ( box )
	end
end

--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------

function doTry ( veh, input, txt, cm, num )
	if (type(input)=="table") then
		local d_Table = {getVehicleHandling(veh,hData[cm].h[num])}
		for i=1,#input do input[i] = tonumber(input[i]) end
		if (type(input[1])=="number" and type(input[2])=="number" and type(input[3])=="number") then
			if (input[1]==d_Table[1]) and (input[2]==d_Table[2]) and (input[3]==d_Table[3]) then
				return outputHandlingLog(string.format(log.same,hName[cm].h[num]),1)
			else
				if	(input[1]<min[cm].h[num]) or (input[1]>max[cm].h[num]) and
					(input[2]<min[cm].h[num]) or (input[2]>max[cm].h[num]) and
					(input[3]<min[cm].h[num]) or (input[3]>max[cm].h[num]) then
					return outputHandlingLog(string.format(log.invalid,hName[cm].h[num]).." ["..txt.."]",2)
				else
					if triggerServerEvent("setHandling",localPlayer,veh,hData[cm].h[num],input,individualHandling,hName[cm].h[num],txt,log) then
						guiSetText ( hedit[num], input )
					else
						return outputHandlingLog(log.unableToCallServer,0)
					end
				end
			end
		else
			outputHandlingLog(log.needNumber,2)
		end
	else
		if (input==getVehicleHandling(veh,hData[cm].h[num])) then
			return outputHandlingLog(string.format(log.same,hName[cm].h[num]),1)
		else
			if (type(input)=="number") then
				if (input<min[cm].h[num]) or (input>max[cm].h[num]) then
					return outputHandlingLog(string.format(log.invalid,hName[cm].h[num]).." ["..txt.."]",2)
				end
			end
			if triggerServerEvent("setHandling",localPlayer,veh,hData[cm].h[num],input,individualHandling,hName[cm].h[num],txt,log) then
				guiSetText ( hedit[num], input )
			else
				return outputHandlingLog(log.unableToCallServer,0)
			end
		end
	end
end