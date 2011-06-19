--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          gui/templates/default.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating the default template
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

loadTemplate["extended"] = function ( )
    local line = {}
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    mainWnd.window     = guiCreateWindow     ( 753, 93,  374, 498, "",                false                 )
    mainWnd.grid       = guiCreateGridList   ( 65,  54,  300, 435,                    false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    line[1]            = guiCreateLabel      ( 0,   32,  365, 14,  text.hr,           false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    utilButton[1]      = guiCreateButton     ( 10,  22,  60,  19,  "THIS",            false, mainWnd.window )
    utilButton[2]      = guiCreateButton     ( 75,  22,  60,  19,  "",                false, mainWnd.window )
    utilButton[3]      = guiCreateButton     ( 345, 22,  20,  19,  "X",               false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    menuButton[1]      = guiCreateButton     ( 10,  54,  50,  50,  "Engine",          false, mainWnd.window )
    menuButton[2]      = guiCreateButton     ( 10,  109, 50,  50,  "Body",            false, mainWnd.window )
    menuButton[3]      = guiCreateButton     ( 10,  164, 50,  50,  "Wheels",          false, mainWnd.window )
    menuButton[4]      = guiCreateButton     ( 10,  219, 50,  50,  "Look",            false, mainWnd.window )
    menuButton[5]      = guiCreateButton     ( 10,  274, 50,  50,  "Model\nFlags",    false, mainWnd.window )
    menuButton[6]      = guiCreateButton     ( 10,  329, 50,  50,  "Handling\nFlags", false, mainWnd.window )
    menuButton[7]      = guiCreateButton     ( 10,  384, 50,  50,  "Dyno",            false, mainWnd.window )
    menuButton[8]      = guiCreateButton     ( 10,  439, 50,  50,  "Help",            false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    mainWnd.menuHeader = guiCreateLabel      ( 72,  58,  267, 15,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    line[2]            = guiCreateLabel      ( 66,  63,  299, 15,  text.hr,           false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    label[1]           = guiCreateLabel      ( 72,  83,  180, 20,  "",                false, mainWnd.window )
    label[2]           = guiCreateLabel      ( 72,  108, 180, 20,  "",                false, mainWnd.window )
    label[3]           = guiCreateLabel      ( 72,  133, 180, 20,  "",                false, mainWnd.window )
    label[4]           = guiCreateLabel      ( 72,  158, 180, 20,  "",                false, mainWnd.window )
    label[5]           = guiCreateLabel      ( 72,  183, 180, 20,  "",                false, mainWnd.window )
    label[6]           = guiCreateLabel      ( 72,  208, 180, 20,  "",                false, mainWnd.window )
    label[7]           = guiCreateLabel      ( 72,  233, 180, 20,  "",                false, mainWnd.window )
    label[8]           = guiCreateLabel      ( 72,  258, 180, 20,  "",                false, mainWnd.window )
    label[9]           = guiCreateLabel      ( 72,  283, 180, 20,  "",                false, mainWnd.window )
    label[10]          = guiCreateLabel      ( 72,  308, 180, 20,  "",                false, mainWnd.window )
    label[11]          = guiCreateLabel      ( 72,  333, 180, 20,  "",                false, mainWnd.window )
    label[12]          = guiCreateLabel      ( 72,  358, 180, 20,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    defHedit[1]        = guiCreateButton     ( 258, 83,  100, 20,  "",                false, mainWnd.window )
    defHedit[2]        = guiCreateButton     ( 258, 108, 100, 20,  "",                false, mainWnd.window )
    defHedit[3]        = guiCreateButton     ( 258, 133, 100, 20,  "",                false, mainWnd.window )
    defHedit[4]        = guiCreateButton     ( 258, 158, 100, 20,  "",                false, mainWnd.window )
    defHedit[5]        = guiCreateButton     ( 258, 183, 100, 20,  "",                false, mainWnd.window )
    defHedit[6]        = guiCreateButton     ( 258, 208, 100, 20,  "",                false, mainWnd.window )
    defHedit[7]        = guiCreateButton     ( 258, 233, 100, 20,  "",                false, mainWnd.window )
    defHedit[8]        = guiCreateButton     ( 258, 258, 100, 20,  "",                false, mainWnd.window )
    defHedit[9]        = guiCreateButton     ( 258, 283, 100, 20,  "",                false, mainWnd.window )
    defHedit[10]       = guiCreateButton     ( 258, 308, 100, 20,  "",                false, mainWnd.window )
    defHedit[11]       = guiCreateButton     ( 258, 333, 100, 20,  "",                false, mainWnd.window )
    defHedit[12]       = guiCreateButton     ( 258, 358, 100, 20,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    line[3]            = guiCreateLabel      ( 66,  378, 299, 15,  text.hr,           false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    mainWnd.infoHeader = guiCreateLabel      ( 72,  393, 285, 16,  "",                false, mainWnd.window )
    mainWnd.infoText   = guiCreateLabel      ( 72,  409, 285, 30,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    line[4]            = guiCreateLabel      ( 66,  431, 299, 15,  text.hr,           false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    logTime[1]         = guiCreateLabel      ( 72,  472, 45,  13,  "",                false, mainWnd.window )
    logText[1]         = guiCreateLabel      ( 117, 472, 230, 13,  "",                false, mainWnd.window )
    logTime[2]         = guiCreateLabel      ( 72,  459, 45,  13,  "",                false, mainWnd.window )
    logText[2]         = guiCreateLabel      ( 117, 459, 230, 13,  "",                false, mainWnd.window )
    logTime[3]         = guiCreateLabel      ( 72,  446, 45,  13,  "",                false, mainWnd.window )
    logText[3]         = guiCreateLabel      ( 117, 446, 230, 13,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    logPane            = guiCreateScrollPane ( 73,  77,  290, 300,                    false, mainWnd.window )
	---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    hexMenu  = {
        cb   = {
            {
                ["1"] = guiCreateCheckBox ( 72,  77,  135, 15, "[1-1]", false, false, mainWnd.window ),
                ["2"] = guiCreateCheckBox ( 72,  92,  135, 15, "[1-2]", false, false, mainWnd.window ),
                ["4"] = guiCreateCheckBox ( 212, 77,  135, 15, "[1-4]", false, false, mainWnd.window ),
                ["8"] = guiCreateCheckBox ( 212, 92,  135, 15, "[1-8]", false, false, mainWnd.window )
            },
            {
                ["1"] = guiCreateCheckBox ( 72,  107, 135, 15, "[2-1]", false, false, mainWnd.window ),
                ["2"] = guiCreateCheckBox ( 72,  122, 135, 15, "[2-2]", false, false, mainWnd.window ),
                ["4"] = guiCreateCheckBox ( 212, 107, 135, 15, "[2-4]", false, false, mainWnd.window ),
                ["8"] = guiCreateCheckBox ( 212, 122, 135, 15, "[2-8]", false, false, mainWnd.window )
            },
            {
                ["1"] = guiCreateCheckBox ( 72,  137, 135, 15, "[3-1]", false, false, mainWnd.window ),
                ["2"] = guiCreateCheckBox ( 72,  152, 135, 15, "[3-2]", false, false, mainWnd.window ),
                ["4"] = guiCreateCheckBox ( 212, 137, 135, 15, "[3-4]", false, false, mainWnd.window ),
                ["8"] = guiCreateCheckBox ( 212, 152, 135, 15, "[3-8]", false, false, mainWnd.window )
            },
            {
                ["1"] = guiCreateCheckBox ( 72,  167, 135, 15, "[4-1]", false, false, mainWnd.window ),
                ["2"] = guiCreateCheckBox ( 72,  182, 135, 15, "[4-2]", false, false, mainWnd.window ),
                ["4"] = guiCreateCheckBox ( 212, 167, 135, 15, "[4-4]", false, false, mainWnd.window ),
                ["8"] = guiCreateCheckBox ( 212, 182, 135, 15, "[4-8]", false, false, mainWnd.window )
            },
            {
                ["1"] = guiCreateCheckBox ( 72,  197, 135, 15, "[5-1]", false, false, mainWnd.window ),
                ["2"] = guiCreateCheckBox ( 72,  212, 135, 15, "[5-2]", false, false, mainWnd.window ),
                ["4"] = guiCreateCheckBox ( 212, 197, 135, 15, "[5-4]", false, false, mainWnd.window ),
                ["8"] = guiCreateCheckBox ( 212, 212, 135, 15, "[5-8]", false, false, mainWnd.window )
            },
            {
                ["1"] = guiCreateCheckBox ( 72,  227, 135, 15, "[6-1]", false, false, mainWnd.window ),
                ["2"] = guiCreateCheckBox ( 72,  242, 135, 15, "[6-2]", false, false, mainWnd.window ),
                ["4"] = guiCreateCheckBox ( 212, 227, 135, 15, "[6-4]", false, false, mainWnd.window ),
                ["8"] = guiCreateCheckBox ( 212, 242, 135, 15, "[6-8]", false, false, mainWnd.window )
            },
            {
                ["1"] = guiCreateCheckBox ( 72,  257, 135, 15, "[7-1]", false, false, mainWnd.window ),
                ["2"] = guiCreateCheckBox ( 72,  272, 135, 15, "[7-2]", false, false, mainWnd.window ),
                ["4"] = guiCreateCheckBox ( 212, 257, 135, 15, "[7-4]", false, false, mainWnd.window ),
                ["8"] = guiCreateCheckBox ( 212, 272, 135, 15, "[7-8]", false, false, mainWnd.window )
            },
            {
                ["1"] = guiCreateCheckBox ( 72,  287, 135, 15, "[8-1]", false, false, mainWnd.window ),
                ["2"] = guiCreateCheckBox ( 72,  302, 135, 15, "[8-2]", false, false, mainWnd.window ),
                ["4"] = guiCreateCheckBox ( 212, 287, 135, 15, "[8-4]", false, false, mainWnd.window ),
                ["8"] = guiCreateCheckBox ( 212, 302, 135, 15, "[8-8]", false, false, mainWnd.window )
            }
        },
        item = {
        }
    }
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["saveclient"] = {
        grid             = guiCreateGridList ( 72,  83,  285, 246,                false, mainWnd.window ),
        nameEdit         = guiCreateEdit     ( 72,  334, 212, 25,  "",            false, mainWnd.window ),
        descriptionEdit  = guiCreateEdit     ( 72,  359, 212, 25,  "",            false, mainWnd.window ),
        button           = guiCreateButton   ( 289, 334, 68,  50,  "Save!",       false, mainWnd.window ),
        nameLabel        = guiCreateLabel    ( 80,  334, 50,  12,  "Name",        false, mainWnd.window ),
        descriptionLabel = guiCreateLabel    ( 80,  359, 50,  12,  "Description", false, mainWnd.window )
    }
    guiGridListAddColumn ( menuContent["saveclient"].grid, "Name",  0.6 )
    guiGridListAddColumn ( menuContent["saveclient"].grid, "Model", 0.4 )
    guiLabelSetColor     ( menuContent["saveclient"].nameLabel,        0, 0, 0 )
    guiLabelSetColor     ( menuContent["saveclient"].descriptionLabel, 0, 0, 0 )
    guiSetFont           ( menuContent["saveclient"].nameLabel,        "default-small" )
    guiSetFont           ( menuContent["saveclient"].descriptionLabel, "default-small" )
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["loadclient"] = {
        grid   = guiCreateGridList ( 72,  83,  285, 271,          false, mainWnd.window ),
        button = guiCreateButton   ( 72,  359, 285, 25,  "Load!", false, mainWnd.window )
    }
    guiGridListAddColumn ( menuContent["loadclient"].grid, "Name",  0.6 )
    guiGridListAddColumn ( menuContent["loadclient"].grid, "Model", 0.4 )
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["uploadshared"] = {
    }
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["downloadshared"] = {
    }
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["sharehandling"] = {
    }
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["import"] = {
    }
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["export"] = {
    }
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["savetoresource"] = {
    }
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["options"] = {
    }
    ---------------------------------------------------------------------------------------------------------------------
    menuContent["administration"] = {
    }
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    utilContent[ utilButton[1] ] = {
        ["saveclient"]     = guiCreateButton ( 10, 45,  100, 20, "", false, mainWnd.window ),
        ["loadclient"]     = guiCreateButton ( 10, 65,  100, 20, "", false, mainWnd.window ),
        ["uploadshared"]   = guiCreateButton ( 10, 85,  100, 20, "", false, mainWnd.window ),
        ["downloadshared"] = guiCreateButton ( 10, 105, 100, 20, "", false, mainWnd.window ),
        ["sharehandling"]  = guiCreateButton ( 10, 125, 100, 20, "", false, mainWnd.window )
    }
    ---------------------------------------------------------------------------------------------------------------------
    utilContent[ utilButton[2] ] = {
        ["import"] = guiCreateButton ( 75, 45, 100, 20, "", false, mainWnd.window ),
        ["export"] = guiCreateButton ( 75, 65, 100, 20, "", false, mainWnd.window )
    }
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    guiSetFont ( mainWnd.menuHeader, "default-bold-small" )
    guiSetFont ( mainWnd.infoText,   "default-small"      )
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    guiSetProperty             ( mainWnd.grid,     "Disabled", "True" )
    guiSetProperty             ( line[1],          "Disabled", "True" )
    guiLabelSetHorizontalAlign ( mainWnd.infoText, "left",     true   )
    guiWindowSetSizable        ( mainWnd.window,               false  )
    guiWindowSetMovable        ( mainWnd.window,               false  )
    guiSetVisible              ( logPane,                      false )
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    for i,v in ipairs ( line )    do guiSetAlpha ( v, 0.3 ) end
    for i,v in ipairs ( logTime ) do guiSetFont  ( v, "default-small" ) end
    for i,v in ipairs ( logText ) do guiSetFont  ( v, "default-small" ) end
    for i,v in ipairs ( hexMenu.cb ) do for k,g in pairs ( v ) do guiSetFont ( g, "default-small" ) end end
    local wndW, wndH = guiGetSize ( mainWnd.window, false )
    wndX             = (scrX/2) - (wndW/2)
    wndY             = (scrY/2) - (wndH/2)
    guiSetPosition     ( mainWnd.window, wndX, wndY, false )
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    return true
end