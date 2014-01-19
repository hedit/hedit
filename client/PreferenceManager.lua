-- This is the revision 
local revision = "1" -- this is the revision, only change if there are more pre
local path = "userdata/preferences.xml"

-- These are the default preferences, please don't change these.
-- You can override these preferences in shared/settings.lua
local DEFAULT_PREFERENCES = {
	BIND = "b";
	COMMAND = "hedit";
}
local PREFERENCES = table.deepcopy(DEFAULT_PREFERENCES) -- used internal to the prefmanager
local PREFCHANGES
local Preferences = {}


-- This is a sugared up table which is used through the GUI
Preferences.data = setmetatable({}, {
	__index = function(t, k)
		return PREFERENCES[k]
	end,
	
	__newindex = function(t, k, v)
		if PREFERENCES[k] == v then return end
		if not PREFCHANGES then
			PREFCHANGES = {}
		end
		PREFERENCES[k] = v
		PREFCHANGES[k] = v
	end
})

-- This light function saves any changes
function Preferences.save()
	if not PREFCHANGES then return end -- nothing has changed
	local xmlFile = xmlLoadFile(path)
	for k,v in pairs(PREFCHANGES) do
		chat("c-"..k..":"..v)
		
		local property = xmlFindChild(xmlFile, k, 0)
		xmlNodeSetValue(property, v)
	end
	xmlSaveFile(xmlFile)
	xmlUnloadFile(xmlFile)
end
	
-- This heavy function checks for a file and if it doesn't exist
-- it will create a new preferences file. If the preferences file
-- does exist, it will load the preferences from the file into
-- the "PREFERENCES" table - overriding the defaults. Then it checks
-- the version of the preference file and if there are any structural
-- changes it will merge the default prefs with the user prefs, keeping
-- any VALUE changes in the user preferences file.
function Preferences.init()
	DEBUG("Pref.init called")
	local xmlFile = xmlLoadFile(path)

	if not xmlFile then
		DEBUG("Creating preference file")
		xmlFile = xmlCreateFile(path, 'preferences')
		for k,v in pairs(PREFERENCES) do
			local property = xmlCreateChild(xmlFile, k)
			xmlNodeSetValue(property, v)
		end
		xmlNodeSetAttribute(xmlFile, "revision", revision)
		xmlSaveFile(xmlFile)
		xmlUnloadFile(xmlFile)
		return
	else
		DEBUG("Loading preferences from file")
		for k,v in pairs(PREFERENCES) do
			local property = xmlFindChild(xmlFile, k, 0)
			PREFERENCES[k] = xmlNodeGetValue(xmlFindChild(xmlFile, k, 0))
		end
		if xmlNodeGetAttribute(xmlFile, "revision") ~= revision then
			DEBUG("Updating preference file with new preferences")
			xmlNodeSetAttribute(xmlFile, "revision", revision)
			for k,v in ipairs(PREFERENCES) do
				local property = xmlFindChild(xmlFile, k, 0)
				if not property then
					property = xmlCreateChild(xmlFile, k)
					xmlNodeSetValue(property, v)
				end
			end
			
			DEBUG("Checking for redundant variables")
			for k,v in ipairs(xmlNodeGetChildren(xmlFile)) do
				local property = xmlNodeGetName(v)
				if not PREFERENCES[property] then
					xmlDestroyNode(v)
				end
			end
			
			xmlSaveFile(xmlFile); xmlUnloadFile(xmlFile)
		end
	end
	
	--[[ TEST
	for i,v in pairs(PREFERENCES) do chat(i..":"..v) end
	chat("so:") Preferences.save()  -- nothing
	Preferences.data.BIND = "b"
	Preferences.save()--]]
end

REGISTER_EDITOR_FUNCTION("Preferences", Preferences)