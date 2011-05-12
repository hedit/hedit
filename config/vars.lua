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

minLimit                    = {}
maxLimit                    = {}
text                        = {}
log                         = {}
info                        = {}
dyno                        = {}
mInfo                       = {}
menuButton                  = {}
mProperty                   = {}
uProperty                   = {}
hProperty                   = {}
iProperty                   = {}
sProperty                   = {}
hData                       = {}
comboItem                   = {}
uMenuText                   = {}
uItemText                   = {}
hDefault                    = {}
img                         = {}
-------------------------------------------------------------------------------------------------------------------------
isInt                       = {}
isHex                       = {}
canScroll                   = {}
-------------------------------------------------------------------------------------------------------------------------
mainWnd                     = {}
utilButton                  = {}
defHedit                    = {}
label                       = {}
hedit                       = {}
line                        = {}
logWnd                      = {}
-------------------------------------------------------------------------------------------------------------------------
uMenu                       = {}
uItem                       = {}
mButton                     = {}
hLabel                      = {}
hButton                     = {}
buttonMenu                  = {}
-------------------------------------------------------------------------------------------------------------------------
loadTemplate                = {}
loadTranslation             = {}
-------------------------------------------------------------------------------------------------------------------------
history                     = {}
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
cu                          = nil
openedHandlingBox           = nil
hidedHeditButton            = nil
pointedButton               = nil
lVeh                        = nil
-------------------------------------------------------------------------------------------------------------------------
oldGuiText                  = ""
-------------------------------------------------------------------------------------------------------------------------
pSeat                       = -1
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
mProperty[1]                = "transmission"
mProperty[2]                = "suspension"
mProperty[3]                = "advanced"
mProperty[4]                = "dynamometer"
mProperty[5]                = "help"
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
uProperty[1]                = "file"
uProperty[2]                = "options"
uProperty[3]                = "view"
-------------------------------------------------------------------------------------------------------------------------
uItem[ uProperty[1] ]       = { "new", "open", "import", "export", "save", "saveas", "close" }
uItem[ uProperty[2] ]       = {}
uItem[ uProperty[3] ]       = {}
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
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[1] ].h[1]  = hProperty[12]
hData[ mProperty[1] ].h[2]  = hProperty[13]
hData[ mProperty[1] ].h[3]  = hProperty[14]
hData[ mProperty[1] ].h[4]  = hProperty[15]
hData[ mProperty[1] ].h[5]  = hProperty[16]
hData[ mProperty[1] ].h[6]  = hProperty[17]
hData[ mProperty[1] ].h[7]  = hProperty[18]
hData[ mProperty[1] ].h[8]  = hProperty[19]
hData[ mProperty[1] ].h[9]  = hProperty[21]
hData[ mProperty[1] ].h[10] = hProperty[9]
hData[ mProperty[1] ].h[11] = hProperty[10]
hData[ mProperty[1] ].h[12] = hProperty[11]
hData[ mProperty[1] ].h[13] = hProperty[30]
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
hData[ mProperty[2] ].h[13] = hProperty[29]
-------------------------------------------------------------------------------------------------------------------------
hData[ mProperty[3] ].h[1]  = hProperty[36]
hData[ mProperty[3] ].h[2]  = hProperty[32]
hData[ mProperty[3] ].h[3]  = hProperty[33]
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
-------------------------------------------------------------------------------------------------------------------------
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
-------------------------------------------------------------------------------------------------------------------------
img[ mProperty[1] ]         = "images/transmission.png"
img[ mProperty[2] ]         = "images/massusp.png"
img[ mProperty[3] ]         = "images/other.png"
img[ mProperty[4] ]         = "images/test.png"
img[ mProperty[5] ]         = "images/help.png"