--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          config/text/english.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       English Language File
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

loadTranslation["english"] = function ( )
    text.header                 = "Handling Editor "..HEDIT_VERSION.." - By Remi-X"
    text.hr                     = "____________________________________________________"
    text.loading                = "Loading the Handling Editor. Please wait...\nThis could take a few seconds."
    text.restrictedPassenger    = "#ff0000HANDLING EDITOR:#ffff00 You are not allowed to edit the handling as a passenger."
    text.incorrectTemplate      = "HANDLING EDITOR: Incorrect/corrupted template. Default template has been loaded."
    text.invalidTemplate        = "HANDLING EDITOR: No such template with that name. Default template has been loaded."
    text.noDefaultTemplate      = "HANDLING EDITOR: Default template has not been found or is incorrect. Please fix. HandlingEditor will not work now."
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    clog.same                   = "The %s is already that!"
    clog.invalid                = "Invalid %s!"
    clog.needNumber             = "You need to use a number!"
    clog.noAccount              = "You are not logged in! Please login first."
    clog.saving                 = "Saving your handling..."
    clog.loading                = "Loading that handling..."
    slog.succes                 = "%s set to %s."
    slog.unable                 = "Unable to set the %s to %s!"
    slog.saved                  = "Your handling has been succesfully saved!"
    slog.loaded                 = "That handling has been succesfully loaded!"
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    mInfo[ mProperty[1] ]       = "Engine Options"
    mInfo[ mProperty[2] ]       = "Body options"
    mInfo[ mProperty[3] ]       = "Wheel & Brakes"
    mInfo[ mProperty[4] ]       = "Appearance"
    mInfo[ mProperty[5] ]       = "Model Flags"
    mInfo[ mProperty[6] ]       = "Handling Flags"
    mInfo[ mProperty[7] ]       = "Dynamometer Options"
    mInfo[ mProperty[8] ]       = "Help Page"
    mInfo[ mProperty[9] ]       = "Handling log"
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[1] ]   = { "Vehicle Identifier", "", "" }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[2] ]   = {
                                  "Mass",
                                  "Sets the weight of your vehicle in KG.",
                                  "Integer",                    -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[3] ]   = {
                                  "Turn Mass",
                                  "Used to calculate motion effects.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[4] ]   = {
                                  "Drag Multiplier",
                                  "Changes resistance to movement.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[5] ]   = {
                                  "Centre Of Mass", 
                                  "Sets the point where all the weight of your vehicle will go to in meters.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[6] ]   = iProperty[ hProperty[5] ]
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[7] ]   = iProperty[ hProperty[5] ]
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[8] ]   = {
                                  "Percent Submerged",
                                  "Sets how deep your vehicle needs to be in the water before it will float in percent.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[9] ]   = {
                                  "Traction Multiplier",
                                  "Sets the amount of grip your vehicle will have while cornering.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[10] ]  = {
                                  "Traction Loss",
                                  "Sets the amount of grip your vehicle will have when accelerating and decelerating.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[11] ]  = {
                                  "Traction Bias",
                                  "Sets where all the grip of your wheels will go to.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[12] ]  = {
                                  "Number of Gears",
                                  "Sets the number of gears you want to have on your vehicle.",
                                  "Integer",                    -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[13] ]  = {
                                  "Maximum Velocity",
                                  "Sets the maximum speed of your vehicle in KM/H.",
                                  "Float",                      -- ***LIMITS***
                                  "Velocity is in KM/H."
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[14] ]  = {
                                  "Acceleration",
                                  "Sets the acceleration in MS^2 of your vehicle.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[15] ]  = {
                                  "Inertia",
                                  "Smooths or sharpens the acceleration curve.",
                                  "Float,",                     -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[16] ]  = {
                                  "Drive Type",
                                  "Sets the type of driving for your vehicle.",
                                  "String",                     -- ***LIMITS***
                                  "fwd = Front Wheel Drive\nrwd = Rear Wheel Drive\nawd = All Wheel Drive"
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[17] ]  = {
                                  "Engine Type",
                                  "Sets the type of  engine for your vehicle.",
                                  "String",                     -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[18] ]  = {
                                  "Brake Deceleration",
                                  "Sets your deceleration in MS^2.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[19] ]  = {
                                  "Brake Bias",
                                  "Sets the main position of the brakes.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[20] ]  = {
                                  "Anti-Lock Braking",
                                  "Enable or disable ABS on your vehicle.",
                                  "Bool",                       -- ***LIMITS***
                                  "true = Enable ABS\nfalse = Disable ABS"
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[21] ]  = {
                                  "Steering Lock",
                                  "Sets the maximum angle your vehicle can steer.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[22] ]  = {
                                  "Suspension Force Level",
                                  "Explanation Here",           -- ***EXPLANATION***
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[23] ]  = {
                                  "Suspension Damping Level",
                                  "Explanation Here",           -- ***EXPLANATION***
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[24] ]  = {
                                  "Suspension Highspeed Damping",
                                  "Sets the stiffer your suspension will be when driving faster.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[25] ]  = {
                                  "Suspension Upper Limit",
                                  "Explanation Here",           -- ***EXPLANATION***
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[26] ]  = {
                                  "Suspension Lower Limit",
                                  "Explanation Here",           -- ***EXPLANATION***
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[27] ]  = {
                                  "Suspension Bias",
                                  "Sets where most of the suspension power will go to.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[28] ]  = {
                                  "Suspension Anti-Dive Multiplier",
                                  "Changes the amount of body pitching under braking and acceleration.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[29] ]  = {
                                  "Seat Offset Distance",
                                  "Sets how far the seat is from the door of your vehicle.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[30] ]  = {
                                  "Collision Damage Multiplier",
                                  "Sets the damage your vehicle will get from collisions.",
                                  "Float",                      -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[31] ]  = {
                                  "Monetary Value",
                                  "Sets the exact price of your vehicle.",
                                  "Integer",                    -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[32] ]  = {
                                  "Model Flags",
                                  "Explanation Here",           -- ***EXPLANATION***
                                  "Flag",                       -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[33] ]  = {
                                  "Handling Flags",
                                  "Explanation Here",           -- ***EXPLANATION***
                                  "Flag",                       -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[34] ]  = {
                                  "Front Lights",
                                  "Sets the type of front lights your vehicle will have.",
                                  "Integer",                    -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[35] ]  = {
                                  "Rear Lights",
                                  "Sets the type of rear lights your vehicle will have.",
                                  "Integer",                    -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[36] ]  = {
                                  "Vehicle Anim Group",
                                  "Sets the group of animation your ped will use for it's vehicle.",
                                  "Integer",                    -- ***LIMITS***
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
end
