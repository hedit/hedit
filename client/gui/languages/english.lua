guiLanguage.english = {
    windowHeader = "Handling Editor v"..EDITOR_VERSION.." r"..EDITOR_REVISION.." - By Remi-X",
    
    restrictedPassenger = "You are not allowed to edit the handling as a passenger.",
    needVehicle = "You need a vehicle in order to open the handling editor! You can't just edit some air :V",
    needLogin = "You need to be logged in in order to view this menu.",
    needAdmin = "You need to be an administrator in order to access this menu.",
    invalidMenu = "This menu does not exist!",
    disabledMenu = "Sorry, this menu has been disabled from access.",
    notifyUpdate = "The handling editor has been updated since the last time you've used it. Would you like to see a list of changes now? \nYou can always see the list of changes at 'Extra > Updates'",
    notifyUpgrade = "The handling editor has been UPGRADED. This means some of your files, such as saved handlings have been changed to another format. As a result, servers with an outdated version of hedit are not fully supported.\nWould you like to see a list of changes now? \nYou can always see the list of changes at 'Extra > Updates'",
    outdatedUpdate = "This server runs an outdated version of the handling editor. Because if this, there might be some features you are missing.\nPlease contact the serverowner to update his version of the handling editor.",
    outdatedUpgrade = "This server runs an extremely outdated version of the handling editor. Because of this, some of your files may be newer than the ones this server supports.\nPlease contact the serverowner to update his version of the handling editor as soon as possible!",
    notifyHandlingDelete = "As of MTA 1.2, your saved handlings are NOT present anymore. Would you like to see how you can solve this?\nYou can always see it later at the 'help' menu.",
    
    sameValue = "The %s is already that!",
    exceedLimits = "Value used at %s exceeded limits [%s]!",
    cantSameValue = "%s cant be the same as %s!",
    needNumber = "You need to use a number!",
    unsupportedProperty = "%s is not supported by MTA.",
    successRegular = "%s set to %s.",
    successHex = "%s %s.",
    unableToChange = "Unable to set the %s to %s!",
    
    resetted = "Succesfully restted the vehicle handling!",
    loaded = "Successfully loaded your handling!",
    imported = "Succesfully imported that handling!",
    invalidImport = "Invalid handling line, can't import!",
    
    confirmReplace = "Are you sure to overwrite the existing save?",
    confirmLoad = "Are you sure to load this handling? Unsaved changes will be lost!",
    confirmDelete = "Are you sure to delete this handling?",
    confirmReset = "Are you sure to reset your handling with the given base vehicle? Unsaved changes will be lost!",
    confirmImport = "Are you sure to import this handling? Unsaved changes will be lost!",

    successSave = "Successfully saved your handling!",
    successLoad = "Successfully loaded your handling!",
    
    wantTheSettings = "Are you sure you want these settings? The editor will rebuild itself.",
    
    vehicle = "Vehicle",
    unsaved = "Unsaved",
    
    clickToEdit = "Click this button to edit the value.",
    enterToSubmit = "Once you are done, press enter to confirm.",
    clickToViewFullLog = "Click to view the complete vehicle log",
    copiedToClipboard = "The handling line has been copied to your clipboard!",
    
    special = {
        commode = {
            "Splitted",
            "Merged"
        }
    },
    
    utilbuttons = {
        handling = "Handling",
        tools = "Tools",
        extra = "Extra",
        close = "X"
    },

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
    
    menuinfo = {
        engine = {
            shortname = "Engine",
            longname = "Engine settings"
        },
        body = {
            shortname = "Body",
            longname = "Body & suspension settings"
        },
        wheels = {
            shortname = "Wheels",
            longname = "Wheel settings"
        },
        appearance = {
            shortname = "Appearance",
            longname = "Appearance settings"
        },
        modelflags = {
            shortname = "Modelflags",
            longname = "Vehicle model settings"
        },
        handlingflags = {
            shortname = "Handlingflags",
            longname = "Special handling settings"
        },
        dynamometer = {
            shortname = "Dyno",
            longname = "Start dynamometer"
        },
        help = {
            shortname = "Help",
            longname = "Help",
            itemtext = {
                textlabel = "Hello, and welcome to the MTA 1.2 mass beta test! You probably came here because of a problem: All your saved handlings are gone.\n"..
                            "Well unfortunately, the handling editor can't do anything to this. MTA 1.2 uses another installation folder than MTA 1.1, and thus your saves are located somewhere else.\n"..
                            "Luckily: Uou don't have to be affraid for losing them forever. There are two ways to get your handlings back:\n"..
                            " - You can EXPORT all your handlings from MTA 1.1, save them at your desktop, and import them again with 1.2. But this requires a lot of work.\n"..
                            " - Thats why I reccomand you the easier way, migrating your old saves file to MTA 1.2. Please go to the following link, and follor the 'Migrate' tutorial. This will help your out!",
                websitebox = "http://hedit.googlecode.com/",
                morelabel = "Well, hopefully the rest goes well. If something goes wrong, dont hestitate to ask the admins on the beta test :)"
            }
        },
        reset = {
            shortname = "Reset",
            longname = "Reset handling",
            itemtext = {
                label = "Base vehicle:",
                combo = "-----",
                button = "Reset handling"
            }
        },
        save = {
            shortname = "Save",
            longname = "Save your current handling",
            itemtext = {
                nameLabel = "Name",
                descriptionLabel = "Description",
                button = "Save the handling"
            }
        },
        load = {
            shortname = "Load",
            longname = "Load a saved handling",
            itemtext = {
                button = "Load selected save"
            }
        },
        import = {
            shortname = "Import",
            longname = "Import handlingline from handling.cfg",
            itemtext = {
                button = "Import",
                III = "III",
                VC = "VC",
                SA = "SA",
                IV = "IV"
            }
        },
        export = {
            shortname = "Export",
            longname = "Export handling to handling.cfg usable line",
            itemtext = {
                button = "Copy to clipboard"
            }
        },
        get = {
            shortname = "Get",
            longname = "Get a handling from another player"
        },
        share = {
            shortname = "Share",
            longname = "Share your handling with another player"
        },
        upload = {
            shortname = "Upload",
            longname = "Upload your handling to the server"
        },
        download = {
            shortname = "Download",
            longname = "Download a handling from the server"
        },
        resourcesave = {
            shortname = "Resource save",
            longname = "Save your handling to a resource"
        },
        resourceload = {
            shortname = "Resource load",
            longname = "Load a handling from a resource"
        },
        options = {
            shortname = "Options",
            longname = "Options",
            itemtext = {
                label_key = "Key to toggle the editor:",
                label_cmd = "Command to toggle the editor:",
                label_template = "GUI template:",
                label_language = "Text language:",
                label_commode = "Center Of Mass edit mode:",
                button_save = "Save changes"
            }
        },
        administration = {
            shortname = "Administration",
            longname = "Administrator tools"
        },
        handlinglog = {
            shortname = "Handlinglog",
            longname = "Handling log"
        },
        updatelist = {
            shortname = "Updates",
            longname = "15 latest updates"
        }
    },
    
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