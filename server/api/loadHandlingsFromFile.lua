--[[
	API FUNCTION
	NAME: loadHandlingsFromFile
	SIDE: server
	PURPOSE:
		Allows the end user to retrieve handling data
		from a handling file.
		
]]--
function loadHandlingsFromFile(path)
	-- Load file
	local file = fileOpen(path, true)
	local str = ""
	while not fileIsEOF(file) do
		str = str .. fileRead(file, 100)
	end
	fileClose(file)
	
	
	-- Split into lines
	local content = split(str, "\r\n")
	local vehicles = {}

	for i,v in ipairs(content) do
		local properties, id, model = {}, 1
		for value in string.gmatch ( v, "[^%s]+" ) do
			if not model then
				model = Data.vehicle.modelFromName[value]
				vehicles[model] = {}
			else
				local property = handlingProperties[id]
				table.insert(vehicle[model], property, value)
			end
			id = id + 1
		end
	end
	
	return vehicles
end

--t = loadHandlingsFromFile("test.hnd")