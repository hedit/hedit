Data.handlingProperties = { 
    ["identifier"] = {
        input = "string",
        limits = { "", "" },
    },
    ["mass"] = {
        input = "float",
        limits = { "1.0", "100000.0" }
    },
    ["turnMass"] = {
        input = "float",
        limits = { "0.0", "1000000.0" }
    },
    ["dragCoeff"] = {
        input = "float",
        limits = { "0.0", "200.0" }
    },
    ["centerOfMassX"] = {
        input = "float",
        limits = { "-10", "10" }
    },
    ["centerOfMassY"] = {
        input = "float",
        limits = { "-10", "10" }
    },
    ["centerOfMassZ"] = {
        input = "float",
        limits = { "-10", "10" }
    },
    ["percentSubmerged"] = {
        input = "integer",
        limits = { "1", "120" }
    },
    ["tractionMultiplier"] = {
        input = "float",
        limits = { "0.0", "100000.0" }
    },
    ["tractionLoss"] = {
        input = "float",
        limits = { "0.0", "100.0" }
    },
    ["tractionBias"] = {
        input = "float",
        limits = { "0.0", "1.0" }
    },
    ["numberOfGears"] = {
        input = "integer",
        limits = { "1", "5" }
    },
    ["maxVelocity"] = {
        input = "float",
        limits = { "0.1", "200000.0" }
    },
    ["engineAcceleration"] = {
        input = "float",
        limits = { "0.0", "100000.0" }
    },
    ["engineInertia"] = {
        input = "float",
        limits = { "-1000.0", "1000.0" }
    },
    ["driveType"] = {
        input = "string",
        limits = { "", "" },
        options = { "f","r","4" }
    },
    ["engineType"] = {
        input = "string",
        limits = { "", "" },
        options = { "p","d","e" }
    },
    ["brakeDeceleration"] = {
        input = "float",
        limits = { "0.1", "100000.0" }
    },
    ["brakeBias"] = {
        input = "float",
        limits = { "0.0", "1.0" }
    },
    ["ABS"] = {
        input = "boolean",
        limits = { "", "" },
        options = { "true","false" }
    },
    ["steeringLock"] = {
        input = "float",
        limits = { "0.0", "360.0" }
    },
    ["suspensionForceLevel"] = {
        input = "float",
        limits = { "0.0", "100.0" }
    },
    ["suspensionDamping"] = {
        input = "float",
        limits = { "0.0", "100.0" }
    },
    ["suspensionHighSpeedDamping"] = {
        input = "float",
        limits = { "0.0", "600.0" }
    },
    ["suspensionUpperLimit"] = {
        input = "float",
        limits = { "-50.0", "50.0" }
    },
    ["suspensionLowerLimit"] = {
        input = "float",
        limits = { "-50.0", "50.0" }
    },
    ["suspensionFrontRearBias"] = {
        input = "float",
        limits = { "0.0", "1.0" }
    },
    ["suspensionAntiDiveMultiplier"] = {
        input = "float",
        limits = { "0.0", "30.0" }
    },
    ["seatOffsetDistance"] = {
        input = "float",
        limits = { "0.0", "20.0" }
    },
    ["collisionDamageMultiplier"] = {
        input = "float",
        limits = { "0.0", "100.0" }
    },
    ["monetary"] = {
        input = "integer",
        limits = { "0", "230195200" }
    },
    ["modelFlags"] = {
        input = "hexadecimal",
        limits = { "", "" },
    },
    ["handlingFlags"] = {
        input = "hexadecimal",
        limits = { "", "" },
    },
    ["headLight"] = {
        input = "integer",
        limits = { "0", "3" },
        options = { 0,1,2,3 }
    },
    ["tailLight"] = {
        input = "integer",
        limits = { "0", "3" },
        options = { 0,1,2,3 }
    },
    ["animGroup"] = {
        input = "integer",
        limits = { "0", "30" }
    }
}


Data.orderedHandlingProperties = { 
    "identifier", "mass", "turnMass", "dragCoeff", "centerOfMassX", "centerOfMassY",
    "centerOfMassZ", "percentSubmerged", "tractionMultiplier", "tractionLoss", "tractionBias", "numberOfGears",
    "maxVelocity", "engineAcceleration", "engineInertia", "driveType", "engineType", "brakeDeceleration",
    "brakeBias", "ABS", "steeringLock", "suspensionForceLevel", "suspensionDamping", "suspensionHighSpeedDamping",
    "suspensionUpperLimit", "suspensionLowerLimit", "suspensionFrontRearBias", "suspensionAntiDiveMultiplier", "seatOffsetDistance", "collisionDamageMultiplier",
    "monetary", "modelFlags", "handlingFlags", "headLight", "tailLight", "animGroup"
}