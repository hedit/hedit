local EditorFunctions = {}

addEventHandler("onClientResourceStart", resourceRoot, function()


		if not SETTINGS.EDITOR_ENABLED then return end

		for k,v in ipairs(EditorFunctions) do
			local value = v[2]
			_G[v[1]] = value
			
			if type(value) == "table" then
				value.init() -- initialise the feature
			end
		end
		
		-- Empty editor function pool
		EditorFunctions = nil
	end
)

function REGISTER_EDITOR_FUNCTION(k, v)
	table.insert(EditorFunctions, {k,v})
end