--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          config/vars.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Defining variables.
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

scrX, scrY                  = guiGetScreenSize ( )
-------------------------------------------------------------------------------------------------------------------------
minLimit                    = {}
maxLimit                    = {}
-------------------------------------------------------------------------------------------------------------------------
mainWnd                     = {}
utilButton                  = {}
menuButton                  = {}
label                       = {}
defHedit                    = {}
hedit                       = {}
logTime                     = {}
logText                     = {}
-------------------------------------------------------------------------------------------------------------------------
text                        = {}
log                         = {}
mInfo                       = {}
mProperty                   = {}
hProperty                   = {}
iProperty                   = {}
sProperty                   = {}
img                         = {}
-------------------------------------------------------------------------------------------------------------------------\
hData                       = {}
comboItem                   = {}
errColor                    = {}
errSound                    = {}
-------------------------------------------------------------------------------------------------------------------------\
isInt                       = {}
isHex                       = {}
canScroll                   = {}
-------------------------------------------------------------------------------------------------------------------------
mButton                     = {}
hLabel                      = {}
hButton                     = {}
logItem                     = {}
-------------------------------------------------------------------------------------------------------------------------
loadTemplate                = {}
loadTranslation             = {}
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
HEDIT_VERSION_MAJOR         = "2"
HEDIT_VERSION_MINOR         = "0a"
HEDIT_VERSION               = "v"..HEDIT_VERSION_MAJOR.."."..HEDIT_VERSION_MINOR
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
cm                          = nil
openedHandlingBox           = nil
hidedHeditButton            = nil
buttonValue                 = nil
isPointing                  = nil
pointedButton               = nil
lVeh                        = nil
-------------------------------------------------------------------------------------------------------------------------
oldInfoHeader               = ""
oldInfoText                 = ""
-------------------------------------------------------------------------------------------------------------------------
pSeat                       = -1
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
mProperty[1]                = "engine"
mProperty[2]                = "body"
mProperty[3]                = "wheels"
mProperty[4]                = "appearance"
mProperty[5]                = "modelflags"
mProperty[6]                = "handlingflags"
mProperty[7]                = "dyno"
mProperty[8]                = "help"
mProperty[9]                = "log"
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
hProperty[1]                = "vehicleName"
hProperty[2]                = "mass"
hProperty[3]                = "turnMass"
hProperty[4]                = "dragCoeff"
hProperty[5]                = "centerOfMass"        -- pos.X
hProperty[6]                = "centerOfMass"        -- pos.Y
hProperty[7]                = "centerOfMass"        -- pos.Z
hProperty[8]                = "percentSubmerged"
hProperty[9]                = "tractionMultiplier"
hProperty[10]               = "tractionLoss"
hProperty[11]               = "tractionBias"
hProperty[12]               = "numberOfGears"
hProperty[13]               = "maxVelocity"
hProperty[14]               = "engineAcceleration"
hProperty[15]               = "engineInertia"
hProperty[16]               = "driveType"
hProperty[17]               = "engineType"
hProperty[18]               = "brakeDeceleration"
hProperty[19]               = "brakeBias"
hProperty[20]               = "ABS"
hProperty[21]               = "steeringLock"
hProperty[22]               = "suspensionForceLevel"
hProperty[23]               = "suspensionDamping"
hProperty[24]               = "suspensionHighSpeedDamping"
hProperty[25]               = "suspensionUpperLimit"
hProperty[26]               = "suspensionLowerLimit"
hProperty[27]               = "suspensionFrontRearBias"
hProperty[28]               = "suspensionAntiDiveMultiplier"
hProperty[29]               = "seatOffsetDistance"
hProperty[30]               = "collisionDamageMultiplier"
hProperty[31]               = "monetary"
hProperty[32]               = "modelFlags"
hProperty[33]               = "handlingFlags"
hProperty[34]               = "headLight"
hProperty[35]               = "tailLight"
hProperty[36]               = "animGroup"
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[1] ]       = {h={}}
hData[ mProperty[2] ]       = {h={}}
hData[ mProperty[3] ]       = {h={}}
hData[ mProperty[4] ]       = {h={}}
hData[ mProperty[5] ]       = {h={}}
hData[ mProperty[6] ]       = {h={}}
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[1] ].h[1]  = hProperty[12]
hData[ mProperty[1] ].h[2]  = hProperty[13]
hData[ mProperty[1] ].h[3]  = hProperty[14]
hData[ mProperty[1] ].h[4]  = hProperty[15]
hData[ mProperty[1] ].h[5]  = hProperty[16]
hData[ mProperty[1] ].h[6]  = hProperty[17]
hData[ mProperty[1] ].h[7]  = hProperty[21]
hData[ mProperty[1] ].h[8]  = hProperty[30]
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[2] ].h[1]  = hProperty[2]
hData[ mProperty[2] ].h[2]  = hProperty[3]
hData[ mProperty[2] ].h[3]  = hProperty[4]
hData[ mProperty[2] ].h[4]  = hProperty[5]
hData[ mProperty[2] ].h[5]  = hProperty[8]
hData[ mProperty[2] ].h[6]  = hProperty[22]
hData[ mProperty[2] ].h[7]  = hProperty[23]
hData[ mProperty[2] ].h[8]  = hProperty[24]
hData[ mProperty[2] ].h[9]  = hProperty[26]
hData[ mProperty[2] ].h[10] = hProperty[25]
hData[ mProperty[2] ].h[11] = hProperty[28]
hData[ mProperty[2] ].h[12] = hProperty[27]
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[3] ].h[1]  = hProperty[9]
hData[ mProperty[3] ].h[2]  = hProperty[10]
hData[ mProperty[3] ].h[3]  = hProperty[11]
hData[ mProperty[3] ].h[4]  = hProperty[18]
hData[ mProperty[3] ].h[5]  = hProperty[19]
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[4] ].h[1]  = hProperty[36]
hData[ mProperty[4] ].h[2]  = hProperty[29]
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[5] ].h[1]  = hProperty[32]
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[6] ].h[1]  = hProperty[33]
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
errColor[0]                 = { 255, 255, 255 }
errColor[1]                 = { 227, 214, 0   }
errColor[2]                 = { 200, 0,   0   }
-------------------------------------------------------------------------------------------------------------------------
errSound[0]                 = 46
errSound[1]                 = 33
errSound[2]                 = 4
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
comboItem[ hProperty[16] ]  = { "fwd",      "rwd",      "awd"             }
comboItem[ hProperty[17] ]  = { "petrol",   "diesel",   "electric"        }
comboItem[ hProperty[20] ]  = { "true",     "false"                       }
comboItem[ hProperty[34] ]  = { "long",     "small",    "tall",     "big" }
comboItem[ hProperty[35] ]  = { "long",     "small",    "tall",     "big" }
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
isInt[ hProperty[8]  ]      = true
isInt[ hProperty[12] ]      = true
isInt[ hProperty[31] ]      = true
-------------------------------------------------------------------------------------------------------------------------
isHex[ hProperty[32] ]      = true
isHex[ hProperty[33] ]      = true
-------------------------------------------------------------------------------------------------------------------------
canScroll[ hProperty[2] ]   = true
canScroll[ hProperty[3] ]   = true
canScroll[ hProperty[4] ]   = true
canScroll[ hProperty[5] ]   = true
canScroll[ hProperty[6] ]   = true
canScroll[ hProperty[7] ]   = true
canScroll[ hProperty[8] ]   = true
canScroll[ hProperty[9] ]   = true
canScroll[ hProperty[10] ]  = true
canScroll[ hProperty[11] ]  = true
canScroll[ hProperty[12] ]  = true
canScroll[ hProperty[13] ]  = true
canScroll[ hProperty[14] ]  = true
canScroll[ hProperty[15] ]  = true