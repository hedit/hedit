--[[addEventHandler ( "onResourceStart", resourceRoot,
	function ( )
		if not setVehicleHandling then
			setVehicleHandling = function ( veh, data, val )
				if ( getElementType(veh)=="vehicle" ) then
					if ( type(data)=="string" and val or val==false ) then
						if ( data=="mass" ) then
							if ( type(val)=="number" ) then
								if ( val > 1 ) then
									return setElementData ( veh, data, val )
								end
							else
								return false
							end
						elseif ( data=="turnMass" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="dragCoeff") then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="centerOfMass" ) then
							if ( type(val)=="table" ) then
								local vecCenter = {}
								if ( type(val[1])=="number" ) then
									vecCenter.fX = val[1] end
								if ( type(val[2])=="number" ) then
									vecCenter.fY = val[2] end
								if ( type(val[3])=="number" ) then
									vecCenter.fZ = val[3] end
								return setElementData ( veh, data, vecCenter )
							else
								return false
							end
						elseif ( data=="percentSubmerged" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="tractionMultiplier" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="driveType" ) then
							if ( type(val)=="string" ) then
								if ( val=="fwd" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="rwd" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="awd" ) then
									return setElementData ( veh, data, val )
								else
									return false
								end
							else
								return false
							end
						elseif ( data=="engineType" ) then
							if ( type(val)=="string" ) then
								if ( val == "petrol" ) then
									return setElementData ( veh, data, val )
								elseif ( val== "diesel" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="electric" ) then
									return setElementData ( veh, data, val )
								else
									return false
								end
							else
								return false
							end
						elseif ( data=="numberOfGears" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="engineAcceleration" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="engineInertia" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="maxVelocity" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="brakeDeceleration" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="brakeBias" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="ABS" ) then
							if ( type(val)=="boolean" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="steeringLock" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="tractionLoss" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="tractionBias" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="suspensionForceLevel" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="suspensionDamping" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="suspensionHighSpeedDamping" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="suspensionUpperLimit" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="suspensionLowerLimit" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="suspensionFrontRearBias" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="suspensionAntidiveMultiplier" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="collisionDamageMultiplier" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="seatOffsetDistance" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="monetary" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						elseif ( data=="headLight" ) then
							if ( type(val)=="string" ) then
								if ( val=="long" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="small" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="tall" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="big" ) then
									return setElementData ( veh, data, val )
								else
									return false
								end
							else
								return false
							end
						elseif ( data=="tailLight" ) then
							if ( type(val)=="string" ) then
								if ( val=="long" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="small" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="tall" ) then
									return setElementData ( veh, data, val )
								elseif ( val=="big" ) then
									return setElementData ( veh, data, val )
								else
									return false
								end
							else
								return false
							end
						elseif ( data=="animGroup" ) then
							if ( type(val)=="number" ) then
								return setElementData ( veh, data, val )
							else
								return false
							end
						end
					end
				end
			end
		end
	end
)


function getVehicleHandlingData ( veh, handling )
	local hData = getElementData ( veh, handling )
	if handling == "ABS" then
		if hData or hData == false then
			return getElementData ( veh, handling )
		else
			return "empty/invalid"
		end
	else
		if getElementData ( veh, handling ) then
			return getElementData ( veh, handling )
		else
			return "Empty/Invalid"
		end
	end
end]]