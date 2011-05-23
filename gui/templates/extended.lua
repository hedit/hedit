--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          gui/templates/default.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Creating the default template
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

loadTemplate["extended"] = function ( )
    local line = {}
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    mainWnd.window       = guiCreateWindow     ( 753, 93,  374, 498, "",                false                 )
    mainWnd.grid         = guiCreateGridList   ( 65,  54,  300, 435,                    false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    line[1]              = guiCreateLabel      ( 0,   32,  365, 14,  text.hr,           false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    utilButton[1]        = guiCreateButton     ( 10,  22,  60,  19,  "",                false, mainWnd.window )
    utilButton[2]        = guiCreateButton     ( 75,  22,  60,  19,  "",                false, mainWnd.window )
    utilButton[3]        = guiCreateButton     ( 345, 22,  20,  19,  "X",               false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    menuButton[1]        = guiCreateButton     ( 10,  54,  50,  50,  "Engine",          false, mainWnd.window )
    menuButton[2]        = guiCreateButton     ( 10,  109, 50,  50,  "Body",            false, mainWnd.window )
    menuButton[3]        = guiCreateButton     ( 10,  164, 50,  50,  "Wheels",          false, mainWnd.window )
    menuButton[4]        = guiCreateButton     ( 10,  219, 50,  50,  "Look",            false, mainWnd.window )
    menuButton[5]        = guiCreateButton     ( 10,  274, 50,  50,  "Model\nFlags",    false, mainWnd.window )
    menuButton[6]        = guiCreateButton     ( 10,  329, 50,  50,  "Handling\nFlags", false, mainWnd.window )
    menuButton[7]        = guiCreateButton     ( 10,  384, 50,  50,  "Dyno",            false, mainWnd.window )
    menuButton[8]        = guiCreateButton     ( 10,  439, 50,  50,  "Help",            false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    mainWnd.menuHeader   = guiCreateLabel      ( 72,  58,  267, 15,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    line[2]              = guiCreateLabel      ( 66,  63,  299, 15,  text.hr,           false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    label[1]             = guiCreateLabel      ( 72,  83,  180, 20,  "",                false, mainWnd.window )
    label[2]             = guiCreateLabel      ( 72,  108, 180, 20,  "",                false, mainWnd.window )
    label[3]             = guiCreateLabel      ( 72,  133, 180, 20,  "",                false, mainWnd.window )
    label[4]             = guiCreateLabel      ( 72,  158, 180, 20,  "",                false, mainWnd.window )
    label[5]             = guiCreateLabel      ( 72,  183, 180, 20,  "",                false, mainWnd.window )
    label[6]             = guiCreateLabel      ( 72,  208, 180, 20,  "",                false, mainWnd.window )
    label[7]             = guiCreateLabel      ( 72,  233, 180, 20,  "",                false, mainWnd.window )
    label[8]             = guiCreateLabel      ( 72,  258, 180, 20,  "",                false, mainWnd.window )
    label[9]             = guiCreateLabel      ( 72,  283, 180, 20,  "",                false, mainWnd.window )
    label[10]            = guiCreateLabel      ( 72,  308, 180, 20,  "",                false, mainWnd.window )
    label[11]            = guiCreateLabel      ( 72,  333, 180, 20,  "",                false, mainWnd.window )
    label[12]            = guiCreateLabel      ( 72,  358, 180, 20,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    defHedit[1]          = guiCreateButton     ( 258, 83,  100, 20,  "",                false, mainWnd.window )
    defHedit[2]          = guiCreateButton     ( 258, 108, 100, 20,  "",                false, mainWnd.window )
    defHedit[3]          = guiCreateButton     ( 258, 133, 100, 20,  "",                false, mainWnd.window )
    defHedit[4]          = guiCreateButton     ( 258, 158, 100, 20,  "",                false, mainWnd.window )
    defHedit[5]          = guiCreateButton     ( 258, 183, 100, 20,  "",                false, mainWnd.window )
    defHedit[6]          = guiCreateButton     ( 258, 208, 100, 20,  "",                false, mainWnd.window )
    defHedit[7]          = guiCreateButton     ( 258, 233, 100, 20,  "",                false, mainWnd.window )
    defHedit[8]          = guiCreateButton     ( 258, 258, 100, 20,  "",                false, mainWnd.window )
    defHedit[9]          = guiCreateButton     ( 258, 283, 100, 20,  "",                false, mainWnd.window )
    defHedit[10]         = guiCreateButton     ( 258, 308, 100, 20,  "",                false, mainWnd.window )
    defHedit[11]         = guiCreateButton     ( 258, 333, 100, 20,  "",                false, mainWnd.window )
    defHedit[12]         = guiCreateButton     ( 258, 358, 100, 20,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    line[3]              = guiCreateLabel      ( 66,  378, 299, 15,  text.hr,           false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    mainWnd.infoHeader   = guiCreateLabel      ( 72,  393, 285, 16,  "",                false, mainWnd.window )
    mainWnd.infoText     = guiCreateLabel      ( 72,  409, 285, 30,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    line[4]              = guiCreateLabel      ( 66,  431, 299, 15,  text.hr,           false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    logTime[1]           = guiCreateLabel      ( 72,  472, 45,  13,  "",                false, mainWnd.window )
    logText[1]           = guiCreateLabel      ( 117, 472, 230, 13,  "",                false, mainWnd.window )
    logTime[2]           = guiCreateLabel      ( 72,  459, 45,  13,  "",                false, mainWnd.window )
    logText[2]           = guiCreateLabel      ( 117, 459, 230, 13,  "",                false, mainWnd.window )
    logTime[3]           = guiCreateLabel      ( 72,  446, 45,  13,  "",                false, mainWnd.window )
    logText[3]           = guiCreateLabel      ( 117, 446, 230, 13,  "",                false, mainWnd.window )
    ---------------------------------------------------------------------------------------------------------------------
    logPane              = guiCreateScrollPane ( 73,  77,  290, 300,                    false, mainWnd.window )
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
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    for k,v in ipairs ( line )    do guiSetAlpha ( v, 0.3 ) end
    for k,v in ipairs ( logTime ) do guiSetFont  ( v, "default-small" ) end
    for k,v in ipairs ( logText ) do guiSetFont  ( v, "default-small" ) end
    local wndW, wndH = guiGetSize ( mainWnd.window, false )
    wndX             = (scrX/2) - (wndW/2)
    wndY             = (scrY/2) - (wndH/2)
    guiSetPosition     ( mainWnd.window, wndX, wndY, false )
    ---------------------------------------------------------------------------------------------------------------------
    -- /////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    ---------------------------------------------------------------------------------------------------------------------
    return true
end