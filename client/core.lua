-- core client resource implementation
local EditorFunctions = {} -- contains list of editor features

local initialSize = collectgarbage "count"

-- everything starts from here in the client, nothing else should run independently
addEventHandler("onClientResourceStart", resourceRoot, function()

		-- Store the size before we release the garbage
		local prereleaseSize = collectgarbage "count"

		-- We've loaded the core features, now to load the code
		-- that is only required for the GUI
		if not SETTINGS.EDITOR_ENABLED then
			-- Since the editor is disabled, we release the
			-- function content from memory.
			-- Also garbage collect for cookies.
			EditorFunctions = nil
			collectgarbage("collect")
			return
		end

		for k,v in ipairs(EditorFunctions) do
			local value = v[2]
			
			-- Set the feature value to the assigned global key
			_G[v[1]] = value
			
			-- If the variable is a table, check for an init
			-- function to automatically run, if exists.
			if (type(value) == "table") and value.init then
				value.init() -- initialise the feature
			end
		end
		
		-- Everything that needs to be stored or run has been stored
		-- or run, we don't need this variable now. nil the variable.
		-- We'll also collect the garbage, just for fun.
		EditorFunctions = nil
		collectgarbage "collect"
		
		-- Some garbage count stats, for bonus points..
		DEBUG(string.format("%s > %s > %s", initialSize, prereleaseSize, collectgarbage "count"))
	end
)

function REGISTER_EDITOR_FUNCTION(k, v)
	table.insert(EditorFunctions, {k,v})
end
