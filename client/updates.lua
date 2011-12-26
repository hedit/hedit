-- NOTE: The upgrade utility and minimum version requirement are just in case hedit ever needs this. I will stick as long as possible to the same system and such to prevent such updates.

-- List of all updates, newest on top.
local updates = {
	{	revision = "Release Candidate 2 (r161)",
		date = "26 December 2011",
		info = 	"- Re-wrote client/core.lua, fixing the clientside configuration XML parsing.\n"..
				"- Fixed errors in the xml function wrappers.\n"..
				"- Fixed an error where english.lua would fail to load if the clientside xml had not loaded yet.\n"..
				"- Tweaked a warning window.",
		height = 75
	},
	{
		revision = "Release Candidate 1 (r156)",
		date = "24 December 2011",
		info = 	"- Added a 'Lock vehicle while editing?' option.\n"..
				"- Added a setVehicleLocked wrapper clientside."..
				"- Made the information text show limits of a property.\n"..
				"- Fixed a few settings bugs and various other.\n"..
				"- Added images and tweaked settings for the warning windows.\n"..
				"- Fixed the limits system, invalid values are now detected properly.\n"..
				"- Improved the version system.\n"..
				"- Fixed various typos and grammatical errors in the english language file. If you would like to contribute your own translation, contact us!"..
				"- Disabled the checkboxes at the import menu, as the functionality of these isn't yet implemented.\n" ..
				"- Added this list of updates menu, including a notifier.\n" ..
				"- Fixed size of the 'Center Of Mass Mode' combobox in 'options'.\n" ..
				"- Made the text in warining messages smaller because some messages were too long to display.",
        height = 175
    }
}

-- Table for all functions
local versionUpgrade = {}





function checkTheUpdates ( )
    local ver = tonumber ( getUserConfig ( "version" ) or "0" )

    -- If we have a no menu to store our updates in, we shouldn't try adding them too.
    if not heditGUI.menuItems.updatelist or not heditGUI.menuItems.updatelist.guiItems.scrollpane then

        if DEBUGMODE then
            outputDebugString ( "> No menu found to store updates in." )
            outputDebugString ( "> In order to create such a menu, name it 'updatelist' with a scrollpane in it named 'scrollpane'." )
        end

    else
        
        -- If we do have a menu to list updates in, we only want to show the latest 15.
        for i=15,1,-1 do
            local v = updates[i]

            if v then
                listUpdate ( v.revision, v.date, v.info, v.height, versionUpgrade[ v.revision ] and true or false )
            end
        end
        
    end
    

    -- Call version upgrades, especially made for compatibility with older versions.
    if ver < HREV then
        
        -- We only want to show a version notifier when we haven't performed an upgrade before.
        if getUserConfig ( "notifyUpgrade" ) ~= "true" then
            setUserConfig ( "notifyUpdate", "true" )
        end

        -- When we have a new minimum version
        if ver < HMREV then
            setUserConfig ( "notifyUpdate", "false" ) -- We reset this as it may been set by previous updates too.
            setUserConfig ( "notifyUpgrade", "true" ) -- We want to show him a message his files got upgraded.
            setUserConfig ( "minVersion", tostring ( HMREV ) )
        end

        -- Add 1 to the version to exclude upgrades from it's current build.
        for i=ver+1,table.maxn ( versionUpgrade ) do
            if type ( versionUpgrade[i] ) == "function" then
                versionUpgrade[i] ( )
            end
        end

        setUserConfig ( "version", tostring ( HREV ) )

    end

    return true
end





function listUpdate ( revision, date, infotext, textheight, upgrade )
    -- Create our new elements
    local scrollpane = heditGUI.menuItems.updatelist.guiItems.scrollpane
    local header = guiCreateLabel ( 0, 5, 270, 20, revision..", "..date, false, scrollpane )
    local infolabel = guiCreateLabel ( 0, 25, 270, textheight, infotext, false, scrollpane )

    guiSetFont ( header, "default-bold-small" )
    guiLabelSetHorizontalAlign ( infolabel, "left", true )
    guiSetFont ( infolabel, "default-small" )

    -- When we performed an upgrade, we should colorize this update.
    if upgrade then
        guiLabelSetColor ( header, 255, 0, 0 )
        guiSetText ( header, guiGetText ( header )..", this is an upgrade." ) -- I prefer this to be shown into the information area..
    end

    -- Move all the other elements down
    local totalheight = textheight+25

    for i,v in ipairs ( getElementChildren ( scrollpane ) ) do
        if v ~= header and v ~= infolabel then
            local posX, posY = guiGetPosition ( v, false )
            guiSetPosition ( v, posX, posY + totalheight, false )
        end
    end

    return true
end