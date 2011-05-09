--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			config/limits.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Setting the limits.
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

-- VEHICLE IDENTIFIER
minLimit[ hProperty[1] ]	= false
maxLimit[ hProperty[1] ]	= false

-- MASS
minLimit[ hProperty[2] ]	= "1.0"
maxLimit[ hProperty[2] ]	= "100000.0"

-- TURNMASS
minLimit[ hProperty[3] ]	= "0.0"
maxLimit[ hProperty[3] ]	= "100000.0"

-- DRAGCOEFF
minLimit[ hProperty[4] ]	= "-100.0"
maxLimit[ hProperty[4] ]	= "100.0"

-- CENTEROFMASS.X
minLimit[ hProperty[5] ]	= "-100.0"
maxLimit[ hProperty[5] ]	= "100.0"

-- CENTEROFMASS.Y
minLimit[ hProperty[6] ]	= "-100.0"
maxLimit[ hProperty[6] ]	= "100.0"

-- CENTEROFMASS.Z
minLimit[ hProperty[7] ]	= "-100.0"
maxLimit[ hProperty[7] ]	= "100.0"

-- PERCENTSUBMERGED
minLimit[ hProperty[8] ]	= "1"
maxLimit[ hProperty[8] ]	= "99999"

-- TRACTIONMULTIPLIER
minLimit[ hProperty[9] ]	= "0.0"
maxLimit[ hProperty[9] ]	= "100000.0"

-- TRACTIONLOSS
minLimit[ hProperty[10] ]	= "0.0"
maxLimit[ hProperty[10] ]	= "100000.0"

-- TRACTIONBIAS
minLimit[ hProperty[11] ]	= "0.0"
maxLimit[ hProperty[11] ]	= "1.0"

-- NUMBEROFGEARS
minLimit[ hProperty[12] ]	= "1"
maxLimit[ hProperty[12] ]	= "5"

-- MAXVELOCITY
minLimit[ hProperty[13] ]	= "0.1"
maxLimit[ hProperty[13] ]	= "200000.0"

-- ENGINEACCELERATION
minLimit[ hProperty[14] ]	= "0.1"
maxLimit[ hProperty[14] ]	= "100000.0"

-- ENGINEINERTIA
minLimit[ hProperty[15] ]	= "-1000.0"
maxLimit[ hProperty[15] ]	= "999999.0"

-- DRIVETYPE
minLimit[ hProperty[16] ]	= false
maxLimit[ hProperty[16] ]	= false

-- ENGINETYPE
minLimit[ hProperty[17] ]	= false
maxLimit[ hProperty[17] ]	= false

-- BRAKEDECELERATION
minLimit[ hProperty[18] ]	= "0.1"
maxLimit[ hProperty[18] ]	= "100000.0"

-- BRAKEBIAS
minLimit[ hProperty[19] ]	= "0.0"
maxLimit[ hProperty[19] ]	= "1.0"

-- ABS
minLimit[ hProperty[20] ]	= false
maxLimit[ hProperty[20] ]	= false

-- STEERINGLOCK
minLimit[ hProperty[21] ]	= "0.0"
maxLimit[ hProperty[21] ]	= "360.0"

-- SUSPENSIONFORCELEVEL
minLimit[ hProperty[22] ]	= "0.1"
maxLimit[ hProperty[22] ]	= "100.0"

-- SUSPENSIONDAMPING
minLimit[ hProperty[23] ]	= "0.1"
maxLimit[ hProperty[23] ]	= "100.0"

-- SUSPENSIONHIGHSPEEDDAMPING
minLimit[ hProperty[24] ]	= "0.1"
maxLimit[ hProperty[24] ]	= "500.0"

-- SUSPENSIONUPPERLIMIT
minLimit[ hProperty[25] ]	= "-50.0"
maxLimit[ hProperty[25] ]	= "50.0"

-- SUSPENSIONLOWERLIMIT
minLimit[ hProperty[26] ]	= "-50.0"
maxLimit[ hProperty[26] ]	= "50.0"

-- SUSPENSIONBIAS
minLimit[ hProperty[27] ]	= "0.0"
maxLimit[ hProperty[27] ]	= "1.0"

-- SUSPENSIONANTIDIVEMULTIPLIER
minLimit[ hProperty[28] ]	= "0.1"
maxLimit[ hProperty[28] ]	= "1000.0"

-- SEAT OFFSET DISTANCE
minLimit[ hProperty[29] ]	= "-10.0"
maxLimit[ hProperty[29] ]	= "10.0"

-- COLLISION DAMAGE MULTIPLIER
minLimit[ hProperty[30] ]	= "0.0"
maxLimit[ hProperty[30] ]	= "10.0"

-- MONETARY VALUE
minLimit[ hProperty[31] ]	= "0"
maxLimit[ hProperty[31] ]	= "230195200"

-- MODELFLAGS
minLimit[ hProperty[32] ]	= false
maxLimit[ hProperty[32] ]	= false

-- HANDLINGFLAGS
minLimit[ hProperty[33] ]	= 11111111
maxLimit[ hProperty[33] ]	= 88888888

-- HEADLIGHT
minLimit[ hProperty[34] ]	= false
maxLimit[ hProperty[34] ]	= false

-- TAILLIGHT
minLimit[ hProperty[35] ]	= false
maxLimit[ hProperty[35] ]	= false

-- ANIMGROUP
minLimit[ hProperty[36] ]	= false
maxLimit[ hProperty[36] ]	= false