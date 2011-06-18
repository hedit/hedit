--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          config/text/english.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       English Language File
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

loadTranslation["english"] = function ( )
    text.header                 = "Handling Editor "..HEDIT_VERSION.." - By Remi-X"
    text.hr                     = "____________________________________________________"
    text.incorrectTemplate      = "#ff0000HANDLING EDITOR:#ffff00 Incorrect/corrupted template.[%s] Default template has been loaded."
    text.invalidTemplate        = "#ff0000HANDLING EDITOR:#ffff00 No such template with name %s. Default template has been loaded."
    text.noDefaultTemplate      = "#ff0000HANDLING EDITOR:#ffff00 Default template has not been found or is incorrect. Please fix. HandlingEditor will not work now."
    text.needVehicle            = "You need a vehicle in order to open the handling editor! You can't just edit some air :V"
    text.restrictedPassenger    = "You are not allowed to edit the handling as a passenger."
    text.login                  = "Please login in order to use this menu."
    text.askToReplace           = "Are you sure to overwrite the existing save?"
    text.askToDelete            = "Are you sure to delete this handling?"
    text.accept                 = "Proceed"
    text.cancel                 = "Cancel"
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    wHeader[0]                  = "Information"
    wHeader[1]                  = "WARNING"
    wHeader[2]                  = "ERROR"
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    utilButtonText[1]           = "File"
    utilButtonText[2]           = "Tools"
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    utilItemText["saveclient"]     = "Save"
    utilItemText["loadclient"]     = "Load"
    utilItemText["uploadshared"]   = "Upload"
    utilItemText["downloadshared"] = "Download"
    utilItemText["sharehandling"]  = "Share"
    utilItemText["import"]         = "Import"
    utilItemText["export"]         = "Export"
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    clog.same                   = "The %s is already that!"
    clog.invalid                = "Invalid %s!"
    clog.cantSame               = "%s cant be the same as %s!"
    clog.needNumber             = "You need to use a number!"
    clog.noAccount              = "You are not logged in! Please login first."
    clog.invalidSave            = "Please refer a save name."
    clog.saved                  = "Your handling has been succesfully saved."
    clog.deletedHandling        = "Deleted handling %s."
    slog.succes                 = "%s set to %s."
    slog.unable                 = "Unable to set the %s to %s!"
    slog.loaded                 = "That handling has been succesfully loaded."
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    mInfo[ mProperty[1] ]        = "Engine Options"
    mInfo[ mProperty[2] ]        = "Body options"
    mInfo[ mProperty[3] ]        = "Wheel & Brakes"
    mInfo[ mProperty[4] ]        = "Appearance"
    mInfo[ mProperty[5] ]        = "Model Flags"
    mInfo[ mProperty[6] ]        = "Handling Flags"
    mInfo[ mProperty[7] ]        = "Dynamometer Options"
    mInfo[ mProperty[8] ]        = "Help Page"
    mInfo[ mProperty[9] ]        = "Handling log"
    mInfo[ mProperty[10] ]       = "Save your handling"
    mInfo[ mProperty[11] ]       = "Load a handling"
    mInfo[ mProperty[12] ]       = "Upload your handling to the server"
    mInfo[ mProperty[13] ]       = "Download more handlings from the server"
    mInfo[ mProperty[14] ]       = "Share your handling with someone else"
    mInfo[ mProperty[15] ]       = "Import a handling designed for handling.cfg"
    mInfo[ mProperty[16] ]       = "Export your handling to a usable handling.cfg line"
    mInfo[ mProperty[17] ]       = "Save your handling to a resource"
    mInfo[ mProperty[18] ]       = "Options"
    mInfo[ mProperty[19] ]       = "Administration panel"
    -------------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[1] ]   = { "Vehicle Identifier", {"",""}, "", "" }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[2] ]   = {
                                  "Mass",
                                  "Sets the weight of your vehicle in KG.",
                                  "Integer",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[3] ]   = {
                                  "Turn Mass",
                                  "Used to calculate motion effects.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[4] ]   = {
                                  "Drag Multiplier",
                                  "Changes resistance to movement.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[5] ]   = {
                                  "Centre Of Mass", 
                                  "Sets the point where all the weight of your vehicle will go to in meters.",
                                  "Float",
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
                                  "Float",
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
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[12] ]  = {
                                  "Number of Gears",
                                  "Sets the number of gears you want to have on your vehicle.",
                                  "Integer",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[13] ]  = {
                                  "Maximum Velocity",
                                  "Sets the maximum speed of your vehicle in KM/H.",
                                  "Float",
                                  "Velocity is in KM/H."
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[14] ]  = {
                                  "Acceleration",
                                  "Sets the acceleration in MS^2 of your vehicle.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[15] ]  = {
                                  "Inertia",
                                  "Smooths or sharpens the acceleration curve.",
                                  "Float,",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[16] ]  = {
                                  "Drive Type",
                                  "Sets the type of driving for your vehicle.",
                                  "String",
                                  "fwd = Front Wheel Drive\nrwd = Rear Wheel Drive\nawd = All Wheel Drive"
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[17] ]  = {
                                  "Engine Type",
                                  "Sets the type of  engine for your vehicle.",
                                  "String",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[18] ]  = {
                                  "Brake Deceleration",
                                  "Sets your deceleration in MS^2.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[19] ]  = {
                                  "Brake Bias",
                                  "Sets the main position of the brakes.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[20] ]  = {
                                  "Anti-Lock Braking",
                                  "Enable or disable ABS on your vehicle.",
                                  "Bool",
                                  "true = Enable ABS\nfalse = Disable ABS"
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[21] ]  = {
                                  "Steering Lock",
                                  "Sets the maximum angle your vehicle can steer.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[22] ]  = {
                                  "Suspension Force Level",
                                  "Unknown effects.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[23] ]  = {
                                  "Suspension Damping Level",
                                  "Unknown effects.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[24] ]  = {
                                  "Suspension Highspeed Damping",
                                  "Sets the stiffer your suspension will be when driving faster.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[25] ]  = {
                                  "Suspension Upper Limit",
                                  "Uppermost movement of wheels in metres.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[26] ]  = {
                                  "Suspension Lower Limit",
                                  "The height of your suspension.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[27] ]  = {
                                  "Suspension Bias",
                                  "Sets where most of the suspension power will go to.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[28] ]  = {
                                  "Suspension Anti-Dive Multiplier",
                                  "Changes the amount of body pitching under braking and acceleration.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[29] ]  = {
                                  "Seat Offset Distance",
                                  "Sets how far the seat is from the door of your vehicle.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[30] ]  = {
                                  "Collision Damage Multiplier",
                                  "Sets the damage your vehicle will get from collisions.",
                                  "Float",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[31] ]  = {
                                  "Monetary Value",
                                  "Sets the exact price of your vehicle.",
                                  "Integer",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[32] ]  = {
        {
            ["1"] = {"IS_VAN","Allows double doors for the rear animation."},
            ["2"] = {"IS_BUS","Vehicle uses bus stops and will try to take on passengers."},
            ["4"] = {"IS_LOW","Drivers and passengers sit lower and lean back."},
            ["8"] = {"IS_BIG","Changes the way that the AI drives around corners."}
        },
        {
            ["1"] = {"REVERSE_BONNET","Bonnet and boot open in opposite direction from normal."},
            ["2"] = {"HANGING_BOOT","Boot opens from top edge."},
            ["4"] = {"TAILGATE_BOOT","Boot opens from bottom edge."},
            ["8"] = {"NOSWING_BOOT","Boot does not open."}
        },
        {
            ["1"] = {"NO_DOORS","Door open and close animations are skipped."},
            ["2"] = {"TANDEM_SEATS","Two people will use the front passenger seat."},
            ["4"] = {"SIT_IN_BOAT","Uses seated boat animation instead of standing."},
            ["8"] = {"CONVERTIBLE","Changes how hookers operate and other small effects."}
        },
        {
            ["1"] = {"NO_EXHAUST","Removes all exhaust particles."},
            ["2"] = {"DBL_EXHAUST","Adds a second exhaust particle on opposite side to first."},
            ["4"] = {"NO1FPS_LOOK_BEHIND","Prevents player using rear view when in first-person mode."},
            ["8"] = {"FORCE_DOOR_CHECK","Needs testing."}
        },
        {
            ["1"] = {"AXLE_F_NOTILT","Front wheels stay vertical to the car like GTA 3."},
            ["2"] = {"AXLE_F_SOLID","Front wheels stay parallel to each other."},
            ["4"] = {"AXLE_F_MCPHERSON","Front wheels tilt like GTA Vice City."},
            ["8"] = {"AXLE_F_REVERSE","Reverses the tilting of wheels when using AXLE_F_MCPHERSON suspension."}
        },
        {
            ["1"] = {"AXLE_R_NOTILT","Rear wheels stay vertical to the car like GTA 3."},
            ["2"] = {"AXLE_R_SOLID","Rear wheels stay parallel to each other."},
            ["4"] = {"AXLE_R_MCPHERSON","Rear wheels tilt like GTA Vice City."},
            ["8"] = {"AXLE_R_REVERSE","Reverses the tilting of wheels when using AXLE_R_MCPHERSON suspension."}
        },
        {
            ["1"] = {"IS_BIKE","Use extra handling settings in the bikes section."},
            ["2"] = {"IS_HELI","Use extra handling settings in the flying section."},
            ["4"] = {"IS_PLANE","Use extra handling settings in the flying section."},
            ["8"] = {"IS_BOAT","Use extra handling settings in the flying section."}
        },
        {
            ["1"] = {"BOUNCE_PANELS","Needs testing."},
            ["2"] = {"DOUBLE_RWHEELS","Places a second instance of each rear wheel next to the normal one."},
            ["4"] = {"FORCE_GROUND_CLEARANCE","Needs testing."},
            ["8"] = {"IS_HATCHBACK","Needs testing."}
        }
    }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[33] ]  = {
        {
            ["1"] = {"1G_BOOST","Gives more engine power for standing starts; better hill climbing."},
            ["2"] = {"2G_BOOST","Gives more engine power at slightly higher speeds."},
            ["4"] = {"NPC_ANTI_ROLL","No body roll when driven by AI characters."},
            ["8"] = {"NPC_NEUTRAL_HANDL","Less likely to spin out when driven by AI characters."}
        },
        {
            ["1"] = {"NO_HANDBRAKE","Disables the handbrake effect."},
            ["2"] = {"STEER_REARWHEELS","Rear wheels steer instead of front, like a forklift truck."},
            ["4"] = {"HB_REARWHEEL_STEER","Handbrake makes the rear wheels steer as well as front, like the monster truck"},
            ["8"] = {"ALT_STEER_OPT","Needs testing."}
        },
        {
            ["1"] = {"WHEEL_F_NARROW2","Very narrow front wheels."},
            ["2"] = {"WHEEL_F_NARROW","Narrow front wheels."},
            ["4"] = {"WHEEL_F_WIDE","Wide front wheels."},
            ["8"] = {"WHEEL_F_WIDE2","Very wide front wheels."}
        },
        {
            ["1"] = {"WHEEL_R_NARROW2","Very narrow rear wheels."},
            ["2"] = {"WHEEL_R_NARROW","Narrow rear wheels."},
            ["4"] = {"WHEEL_R_WIDE","Wide rear wheels."},
            ["8"] = {"WHEEL_R_WIDE2","Very wide rear wheels."}
        },
        {
            ["1"] = {"HYDRAULIC_GEOM","Needs testing."},
            ["2"] = {"HYDRAULIC_INST","Will spawn with hydraulics installed."},
            ["4"] = {"HYDRAULIC_NONE","Hydraulics cannot be installed."},
            ["8"] = {"NOS_INST","Vehicle automatically gets NOS installed when it spawns."}
        },
        {
            ["1"] = {"OFFROAD_ABILITY","Vehicle will perform better on loose surfaces like dirt."},
            ["2"] = {"OFFROAD_ABILITY2","Vehicle will perform better on soft surfaces like sand."},
            ["4"] = {"HALOGEN_LIGHTS","Makes headlights brighter and more blue."},
            ["8"] = {"PROC_REARWHEEL_1ST","Needs testing."}
        },
        {
            ["1"] = {"USE_MAXSP_LIMIT","Prevents vehicle going faster than the maximum speed."},
            ["2"] = {"LOW_RIDER","Allows vehicle to be modified at Loco Low Co shops."},
            ["4"] = {"STREET_RACER","When set, vehicle can only be modified at Wheel Arch Angels."},
            ["8"] = {"UNDEFINED","No effect."}
        },
        {
            ["1"] = {"SWINGING_CHASSIS","Lets the car body move from side to side on the suspension."},
            ["2"] = {"UNDEFINED","No effect."},
            ["4"] = {"UNDEFINED","No effect."},
            ["8"] = {"UNDEFINED","No effect."}
        }
    }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[34] ]  = {
                                  "Front Lights",
                                  "Sets the type of front lights your vehicle will have.",
                                  "Integer",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[35] ]  = {
                                  "Rear Lights",
                                  "Sets the type of rear lights your vehicle will have.",
                                  "Integer",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[36] ]  = {
                                  "Vehicle Anim Group",
                                  "Sets the group of animation your ped will use for it's vehicle.",
                                  "Integer",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
end
