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

limit.minGears				= "1"
limit.maxGears				= "5"		-- *** STADED AS 7 IN HANDLING.CFG ***

limit.minVelocity			= "0.0"		-- *** STATED AS 5.0 IN HANDLING.CFG ***
limit.maxVelocity			= "200000"

limit.minAcceleration		= "0.1"
limit.maxAcceleration		= "100000"

limit.minInertia			= "-1000.0"	-- *** STATED AS 0.0 IN HANDLING.CFG ***
limit.maxInertia			= "1000.0"	-- *** STATED AS 50.0 IN HANDLING.CFG ***

limit.minBrakedecel			= "0.0"		-- *** STATED AS 0.1 IN HANDLING.CFG ***
limit.maxBrakedecel			= "100000.0"-- *** STATED AS 10.0 IN HANDLING.CFG ***

limit.minSteering			= "0.0"		-- *** STATED AS 10.0 IN HANDLING.CFG ***
limit.maxSteering			= "360.0"	-- *** STATED AS 40.0 IN HANDLING.CFG ***

limit.minTractionmult		= "0.0"		-- *** STATED AS 0.5 IN HANDLING.CFG ***
limit.maxTractionmult		= "100000.0"-- *** STATED AS 2.0 IN HANDLING.CFG ***

limit.minTractionloss		= "0.0"
limit.maxTractionloss		= "99999.0"	-- *** STATED AS 1.0 IN HANDLING.CFG ***
-------------------------------------------------------------------------------------------------------------------------
limit.minMass				= "1.0"
limit.maxMass				= "100000.0"-- *** STATED AS 50000.0 IN HANDLING.CFG ***

limit.minTurnmass			= "0.0"
limit.maxTurnmass			= "100000.0"

limit.minDragcoeff			= "-100.0"
limit.maxDragcoeff			= "100.0"

limit.minCentermass			= "-10.0"
limit.maxCentermass			= "10.0"

limit.minSubmerged			= "0"		-- *** STATED AS 10 IN HANDLING.CFG ***
limit.maxSubmerged			= "99999"	-- *** STATED AS 120 IN HANDLING.CFG ***

limit.minForcelevel			= "0.0"
limit.maxForcelevel			= "100.0"

limit.minDamping			= "0.0"
limit.maxDamping			= "100.0"

limit.minHsdamping			= "0.0"
limit.maxHsdamping			= "500.0"

limit.minLowerlimit			= "-50.0"
limit.maxLowerlimit			= "50.0"

limit.minUpperlimit			= "-50.0"
limit.maxUpperlimit			= "50.0"

limit.minAntidive			= "0.0"
limit.maxAntidive			= "30.0"
-------------------------------------------------------------------------------------------------------------------------
limit.minSeatoffset			= "0.0"
limit.maxSeatoffset			= "5.0"

limit.minColdamage			= "0.0"		-- *** STATED AS 0.2 IN HANDLING.CFG ***
limit.maxColdamage			= "10.0"

limit.minMonetary			= "0"
limit.maxMonetary			= tostring(math.huge)
-------------------------------------------------------------------------------------------------------------------------
limit.minBias				= "0.0"
limit.maxBias				= "1.0"
limit.midBias				= (tonumber(limit.minBias)+tonumber(limit.maxBias))/2
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
min["transmission"]			= {h={}}
max["transmission"]			= {h={}}
min["suspension"]			= {h={}}
max["suspension"]			= {h={}}
min["other"]				= {h={}}
max["other"]				= {h={}}
-------------------------------------------------------------------------------------------------------------------------
min["transmission"].h[1]	= tonumber(limit.minGears)
min["transmission"].h[2]	= tonumber(limit.minVelocity)
min["transmission"].h[3]	= tonumber(limit.minAcceleration)
min["transmission"].h[4]	= tonumber(limit.minInertia)
min["transmission"].h[7]	= tonumber(limit.minBrakedecel)
min["transmission"].h[8]	= tonumber(limit.minBias)
min["transmission"].h[10]	= tonumber(limit.minSteering)
min["transmission"].h[11]	= tonumber(limit.minTractionmult)
min["transmission"].h[12]	= tonumber(limit.minTractionloss)
min["transmission"].h[13]	= tonumber(limit.minBias)
-------------------------------------------------------------------------------------------------------------------------
max["transmission"].h[1]	= tonumber(limit.maxGears)
max["transmission"].h[2]	= tonumber(limit.maxVelocity)
max["transmission"].h[3]	= tonumber(limit.maxAcceleration)
max["transmission"].h[4]	= tonumber(limit.maxInertia)
max["transmission"].h[7]	= tonumber(limit.maxBrakedecel)
max["transmission"].h[8]	= tonumber(limit.maxBias)
max["transmission"].h[10]	= tonumber(limit.maxSteering)
max["transmission"].h[11]	= tonumber(limit.maxTractionmult)
max["transmission"].h[12]	= tonumber(limit.maxTractionloss)
max["transmission"].h[13]	= tonumber(limit.maxBias)
-------------------------------------------------------------------------------------------------------------------------
min["suspension"].h[1]		= tonumber(limit.minMass)
min["suspension"].h[2]		= tonumber(limit.minTurnmass)
min["suspension"].h[3]		= tonumber(limit.minDragcoeff)
min["suspension"].h[4]		= tonumber(limit.minCentermass)
min["suspension"].h[5]		= tonumber(limit.minSubmerged)
min["suspension"].h[6]		= tonumber(limit.minForcelevel)
min["suspension"].h[7]		= tonumber(limit.minDamping)
min["suspension"].h[8]		= tonumber(limit.minHsdamping)
min["suspension"].h[9]		= tonumber(limit.minLowerlimit)
min["suspension"].h[10]		= tonumber(limit.minUpperlimit)
min["suspension"].h[11]		= tonumber(limit.minAntidive)
min["suspension"].h[12]		= tonumber(limit.minBias)
-------------------------------------------------------------------------------------------------------------------------
max["suspension"].h[1]		= tonumber(limit.maxMass)
max["suspension"].h[2]		= tonumber(limit.maxTurnmass)
max["suspension"].h[3]		= tonumber(limit.maxDragcoeff)
max["suspension"].h[4]		= tonumber(limit.maxCentermass)
max["suspension"].h[5]		= tonumber(limit.maxSubmerged)
max["suspension"].h[6]		= tonumber(limit.maxForcelevel)
max["suspension"].h[7]		= tonumber(limit.maxDamping)
max["suspension"].h[8]		= tonumber(limit.maxHsdamping)
max["suspension"].h[9]		= tonumber(limit.maxLowerlimit)
max["suspension"].h[10]		= tonumber(limit.maxUpperlimit)
max["suspension"].h[11]		= tonumber(limit.maxAntidive)
max["suspension"].h[12]		= tonumber(limit.maxBias)
-------------------------------------------------------------------------------------------------------------------------
min["other"].h[1]			= tonumber(limit.minSeatoffset)
min["other"].h[2]			= tonumber(limit.minColdamage)
min["other"].h[5]			= tonumber(limit.minMonetary)
-------------------------------------------------------------------------------------------------------------------------
max["other"].h[1]			= tonumber(limit.maxSeatoffset)
max["other"].h[2]			= tonumber(limit.maxColdamage)
max["other"].h[5]			= tonumber(limit.maxMonetary)