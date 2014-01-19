-- These are internal preferences that the server owner (you)
-- may want to modify. Be careful with these variables
-- as improper usage may cause a disastrous explosion.
SETTINGS = {
	DEBUGMODE = true; -- Shows the debug messages if you're interested in who is doing what
	EDITOR_ENABLED = true; -- Allows you to disable the main gui to only use the developer features
}

OVERRIDES = {}


-- This table will allow you to override any default *preferences* set by hedit
-- These preferences can be actively modified by the user in the settings
-- interface, overriding it here allows your preferred actions to be followed
-- whilst allowing the prefs that the user made on other servers to still apply there
--
-- This table is empty by default, look in client/PreferenceManager.lua for a list
-- of preferences and their default values. Just insert an entry in this table to override
-- the value. If you don't want to let the user change it after you've overridden it, you'll
-- need to either disable the specific settings above or apply the ACL option to the user group.
-- For more information about using ACL or the settings table, read
-- ->	http://wiki.mtasa.com/wiki/Resource:hedit/
-- TODO: update above link
OVERRIDES.PREFERENCES = {

}