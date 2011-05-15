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

loadTemplate["default"] = function ( )
    -----------------------------------------------------------------------------------------------------------------------
    -- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -----------------------------------------------------------------------------------------------------------------------
    mainWnd.window      = guiCreateWindow      ( 0,   0,   354, 505, "",                  false )
    mainWnd.grid        = guiCreateGridList    ( 93,  57,  252, 346,                      false, mainWnd.window )
    -----------------------------------------------------------------------------------------------------------------------
    line[1]             = guiCreateLabel       ( 0,   32,  354, 14,  text.hr,             false, mainWnd.window )
    utilButton[1]       = guiCreateButton      ( 10,  22,  60,  19,  "???",               false, mainWnd.window )
    utilButton[2]       = guiCreateButton      ( 73,  22,  60,  19,  "???",               false, mainWnd.window )
    utilButton[3]       = guiCreateButton      ( 136, 22,  60,  19,  "???",               false, mainWnd.window )
    utilButton[4]       = guiCreateButton      ( 325, 22,  20,  19,  "X",                 false, mainWnd.window )
    -----------------------------------------------------------------------------------------------------------------------
    -- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -----------------------------------------------------------------------------------------------------------------------
    menuButton[1]       = guiCreateStaticImage ( 9,   56,  80,  80,  img[ mProperty[1] ], false, mainWnd.window )
    menuButton[2]       = guiCreateStaticImage ( 9,   145, 80,  80,  img[ mProperty[2] ], false, mainWnd.window )
    menuButton[3]       = guiCreateStaticImage ( 9,   234, 80,  80,  img[ mProperty[3] ], false, mainWnd.window )
    menuButton[4]       = guiCreateStaticImage ( 9,   323, 80,  80,  img[ mProperty[4] ], false, mainWnd.window )
    menuButton[5]       = guiCreateStaticImage ( 9,   420, 80,  80,  img[ mProperty[5] ], false, mainWnd.window )
    -----------------------------------------------------------------------------------------------------------------------
    -- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -----------------------------------------------------------------------------------------------------------------------
    label[1]            = guiCreateLabel       ( 101, 63,  126,    19,  "",                  false, mainWnd.window )
    label[2]            = guiCreateLabel       ( 101, 86,  126,    19,  "",                  false, mainWnd.window )
    label[3]            = guiCreateLabel       ( 101, 109, 126,    19,  "",                  false, mainWnd.window )
    label[4]            = guiCreateLabel       ( 101, 132, 126,    19,  "",                  false, mainWnd.window )
    label[5]            = guiCreateLabel       ( 101, 155, 126,    19,  "",                  false, mainWnd.window )
    label[6]            = guiCreateLabel       ( 101, 178, 126,    19,  "",                  false, mainWnd.window )
    label[7]            = guiCreateLabel       ( 101, 201, 126,    19,  "",                  false, mainWnd.window )
    label[8]            = guiCreateLabel       ( 101, 224, 126,    19,  "",                  false, mainWnd.window )
    label[9]            = guiCreateLabel       ( 101, 247, 126,    19,  "",                  false, mainWnd.window )
    label[10]           = guiCreateLabel       ( 101, 270, 126,    19,  "",                  false, mainWnd.window )
    label[11]           = guiCreateLabel       ( 101, 293, 126,    19,  "",                  false, mainWnd.window )
    label[12]           = guiCreateLabel       ( 101, 316, 126,    19,  "",                  false, mainWnd.window )
    label[13]           = guiCreateLabel       ( 101, 339, 126,    19,  "",                  false, mainWnd.window )
    -----------------------------------------------------------------------------------------------------------------------
    defHedit[1]         = guiCreateButton      ( 233, 63,  106, 20,  "",                  false, mainWnd.window )
    defHedit[2]         = guiCreateButton      ( 233, 86,  106, 20,  "",                  false, mainWnd.window )
    defHedit[3]         = guiCreateButton      ( 233, 109, 106, 20,  "",                  false, mainWnd.window )
    defHedit[4]         = guiCreateButton      ( 233, 132, 106, 20,  "",                  false, mainWnd.window )
    defHedit[5]         = guiCreateButton      ( 233, 155, 106, 20,  "",                  false, mainWnd.window )
    defHedit[6]         = guiCreateButton      ( 233, 178, 106, 20,  "",                  false, mainWnd.window )
    defHedit[7]         = guiCreateButton      ( 233, 201, 106, 20,  "",                  false, mainWnd.window )
    defHedit[8]         = guiCreateButton      ( 233, 224, 106, 20,  "",                  false, mainWnd.window )
    defHedit[9]         = guiCreateButton      ( 233, 247, 106, 20,  "",                  false, mainWnd.window )
    defHedit[10]        = guiCreateButton      ( 233, 270, 106, 20,  "",                  false, mainWnd.window )
    defHedit[11]        = guiCreateButton      ( 233, 293, 106, 20,  "",                  false, mainWnd.window )
    defHedit[12]        = guiCreateButton      ( 233, 316, 106, 20,  "",                  false, mainWnd.window )
    defHedit[13]        = guiCreateButton      ( 233, 339, 106, 20,  "",                  false, mainWnd.window )    
    -----------------------------------------------------------------------------------------------------------------------
    -- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -----------------------------------------------------------------------------------------------------------------------
    line[2]             = guiCreateLabel       ( 0,   401, 354, 20,  text.hr,             false, mainWnd.window )
    -----------------------------------------------------------------------------------------------------------------------
    mainWnd.info        = guiCreateLabel       ( 98,  420, 248, 76,  "",                  false, mainWnd.window )
    -----------------------------------------------------------------------------------------------------------------------
    -- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -----------------------------------------------------------------------------------------------------------------------
    logWnd.window       = guiCreateWindow      ( 0,   0,   354, 154, "",                  false )
    logWnd.scrollpane   = guiCreateScrollPane  ( 10,  20,  334, 120,                      false, logWnd.window )
    -----------------------------------------------------------------------------------------------------------------------
    -- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -----------------------------------------------------------------------------------------------------------------------
    guiSetProperty             ( mainWnd.grid,   "Disabled", "True" )
    guiLabelSetHorizontalAlign ( mainWnd.info,   "left",     true   )
    guiWindowSetSizable        ( mainWnd.window,             false  )
    guiWindowSetSizable        ( logWnd.window,              false  )
    guiWindowSetMovable        ( mainWnd.window,             false  )
    guiWindowSetMovable        ( logWnd.window,              false  )
    -----------------------------------------------------------------------------------------------------------------------
    -- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// --
    -----------------------------------------------------------------------------------------------------------------------
    local wndW, wndH    = guiGetSize ( mainWnd.window,    false )
    local logW, logH    = guiGetSize ( logWnd.window,    false )
    -----------------------------------------------------------
    if scrY < 650 then
        wndX            = (scrX/2) - (wndW/2) - ((logW/2)+10)
        wndY            = (scrY/2) - (wndH/2)
        logX            = (scrX/2) - (logW/2) + ((wndW/2)-0)
        logY            = (scrY/2) - (logH/2)    -- UNUSED
        -------------------------------------------------------
        guiSetPosition  ( mainWnd.window, wndX, wndY, false )
        guiSetPosition  ( logWnd.window,  logX, wndY, false )
    -----------------------------------------------------------
    else
        wndX            = (scrX/2) - (wndW/2)
        wndY            = (scrY/2) - (wndH/2) - ((logH/2)+10)
        logX            = (scrX/2) - (logW/2)
        logY            = (scrY/2) - (logH/2) + ((wndH/2)-0)
        -------------------------------------------------------
        guiSetPosition  ( mainWnd.window, wndX, wndY, false )
        guiSetPosition  ( logWnd.window,  logX, logY, false )
    -----------------------------------------------------------
    end
    return true
end