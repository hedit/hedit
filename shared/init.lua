-- Touching anything below here may cause a volcanic eruption
-------------------------------------------------------------


CLIENT, SERVER = not triggerClientEvent, not triggerServerEvent
Data = {}


-- debug chat function for development
function chat(a)
	outputChatBox(tostring(a))
end

function DEBUG(...)
	if not SETTINGS.DEBUGMODE then return end
	for _, message in ipairs{...} do
		outputDebugString("hedit:: " .. message, 0)
	end
end

function ERROR(...)
	for _, message in ipairs{...} do
		outputDebugString(message, 1)
	end
end

function WARNING(...)
	for _, message in ipairs{...} do
		outputDebugString(message, 2)
	end
end

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end
table.deepcopy = deepcopy