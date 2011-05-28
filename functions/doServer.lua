--|| ***************************************************************************************************************** [[--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          functions/doServer.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating serverside functions
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

updateForAll                = false
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
logFile                     = nil
xmlSaves                    = nil
xmlDefaults                 = nil
xmlSavesTable               = {}
xmlDefaultsTable            = {}
strHandling                 = {}
--------------------------------------------------------------------------------------------------------------------------
hProperty = { 
              "model","mass","turnMass","dragCoeff","centerOfMass",
              "percentSubmerged","tractionMultiplier","tractionLoss","tractionBias","numberOfGears","maxVelocity",
              "engineAcceleration","engineInertia","driveType","engineType","brakeDeceleration","brakeBias","ABS",
              "steeringLock","suspensionForceLevel","suspensionDamping","suspensionHighSpeedDamping","suspensionUpperLimit",
              "suspensionLowerLimit","suspensionFrontRearBias","suspensionAntiDiveMultiplier","seatOffsetDistance",
              "collisionDamageMultiplier","monetary","modelFlags","handlingFlags","headLight","tailLight","animGroup"
            }
--------------------------------------------------------------------------------------------------------------------------
vModel    = {
              ["LANDSTAL"] = "400", ["BRAVURA"]   = "401", ["BUFFALO"]   = "402", ["LINERUN"]   = "403", ["PEREN"]     = "404",
              ["SENTINEL"] = "405", ["DUMPER"]    = "406", ["FIRETRUCK"] = "407", ["TRASH"]     = "408", ["STRETCH"]   = "409",
              ["MANANA"]   = "410", ["INFERNUS"]  = "411", ["VOODOO"]    = "412", ["PONY"]      = "413", ["MULE"]      = "414",
              ["CHEETAH"]  = "415", ["AMBULAN"]   = "416", ["LEVIATHN"]  = "417", ["MOONBEAM"]  = "418", ["ESPERANT"]  = "419",
              ["TAXI"]     = "420", ["WASHING"]   = "421", ["BOBCAT"]    = "422", ["MRWHOOP"]   = "423", ["BFINJECT"]  = "424",
              ["HUNTER"]   = "425", ["PREMIER"]   = "426", ["ENFORCER"]  = "427", ["SECURICAR"] = "428", ["BANSHEE"]   = "429",
              ["PREDATOR"] = "430", ["BUS"]       = "431", ["RHINO"]     = "432", ["BARRACKS"]  = "433", ["HOTKNIFE"]  = "434",
              ["ARTICT1"]  = "435", ["PREVION"]   = "436", ["COACH"]     = "437", ["CABBIE"]    = "438", ["STALLION"]  = "439",
              ["RUMPO"]    = "440", ["RCBANDIT"]  = "441", ["ROMERO"]    = "442", ["PACKER"]    = "443", ["MONSTER"]   = "444",
              ["ADMIRAL"]  = "445", ["SQUALO"]    = "446", ["SEASPAR"]   = "447", ["MOPED"]     = "448", ["TRAM"]      = "449",
              ["ARTICT2"]  = "450", ["TURISMO"]   = "451", ["SPEEDER"]   = "452", ["REEFER"]    = "453", ["TROPIC"]    = "454",
              ["FLATBED"]  = "455", ["YANKEE"]    = "456", ["GOLFCART"]  = "457", ["SOLAIR"]    = "458", ["TOPFUN"]    = "459",
              ["SEAPLANE"] = "460", ["BIKE"]      = "461", ["MOPED"]     = "462", ["FREEWAY"]   = "463", ["RCBARON"]   = "464",
              ["RCRAIDER"] = "465", ["GLENDALE"]  = "466", ["OCEANIC"]   = "467", ["DIRTBIKE"]  = "468", ["SPARROW"]   = "469",
              ["PATRIOT"]  = "470", ["QUADBIKE"]  = "471", ["COASTGRD"]  = "472", ["DINGHY"]    = "473", ["HERMES"]    = "474",
              ["SABRE"]    = "475", ["RUSTLER"]   = "476", ["ZR350"]     = "477", ["WALTON"]    = "478", ["REGINA"]    = "479",
              ["COMET"]    = "480", ["BMX"]       = "481", ["BURRITO"]   = "482", ["CAMPER"]    = "483", ["MARQUIS"]   = "484",
              ["BAGGAGE"]  = "485", ["DOZER"]     = "486", ["MAVERICK"]  = "487", ["COASTMAV"]  = "488", ["RANCHER"]   = "489",
              ["FBIRANCH"] = "490", ["VIRGO"]     = "491", ["GREENWOO"]  = "492", ["CUPBOAT"]   = "493", ["HOTRING"]   = "494",
              ["SANDKING"] = "495", ["BLISTAC"]   = "496", ["POLMAV"]    = "497", ["BOXVILLE"]  = "498", ["BENSON"]    = "499",
              ["MESA"]     = "500", ["RCGOBLIN"]  = "501", ["HOTRING"]   = "502", ["HOTRING"]   = "503", ["BLOODRA"]   = "504",
              ["RANCHER"]  = "505", ["SUPERGT"]   = "506", ["ELEGANT"]   = "507", ["JOURNEY"]   = "508", ["CHOPPERB"]  = "509",
              ["MTB"]      = "510", ["BEAGLE"]    = "511", ["CROPDUST"]  = "512", ["STUNT"]     = "513", ["PETROL"]    = "514",
              ["RDTRAIN"]  = "515", ["NEBULA"]    = "516", ["MAJESTIC"]  = "517", ["BUCCANEE"]  = "518", ["SHAMAL"]    = "519",
              ["HYDRA"]    = "520", ["FCR900"]    = "521", ["NRG500"]    = "522", ["HPV1000"]   = "523", ["CEMENT"]    = "524",
              ["TOWTRUCK"] = "525", ["FORTUNE"]   = "526", ["CADRONA"]   = "527", ["FBITRUCK"]  = "528", ["WILLARD"]   = "529",
              ["FORKLIFT"] = "530", ["TRACTOR"]   = "531", ["COMBINE"]   = "532", ["FELTZER"]   = "533", ["REMINGTN"]  = "534",
              ["SLAMVAN"]  = "535", ["BLADE"]     = "536", ["FREIGHT"]   = "537", ["STREAK"]    = "538", ["VORTEX"]    = "539",
              ["VINCENT"]  = "540", ["BULLET"]    = "541", ["CLOVER"]    = "542", ["SADLER"]    = "543", ["FIRETRUK"]  = "544",
              ["HUSTLER"]  = "545", ["INTRUDER"]  = "546", ["PRIMO"]     = "547", ["CARGOBOB"]  = "548", ["TAMPA"]     = "549",
              ["SUNRISE"]  = "550", ["MERIT"]     = "551", ["UTILITY"]   = "552", ["NEVADA"]    = "553", ["YOSEMITE"]  = "554",
              ["WINDSOR"]  = "555", ["MTRUCK_A"]  = "556", ["MTRUCK_B"]  = "557", ["URANUS"]    = "558", ["JESTER"]    = "559",
              ["SULTAN"]   = "560", ["STRATUM"]   = "561", ["ELEGY"]     = "562", ["RAINDANC"]  = "563", ["RCTIGER"]   = "564",
              ["FLASH"]    = "565", ["TAHOMA"]    = "566", ["SAVANNA"]   = "567", ["BANDITO"]   = "568", ["FREIFLAT"]  = "569",
              ["CSTREAK"]  = "570", ["KART"]      = "570", ["MOWER"]     = "572", ["DUNE"]      = "573", ["SWEEPER"]   = "574",
              ["BROADWAY"] = "575", ["TORNADO"]   = "576", ["AT400"]     = "577", ["DFT30"]     = "578", ["HUNTLEY"]   = "579",
              ["STAFFORD"] = "580", ["BF400"]     = "581", ["NEWSVAN"]   = "582", ["TUG"]       = "583", ["PETROTR"]   = "584",
              ["EMPEROR"]  = "585", ["WAYFARER"]  = "586", ["EUROS"]     = "587", ["HOTDOG"]    = "588", ["CLUB"]      = "589",
              ["FREIFLAT"] = "590", ["ARTICT3"]   = "591", ["ANDROM"]    = "592", ["DODO"]      = "593", ["RCCAM"]     = "594",
              ["LAUNCH"]   = "595", ["POLICE_LA"] = "596", ["POLICE_SF"] = "597", ["POLICE_VG"] = "598", ["POLRANGER"] = "599",
              ["PICADOR"]  = "600", ["SWATVAN"]   = "601", ["ALPHA"]     = "602", ["PHOENIX"]   = "603", ["GLENDALE"]  = "604",
              ["SADLER"]   = "605", ["BAGBOXA"]   = "606", ["BAGBOXB"]   = "607", ["STAIRS"]    = "608", ["BOXBURG"]   = "609",
              ["FARM_TR1"] = "610", ["UTIL_TR1"]  = "611"
            }
--------------------------------------------------------------------------------------------------------------------------
multiHandling = {
    ["MOPED"]    = { "448", "462" },
    ["HOTRING"]  = { "494", "502", "503" },
    ["FREIFLAT"] = { "569", "590" }
}
--------------------------------------------------------------------------------------------------------------------------
addEvent ( "saveTheHandling", true )
addEvent ( "loadTheHandling", true )
addEvent ( "setHandling",     true )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "onResourceStart", resourceRoot,
    function ( )
        local saves   = 0
        local customs = 0
        ------------------------------------------------------------------------------------------------------------------
        loadDefaultsOnStart = get ( "loadDefaultsOnStart" )
        showWelcomeMessage  = get ( "showWelcomeMessage" )
        ------------------------------------------------------------------------------------------------------------------
        local exists  = fileExists ( "heditLog.txt" )
        if not exists then logFile = fileCreate ( "heditLog.txt" )
        else logFile = fileOpen ( "heditLog.txt" ) end
        ------------------------------------------------------------------------------------------------------------------
        local saveRes = getResourceFromName ( "hedit_saves" )
        if not saveRes then
            saveRes = createResource ( "hedit_saves" )
            if saveRes then
                addResourceConfig ( ":hedit_saves/saves.xml",    "client" )
                addResourceConfig ( ":hedit_saves/defaults.xml", "client" )
            end
        end
        ------------------------------------------------------------------------------------------------------------------
        xmlSaves    = xmlLoadFile ( ":hedit_saves/saves.xml" )
        xmlDefaults = xmlLoadFile ( ":hedit_saves/defaults.xml" )
        if not xmlSaves    then xmlSaves    = addResourceConfig ( ":hedit_saves/saves.xml",    "client" ) end
        if not xmlDefaults then xmlDefaults = addResourceConfig ( ":hedit_saves/defaults.xml", "client" ) end
        
        startResource ( saveRes )
        
        for uIndex,uNode in ipairs ( xmlNodeGetChildren ( xmlSaves ) ) do
            local aName       = xmlNodeGetAttribute ( uNode, "account" )
            xmlSavesTable[aName]   = {}
            xmlSavesTable[aName].u = uNode
            for sIndex,sNode in ipairs ( xmlNodeGetChildren ( uNode ) ) do
                local sName = string.lower ( xmlNodeGetAttribute ( sNode, "name" ) )
                local hConf = xmlFindChild ( sNode, "handling", 0 )
                xmlSavesTable[aName][sName]   = {}
                xmlSavesTable[aName][sName].h = {}
                xmlSavesTable[aName][sName].s = sNode
                xmlSavesTable[aName][sName].i = hConf
                saves = saves + 1
                for k,v in pairs ( xmlNodeGetAttributes ( hConf ) ) do
                    xmlSavesTable[aName][sName].h[k] = v
                end
            end
        end
        
        for uIndex,uNode in ipairs ( xmlNodeGetChildren ( xmlDefaults ) ) do
            local model = xmlNodeGetAttribute ( uNode, "model" )
            xmlDefaultsTable[model]   = {}
            xmlDefaultsTable[model].h = {}
            xmlDefaultsTable[model].u = uNode
            if loadDefaultsOnStart == "true" then customs = customs + 1 end
            for k,v in pairs ( xmlNodeGetAttributes ( uNode ) ) do
                if k ~= "model" then
                    local modelID = tonumber( model )
                    if modelID then
                        xmlDefaultsTable[model].h[k] = v
                        if loadDefaultsOnStart == "true" then
                            setModelHandling ( modelID, k, stringToHandling ( k, v ) )
                            for num,veh in ipairs ( getElementsByType ( "vehicle" ) ) do
                                if getElementModel ( veh ) == modelID then
                                    setVehicleHandling ( veh, k, stringToHandling ( k, v ) )
                                end
                            end
                        end
                    end
                end
            end
        end
        ------------------------------------------------------------------------------------------------------------------
        if showWelcomeMessage == "true" then
            print ( "===============================================================================" )
            print ( " HANDLING EDITOR BY REMI-X [V2.0 unstable]" )
            print ( " Loaded "..saves.." saved handlings." )
            print ( " Loaded "..customs.." custom handlings." )
            print ( "===============================================================================" )
            if fileExists ( "handling.cfg" ) then
                print ( " Handling.cfg found." )
                print ( " Type 'loadcfg' to load handling.cfg into the memory." )
                print ( " After this, you can import the handling into defaults.xml." )
            else
                print ( " No handling.cfg found to import." )
                print ( " Ensure the file is located in the root of this resource in order to load." )
            end
            print ( "===============================================================================" )
        end
    end
)
--------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "onResourceStop", resourceRoot, function ( )       fileClose     ( logFile )
                                                                     xmlUnloadFile ( xmlSaves )    
                                                                     xmlUnloadFile ( xmlDefaults )                                 end )
addEventHandler ( "onPlayerJoin",   root,         function ( )       setElementData ( source, "hAccount", "guest" )                end )
addEventHandler ( "onPlayerLogin",  root,         function ( _,acc ) setElementData ( source, "hAccount", getAccountName ( acc ) ) end )
addEventHandler ( "onPlayerLogout", root,         function ( )       setElementData ( source, "hAccount", "guest" )                end )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function saveHandling ( veh, aName, sName, log )
    if not xmlSavesTable[aName] then
        xmlSavesTable[aName] = {}
        xmlSavesTable[aName].u = xmlCreateChild ( xmlSaves, "user" )
        xmlNodeSetAttribute ( xmlSavesTable[aName].u, "account", aName )
        xmlNodeSetAttribute ( xmlSavesTable[aName].u, "name",    pName )
    end
    ----------------------------------------------------------------------------------------------------------------------
    if not xmlSavesTable[aName][sName] then
        xmlSavesTable[aName][sName]   = {}
        xmlSavesTable[aName][sName].h = {}
        xmlSavesTable[aName][sName].s = xmlCreateChild ( xmlSavesTable[aName].u,        "save"     )
        xmlSavesTable[aName][sName].i = xmlCreateChild ( xmlSavesTable[aName][sName].s, "handling" )
        xmlNodeSetAttribute ( xmlSavesTable[aName][sName].s, "name", sName )
    end
    ----------------------------------------------------------------------------------------------------------------------
    xmlNodeSetAttribute ( xmlSavesTable[aName][sName].i, "model", getElementModel ( veh ) )
    for k,v in pairs ( getVehicleHandling ( veh ) ) do
        local str = handlingToString ( v )
        xmlNodeSetAttribute ( xmlSavesTable[aName][sName].i, k, str )
        xmlSavesTable[aName][sName].h[k] = str
    end
    ----------------------------------------------------------------------------------------------------------------------
    xmlSaveFile        ( xmlSaves )
    triggerClientEvent ( source, "outputLog", source, log.saved, 0 )
    restartResource    ( getResourceFromName ( "hedit_saves" ) )
end
addEventHandler ( "saveTheHandling", root, saveHandling )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function loadHandling ( veh, aName, sName, log )
    if xmlSaves and xmlSavesTable[aName][sName] then
        for k,v in pairs ( xmlSavesTable[aName][sName].h ) do
            if k ~= "model" then
                setVehicleHandling ( veh, k, stringToHandling ( k, v ) )
            end
        end
        triggerClientEvent ( source, "outputLog", source, log.loaded, 0 )
    end
end
addEventHandler ( "loadTheHandling", root, loadHandling )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addCommandHandler ( "loaddefaults",
    function ( player )
        if getElementType ( player ) ~= "console" then return end
        local loaded = 0
        local found = 0
        print ( "[HEDIT] Loading defaults.xml on all vehicles..." )
        setTimer ( function ( )
            for model,pedobear in pairs ( xmlDefaultsTable ) do
                if xmlDefaultsTable[model] and xmlDefaultsTable[model].h then
                    found = found + 1
                    local modelID = tonumber( model )
                    if modelID then
                        loaded = loaded + 1
                        for k,v in pairs ( xmlDefaultsTable[model].h ) do
                            if k ~= "model" then
                                setModelHandling ( modelID, k, stringToHandling ( k, v ) )
                                for num,veh in ipairs ( getElementsByType ( "vehicle" ) ) do
                                    if getElementModel ( veh ) == modelID then
                                        setVehicleHandling ( veh, k, stringToHandling ( k, v ) )
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if found == 0 then
                print ( "[HEDIT] No handling entries found. Make sure defaults.xml is correct." )
            elseif loaded == 0 then
                print ( "[HEDIT] No usable handling entries found in "..found.." entries." )
            else
                print ( "[HEDIT] Loaded "..loaded.." of "..found.." handling entries." )
            end
        end, 500, 1 )
    end
)
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addCommandHandler ( "loadcfg",
    function ( player )
        if getElementType ( player ) ~= "console" then return end
        if fileExists ( "handling.cfg" ) then
            print ( "[HEDIT] Loading handling.cfg into the memory. This may take a while." )
            line = 1
            setTimer ( function ( )
            local file        = fileOpen ( "handling.cfg" )
            local size        = fileGetSize ( file )
            local ignore      = false
            local waitForLine = false
            local addingEntry = false
            local byte        = nil
            local bytes       = 0
            for b=0,size do
                byte  = fileRead ( file, 1 )
                bytes = b
                if ( byte==";"  or
                     byte=="!"  or
                     byte=="%"  or 
                     byte=="$"  or
                     byte=="^" ) then
                    ignore      = true
                    waitForLine = false
                elseif byte=="\r" or byte=="\n" then waitForLine = true
                else
                    if waitForLine then
                        waitForLine = false
                        ignore      = false
                        if addingEntry then 
                            line = line + 1
                            addingEntry = false
                        end
                    end
                    if not ignore and not waitForLine then
                        if not strHandling[line] then strHandling[line] = byte
                        else strHandling[line] = strHandling[line]..byte end
                        addingEntry = true
                    end
                end
            end
            fileClose ( file )
            if line > 0 then
                print ( "[HEDIT] Loaded "..line.." handling entries from "..bytes.." bytes into the memory.")
                print ( "[HEDIT] Type 'importcfg' to import the handling entries into defaults.xml." )
                print ( "[HEDIT] This may take some time." )
                addCommandHandler ( "importcfg", function ( player )
                    if getElementType ( player ) ~= "console" then
                        return end
                    print ( "[HEDIT] Importing "..line.." handling entries into defaults.xml." )
                    print ( "[HEDIT] This may take a while. Please wait." )
                    setTimer ( function ( )
                        local start = getTickCount ( )
                        if xmlDefaults then
                            local import = 0
                            for entry=1,line do
                                local tbl = unpackHandling ( strHandling[entry] )
                                if tbl[1] then
                                    if multiHandling[tbl[1]] then
                                        for num,id in ipairs ( multiHandling[tbl[1]] ) do
                                            if not xmlDefaultsTable[id] then
                                                xmlDefaultsTable[id]   = {}
                                                xmlDefaultsTable[id].u = xmlCreateChild ( xmlDefaults, "handling" )
                                            end
                                            for i,v in ipairs ( tbl ) do
                                                if i == 1 then
                                                    xmlNodeSetAttribute ( xmlDefaultsTable[id].u, hProperty[i], id )
                                                else
                                                    xmlNodeSetAttribute ( xmlDefaultsTable[id].u, hProperty[i], v )
                                                end
                                            end
                                        end
                                    else
                                        if vModel[tbl[1]] then tbl[1] = vModel[tbl[1]] end
                                        if not xmlDefaultsTable[tbl[1]] then
                                            xmlDefaultsTable[tbl[1]]   = {}
                                            xmlDefaultsTable[tbl[1]].u = xmlCreateChild ( xmlDefaults, "handling" )
                                        end
                                        for i,v in ipairs ( tbl ) do
                                            xmlNodeSetAttribute ( xmlDefaultsTable[tbl[1]].u, hProperty[i], v )
                                        end
                                    end
                                    import = import + 1
                                else
                                    print ( "[HEDIT] Unable to unpack handling entry "..entry.."." )
                                end
                            end
                            if import > 0 then
                                xmlSaveFile ( xmlDefaults )
                                removeCommandHandler ( "importcfg" )
                                local stop = getTickCount ( )
                                print ( "[HEDIT] Imported "..import.." of "..line.." handling entries in "..round(stop-start).." ms." )
                                print ( "[HEDIT] Type 'loaddefaults' to apply the handling entries right now." )
                                if loadDefaultsOnStart then
                                    print ( "[HEDIT] Handlings will also be loaded on next resource start." )
                                end
                            else print ( "[HEDIT] Unable to import." ) end
                        else print ( "[HEDIT] Unable to open defaults.xml." ) end
                    end, 500, 1 )
                end
            )
            else
                print ( "[HEDIT] No handling entries found in "..bytes.." bytes!")
                print ( "[HEDIT] Make sure handling.cfg is correct and try again." )
            end
            end, 500, 1 )
        else print ( "[HEDIT] No handling.cfg found. Make sure it's in the root of this resource." ) end
    end
)
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addEvent ( "stopTheResource", true )
addEventHandler ( "stopTheResource", root, function ( ) stopResource ( getThisResource ( ) ) end )
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
addEventHandler ( "setHandling", root,
    function ( veh, handling, data, bool, dname, log )
        local d = handlingToString ( data )
        ------------------------------------------------------------------------------------------------------------------
        local pName    = getPlayerName ( source )
        local vName    = getVehicleName ( veh )
        local vModel   = getElementModel ( veh )
        local hCurrent = getVehicleHandling ( veh )[handling]
        local time     = getRealTime ( )
        local tStamp   = string.format ( "[%02d:%02d:%02d]", time.hour, time.minute, time.second )
        if logFile then
            local size = fileGetSize ( logFile )
            fileSetPos ( logFile, size )
            if type ( hCurrent ) == "table" then hCurrent = tostring(round(hCurrent[1])..", "..round(hCurrent[2])..", "..round(hCurrent[3])) end
            fileWrite ( logFile, tStamp.." "..pName.." changed his "..vName.."("..vModel..")".." "..handling.." from "..hCurrent.." to "..d.."\r\n" )
            fileFlush ( logFile )
        end
        ------------------------------------------------------------------------------------------------------------------
        if setTheHandling ( bool, veh, handling, data ) then
            str = string.format ( log.succes, dname, d )
            lvl = 0
        else
            str = string.format ( log.unable, dname, d )
            lvl = 2
        end
        ------------------------------------------------------------------------------------------------------------------
        triggerClientEvent ( source, "outputLog", source, str, lvl )
    end
)
--------------------------------------------------------------------------------------------------------------------------
function setTheHandling ( bool, veh, handling, data )
    if bool == false then return setModelHandling ( getElementModel ( veh ), handling, data )
    else return setVehicleHandling ( veh, handling, data ) end
end
--------------------------------------------------------------------------------------------------------------------------
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
--------------------------------------------------------------------------------------------------------------------------
function round(num) if type(num)=="number" then return tonumber ( string.format ( "%.3f", num ) ) else return num end end
--------------------------------------------------------------------------------------------------------------------------
function handlingToString ( d )
    if type(d) == "table" then return tostring(round(d[1])..", "..round(d[2])..", "..round(d[3]))
    else return tostring ( round ( d ) ) end
end
--------------------------------------------------------------------------------------------------------------------------
function stringToHandling ( property, str )
    if property == "centerOfMass" then
        local vX  = round ( tonumber ( gettok ( str, 1, 44 ) ) )
        local vY  = round ( tonumber ( gettok ( str, 2, 44 ) ) )
        local vZ  = round ( tonumber ( gettok ( str, 3, 44 ) ) )
              str = { vX, vY, vZ }
    elseif property == "ABS" then if str == "true" then str = true else str = false end
    elseif property == "modelFlags" or property == "handlingFlags" then
        str = tonumber ( "0x"..str )
    elseif property == "driveType" then
        if     str == "F" then str = "fwd"
        elseif str == "R" then str = "rwd"
        elseif str == "4" then str = "awd"
        end
    elseif property == "engineType" then
        if     str == "E" then str = "electric"
        elseif str == "P" then str = "petrol"
        elseif str == "D" then str = "diesel"
        end
    else
        str = tonumber ( str )
    end
    return str
end
--------------------------------------------------------------------------------------------------------------------------
function unpackHandling ( str )
    local tbl = {}
    local i = 1
    local com = true
    for w in string.gmatch ( str, "[^%s]+" ) do
        if i == 8 and com then 
            i = 6
            com = false
        end
        if (i==6 or i==7) and com then tbl[5] = tbl[5]..", "..w
        else tbl[i] = w end
        i=i+1
    end
    return tbl
end