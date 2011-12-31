guiLanguage.english = {
    --
    -- GENERAL STRINGS
    --
    windowHeader = "Handling Editor v"..HVER.." r"..HREV,
    
    restrictedPassenger = "You are not allowed to use the handling editor as a passenger.",
    needVehicle = "You must be driving a vehicle to use the handling editor!",
    needLogin = "You must be logged in in order to view this menu.",
    needAdmin = "You must be logged in as an administrator to access this menu.",
    invalidMenu = "This menu does not exist!",
    disabledMenu = "This menu has been disabled.",
    notifyUpdate = "The handling editor has been updated since the last time you've used it. Would you like to see a list of changes now? \nYou can always see the list of changes at 'Extra > Updates'",
    notifyUpgrade = "The handling editor has been UPGRADED. This means some of your files, such as saved handlings have been changed to another format. As a result, servers with an outdated version of hedit are not fully supported.\nWould you like to see a list of changes now? \nYou can always see the list of changes at 'Extra > Updates'",
    outdatedUpdate = "This server runs an outdated version of the handling editor. As a result, some features may be missing.\nPlease contact an administrator.",
    outdatedUpgrade = "This server runs an extremely outdated version of the handling editor. As a result, all settings/saved handling settings are incompatible.\nPlease contact an administrator.",
    mtaUpdate = "If you have any saved handlings on MTA 1.1, your handlings are no longer compatible; please visit 'http://hedit.googclecode.com/' for details.",
    
    sameValue = "The %s is already that!",
    exceedLimits = "Value used at %s exceeds the limit. [%s]!",
    cantSameValue = "%s may not the same as %s!",
    needNumber = "You must use a number!",
    unsupportedProperty = "%s is not a supported property.",
    successRegular = "%s set to %s.",
    successHex = "%s %s.",
    unableToChange = "Unable to set the %s to %s!",
	disabledProperty = "Editing %s is disabled on this server!",
    
    resetted = "Succesfully reset the vehicle's handling settings!",
    loaded = "Successfully loaded your handling settings!",
    imported = "Succesfully imported the handling settings!",
    invalidImport = "Import failed; the handling data you provided is invalid!",
    invalidSave = "Please provide a valid name and description to save this vehicle's handling data!",
    
    confirmReplace = "Are you sure you would like to overwrite the existing save?",
    confirmLoad = "Are you sure you would like to load these handling settings? Any unsaved changes will be lost!",
    confirmDelete = "Are you sure you would like to delete these handling settings?",
    confirmReset = "Are you sure you would like to reset your handling? Any unsaved changes will be lost!",
    confirmImport = "Are you sure you would like to import this handling? Any unsaved changes will be lost!",

    successSave = "Successfully saved your handling settings!",
    successLoad = "Successfully loaded your handling settings!",
    
	confirmVersionReset = "Are you sure you want to set your editor version number to the one of this server? Your saved handlings may become incompatible.",
	successVersionReset = "Your editor version has been updated.",
    wantTheSettings = "Are you sure you would like to apply these settings? The handling editor will restart.",
    
    vehicle = "Vehicle",
    unsaved = "Unsaved",
    
    clickToEdit = "Click to edit.",
    enterToSubmit = "Press enter to confirm.",
    clickToViewFullLog = "Click to view the complete vehicle log.",
    copiedToClipboard = "The handling settings have been copied to the clipboard!",
    
    special = {
        commode = {
            "Split",
            "Merged"
        }
    },
    
    --
    -- BUTTON / MENU STRINGS
    --
    
    --Warning level strings
    warningtitles = {
        info = "Information",
        question = "Question",
        warning = "Warning!",
        ["error"] = "Error!"
    },
    --Strings for the buttons at the top
    utilbuttons = {
        handling = "Handling",
        tools = "Tools",
        extra = "Extra",
        close = "X"
    },

    --Strings for the buttons at the right
    menubuttons = {
        engine = "Engine",
        body = "Body",
        wheels = "Wheels",
        appearance = "Look",
        modelflags = "Model\nFlags",
        handlingflags = "Handling\nFlags",
        dynamometer = "Dyno",
        help = "Help"
    },
    
    --Strings for the various menus of the editor. Empty strings are placeholder to avoid debug as the debug is meant to show items which are missing text.
    menuinfo = {
        engine = {
            shortname = "Engine",
            longname = "Engine Settings"
        },
        body = {
            shortname = "Body",
            longname = "Body & Suspension Settings"
        },
        wheels = {
            shortname = "Wheels",
            longname = "Wheel Settings"
        },
        appearance = {
            shortname = "Appearance",
            longname = "Appearance Settings"
        },
        modelflags = {
            shortname = "Model Flags",
            longname = "Vehicle Model Settings"
        },
        handlingflags = {
            shortname = "Handling Flags",
            longname = "Special Handling Settings"
        },
        dynamometer = {
            shortname = "Dyno",
            longname = "Start Dynamometer"
        },
        help = {
            shortname = "Help and Information",
            longname = "Help",
            itemtext = {
                textlabel = "Welcome to the official MTA handling editor! This resource allows you to edit the handling of any vehicle in-game in real time.\n"..
                            "You can save and load custom handlings you make, via the 'Handling' menu at the top right.\n"..
                            "For more information about this handling editor, such as the official changelog, visit:\n",
                websitebox = "http://hedit.googlecode.com/",
                morelabel = "Thank you for choosing hedit!"
            }
        },
        reset = {
            shortname = "Reset",
            longname = "Reset this vehicle's handling settings.",
            itemtext = {
                label = "Base Vehicle:",
                combo = "-----",
                button = "Reset"
            }
        },
        save = {
            shortname = "Save",
            longname = "Save this vehicle's handling settings.",
            itemtext = {
                nameLabel = "Name",
                descriptionLabel = "Description",
                button = "Save",
                grid = "",
                nameEdit = "",
                descriptionEdit = ""
            }
        },
        load = {
            shortname = "Load",
            longname = "Load a set of handling settings.",
            itemtext = {
                button = "Load",
                grid = ""
            }
        },
        import = {
            shortname = "Import",
            longname = "Import a handling line in handling.cfg format.",
            itemtext = {
                button = "Import",
                III = "III",
                VC = "VC",
                SA = "SA",
                IV = "IV",
                memo = ""
            }
        },
        export = {
            shortname = "Export",
            longname = "Export the handling settings in handling.cfg format.",
            itemtext = {
                button = "Copy to Clipboard",
                memo = ""
            }
        },
        get = {
            shortname = "Get",
            longname = "Get handling settings from another player."
        },
        share = {
            shortname = "Share",
            longname = "Share your handling settings with another player."
        },
        upload = {
            shortname = "Upload",
            longname = "Upload your handling settings to the server."
        },
        download = {
            shortname = "Download",
            longname = "Download a set of handling settings from the server."
        },
        
        resourcesave = {
            shortname = "Resource save",
            longname = "Save your handling to a resource."
        },
        resourceload = {
            shortname = "Resource load",
            longname = "Load a handling from a resource."
        },
        options = {
            shortname = "Options",
            longname = "Options",
            itemtext = {
                label_key = "Toggle Key",
                label_cmd = "Toggle Command:",
                label_template = "GUI template:",
                label_language = "Language:",
                label_commode = "Center Of Mass edit mode:",
                checkbox_versionreset = "Downgrade my version number from %s to %s?",
                button_save = "Apply",
                combo_key = "",
                combo_template = "",
                edit_cmd = "",
                combo_commode = "",
                combo_language = "",
				checkbox_lockwhenediting = "Lock vehicle when editing?"
            }
        },
        administration = {
            shortname = "Administration",
            longname = "Administrator tools."
        },
        handlinglog = {
            shortname = "Handling Log",
            longname = "Log of recent changes to handling settings.",
            itemtext = {
                logpane = ""
            }
        },
        updatelist = {
            shortname = "Updates",
            longname = "List of recent updates.",
            itemtext = {
                scrollpane = ""
            }
        },
        mtaversionupdate = {
            shortname = "MTA Update",
            longname = "Multi Theft Auto has been updated!",
            itemtext = {
                infotext = "Multi Theft Auto has been updated. Because of this, your saved handlings in the previous version are no longer compatible. Please visit the link below for help and get your handlings back.",
                websitebox = "http://hedit.googlecode.com/"
            }
        }
    },
    
    --
    --NOTE: 12/17/2011 This section is pending review for typos and grammar.
    --
    handlingPropertyInformation = { 
        ["identifier"] = {
            friendlyName = "Vehicle Identifier",
            information = "This represents the vehicle identifier to be used in handling.cfg.",
            syntax = { "String", "Only use valid identifiers, otherwise exporting wont work." }
        },
        ["mass"] = {
            friendlyName = "Mass",
            information = "Sets the weight of your vehicle in KG.",
            syntax = { "Float", "Remember to change the 'turnMass' first to avoid bouncing!" }
        },
        ["turnMass"] = {
            friendlyName = "Turn Mass",
            information = "Used to calculate motion effects.",
            syntax = { "Float", "Higher values make your vehicle a bit more 'floaty'." }
        },
        ["dragCoeff"] = {
            friendlyName = "Drag Multiplier",
            information = "Changes resistance to movement.",
            syntax = { "Float", "The higher the value, the lower your top speed will get." }
        },
        ["centerOfMass"] = {
            friendlyName = "Center Of Mass",
            information = "Sets the gravity point of your vehicle, in metres.",
            syntax = { "Float", "Hover X, Y, or Z for information." }
        },
        ["centerOfMassX"] = {
            friendlyName = "Center Of Mass X",
            information = "Sets the front-rear distance of the center of mass in metres.",
            syntax = { "Float", "Higher values values are to the front, lower to the back." }
        },
        ["centerOfMassY"] = {
            friendlyName = "Center Of Mass Y",
            information = "Sets the left-right distance of the center of mass in metres.",
            syntax = { "Float", "Higher values are to the right and lower values to the left." }
        },
        ["centerOfMassZ"] = {
            friendlyName = "Center Of Mass Z",
            information = "Sets the height of the center of mass in metres.",
            syntax = { "Float", "The higher the value, the higher the point will be." }
        },
        ["percentSubmerged"] = {
            friendlyName = "Percent Submerged",
            information = "Sets how deep your vehicle needs to be in the water before it will float in percent.",
            syntax = { "Integer", "Higher values will make your vehicle floating deeper." }
        },
        ["tractionMultiplier"] = {
            friendlyName = "Traction Multiplier",
            information = "Sets the amount of grip your vehicle will have while cornering.",
            syntax = { "Float", "Higher values will make your vehicle have more grip." }
        },
        ["tractionLoss"] = {
            friendlyName = "Traction Loss",
            information = "Sets the amount of grip your vehicle will have when accelerating and decelerating.",
            syntax = { "Float", "Higher values will make your vehicle cut corners better." }
        },
        ["tractionBias"] = {
            friendlyName = "Traction Bias",
            information = "Sets where all the grip of your wheels will go to.",
            syntax = { "Float", "Higher values will set the bias more to the front." }
        },
        ["numberOfGears"] = {
            friendlyName = "Number Of Gears",
            information = "Sets the number of gears you want to have on your vehicle.",
            syntax = { "Integer", "Has no effect on top speed or acceleration." }
        },
        ["maxVelocity"] = {
            friendlyName = "Maximum Velocity",
            information = "Sets the maximum speed of your vehicle in KM/H.",
            syntax = { "Float", "Affected by other properties." }
        },
        ["engineAcceleration"] = {
            friendlyName = "Acceleration",
            information = "Sets the acceleration in MS^2 of your vehicle.",
            syntax = { "Float", "Higher values will increase the rate the vehicle accelerates." }
        },
        ["engineInertia"] = {
            friendlyName = "Inertia",
            information = "Smooths or sharpens the acceleration curve.",
            syntax = { "Float", "Higher values make the acceleration curve more smooth." }
        },
        ["driveType"] = {
            friendlyName = "Drivetype",
            information = "Sets what wheels will be used when driving.",
            syntax = { "String", "Choosing 'All wheels' will result in the vehicle being easier to control." },
            options = { ["f"]="Front wheels",["r"]="Rear wheels",["4"]="All wheels" }
        },
        ["engineType"] = {
            friendlyName = "Enginetype",
            information = "Sets the type of  engine for your vehicle.",
            syntax = { "String", "[UNKNOWN]" },
            options = { ["p"]="Petrol",["d"]="Diesel",["e"]="Electric" }
        },
        ["brakeDeceleration"] = {
            friendlyName = "Brake Deceleration",
            information = "Sets your deceleration in MS^2.",
            syntax = { "Float", "Higher values will make the braking stronger, but may slip if your traction is too low." }
        },
        ["brakeBias"] = {
            friendlyName = "Brake Bias",
            information = "Sets the main position of the brakes.",
            syntax = { "Float", "Higher values will put the bias more to the front." }
        },
        ["ABS"] = {
            friendlyName = "ABS",
            information = "Enable or disable ABS on your vehicle.",
            syntax = { "Bool", "No effect." },
            options = { ["true"]="Enabled",["false"]="Disabled" }
        },
        ["steeringLock"] = {
            friendlyName = "Steering Lock",
            information = "Sets the maximum angle your vehicle can steer.",
            syntax = { "Float", "Steering angle gets lower the faster you go." }
        },
        ["suspensionForceLevel"] = {
            friendlyName = "Suspension Force Level",
            information = "Unknown effects.",
            syntax = { "Float", "Unknown." }
        },
        ["suspensionDamping"] = {
            friendlyName = "Suspension Damping",
            information = "Unknown effects.",
            syntax = { "Float", "Unknown." }
        },
        ["suspensionHighSpeedDamping"] = {
            friendlyName = "Suspension High Speed Damping",
            information = "Sets the stiffer your suspension will be when driving faster.",
            syntax = { "Float", "UNTESTED" } -- HERE
        },
        ["suspensionUpperLimit"] = {
            friendlyName = "Suspension Upper Limit",
            information = "Uppermost movement of wheels in metres.",
            syntax = { "Float", "UNTESTED" } -- HERE
        },
        ["suspensionLowerLimit"] = {
            friendlyName = "Suspension Lower Limit",
            information = "The height of your suspension.",
            syntax = { "Float", "Lower values will make your vehicle higher." }
        },
        ["suspensionFrontRearBias"] = {
            friendlyName = "Suspension Bias",
            information = "Sets where most of the suspension power will go to.",
            syntax = { "Float", "Higher values will put the bias more to the front." }
        },
        ["suspensionAntiDiveMultiplier"] = {
            friendlyName = "Suspension Anti Dive Multiplier",
            information = "Changes the amount of body pitching under braking and acceleration.",
            syntax = { "Float", "" }
        },
        ["seatOffsetDistance"] = {
            friendlyName = "Seat Offset Distance",
            information = "Sets how far the seat is from the door of your vehicle.",
            syntax = { "Float", "" }
        },
        ["collisionDamageMultiplier"] = {
            friendlyName = "Collision Damage Multiplier",
            information = "Sets the damage your vehicle will get from collisions.",
            syntax = { "Float", "" }
        },
        ["monetary"] = {
            friendlyName = "Monetary Value",
            information = "Sets the exact price of your vehicle.",
            syntax = { "Integer", "" }
        },
        ["modelFlags"] = {
            friendlyName = "Model Flags",
            information = "Special animations features of the which can be enabled or disabled.",
            syntax = { "Hexadecimal", "" },
            items = {
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
        },
        ["handlingFlags"] = {
            friendlyName = "Handling Flags",
            information = "Special performance features.",
            syntax = { "Hexadecimal", "" },
            items = {
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
        },
        ["headLight"] = {
            friendlyName = "Head Lights",
            information = "Sets the type of front lights your vehicle will have.",
            syntax = { "Integer", "" },
            options = { ["0"]="Long",["1"]="Small",["2"]="Big",["3"]="Tall" }
        },
        ["tailLight"] = {
            friendlyName = "Tail Lights",
            information = "Sets the type of rear lights your vehicle will have.",
            syntax = { "Integer", "" },
            options = { ["0"]="Long",["1"]="Small",["2"]="Big",["3"]="Tall" }
        },
        ["animGroup"] = {
            friendlyName = "Animation Group",
            information = "Sets the group of animation your ped will use for it's vehicle.",
            syntax = { "Integer", "" }
        }
    }
}