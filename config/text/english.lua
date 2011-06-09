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
    text.restrictedPassenger    = "#ff0000HANDLING EDITOR:#ffff00 You are not allowed to edit the handling as a passenger."
    text.incorrectTemplate      = "#ff0000HANDLING EDITOR:#ffff00 Incorrect/corrupted template.[%s] Default template has been loaded."
    text.invalidTemplate        = "#ff0000HANDLING EDITOR:#ffff00 No such template with name %s. Default template has been loaded."
    text.noDefaultTemplate      = "#ff0000HANDLING EDITOR:#ffff00 Default template has not been found or is incorrect. Please fix. HandlingEditor will not work now."
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
    iProperty[ hProperty[1] ]   = { "Vehicle Identifier", "", "", "" }
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
                                  "Model Flags",
                                  "Special animation features.",
                                  "Flag",
                                  "still need to add syntax"    -- ***SYNTAX***
                                  }
    -------------------------------------------------------------------------------------------------------------------------
    iProperty[ hProperty[33] ]  = {
                                  "Handling Flags",
                                  "Special performance features.",
                                  "Flag",
                                  "still need to add syntax"    -- ***SYNTAX***
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
