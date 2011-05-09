--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			functions/menu/menuSwitch.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Showing and updating the correct menus
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]
function updateData ( cm )
	if not cm then cm		= getElementData ( localPlayer, "currentMenu" ) end
	local veh				= getPedOccupiedVehicle ( localPlayer )
	if veh then
		local config		= {}
		for i=1,content[cm] do
			config[i]		= getVehicleHandling ( veh, hData[cm].h[i] )
			if (cm=="transmission") and (i==5 or i==6 or i==9) then
				if		(i==5)	then guiComboBoxSetSelected ( hedit[i], cDriveType[ config[i] ] )
				elseif	(i==6)	then guiComboBoxSetSelected ( hedit[i], cEngineType[ config[i] ] )
				elseif	(i==9)	then guiComboBoxSetSelected ( hedit[i], tostring(cABS[ config[i] ]) )
				end
			elseif (cm=="suspension") and (i==4) then
				local com	= {getVehicleHandling ( veh, hData[cm].h[i] )}
				guiSetText	(
							hedit[i],
							tostring	( round(com[1],3) ) ..","
							..tostring	( round(com[2],3) ) ..","
							..tostring	( round(com[3],3) )
							)
			elseif (cm=="other") and (i==3 or i==4 or i==6) then
				if (i==3) or (i==4) then guiComboBoxSetSelected ( hedit[i], cLightType[ config[i] ] )
				elseif (i==6) then guiComboBoxSetSelected ( hedit[i], cAnimType[ config[i] ] )
				end
			else
				guiSetText ( hedit[i], tostring(round(config[i],3)) )
			end
		end
	end
end
--------------------------------------------------------------------------------
-- ////////////////////////////////////////////////////////////////////////// --
--------------------------------------------------------------------------------
function showData ( m )
	if guiGetVisible ( mainWnd.window ) then
		destroyMenuChildren ( )
		hideUtilMenu ( )
		if m == "test" then
		elseif m == "help" then
		else
			for i=1,content[m] do
				local gX, gY = guiGetPosition ( defHedit[i], false )
				guiSetText ( label[i], hName[m].h[i] )
				guiSetVisible ( label[i], true )
				if (m=="transmission") and (i==5 or i==6) then
					hedit[i] = guiCreateComboBox ( gX, gY, 106, 80, "", false, mainWnd.window )
					if i==5 then
						guiComboBoxAddItem ( hedit[5], "fwd" )
						guiComboBoxAddItem ( hedit[5], "rwd" )
						guiComboBoxAddItem ( hedit[5], "awd" )
					else
						guiComboBoxAddItem ( hedit[6], "petrol" )
						guiComboBoxAddItem ( hedit[6], "diesel" )
						guiComboBoxAddItem ( hedit[6], "electric" )
					end
				elseif (m=="transmission") and (i==9) then
					hedit[i] = guiCreateComboBox ( gX, gY, 106, 66, "", false, mainWnd.window )
					guiComboBoxAddItem ( hedit[9], "true" )
					guiComboBoxAddItem ( hedit[9], "false" )
				elseif (m=="other") and (i==3 or i==4) then
					hedit[i] = guiCreateComboBox ( gX, gY, 106, 95, "", false, mainWnd.window )
					guiComboBoxAddItem ( hedit[i], "long" )
					guiComboBoxAddItem ( hedit[i], "small" )
					guiComboBoxAddItem ( hedit[i], "tall" )
					guiComboBoxAddItem ( hedit[i], "big" )
				elseif (m=="other") and (i==6) then
					hedit[i] = guiCreateComboBox ( gX, gY, 106, 200, "", false, mainWnd.window )
					guiComboBoxAddItem ( hedit[i], "todo" )
				else
					hedit[i] = guiCreateButton ( gX, gY, 106, 20, "", false, mainWnd.window )
				end
				setElementData ( hedit[i], "heditButton", i )
			end
			updateData ( m )
		end
		setElementData ( localPlayer, "currentMenu", m )
	end
end