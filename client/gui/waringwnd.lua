local wHeader = { [0] = "Information", [1] = "WARNING", [2] = "ERROR" } -- Move to text file lol

local function sendInput ( buttonFunc )
    if guiGetVisible ( warningWnd ) then
    
        if type ( buttonFunc ) == "table" and #buttonFunc > 0 then
            local exe = table.remove ( buttonFunc, 1 )
        
            if type ( exe ) == "function" then
                exe ( unpack ( buttonFunc ) )
            end
            
        end
        
        guiDestroyWarningWindow ( )
        unbindKey ( "enter", "down", sendInput )
        
    end
end

function guiCreateWarningMessage ( text, level, buttonAccept, buttonDecline )
    if type ( text ) ~= "string" then
        return false
    end
    
    if type ( level ) ~= "number" then
        return false
    end
    
    if isElement ( warningWnd ) then
        guiDestroyWarningWindow ( )
    end
    
    
    
    local window = heditGUI.window
    
    if guiGetVisible ( window ) then
        guiSetEnabled ( window, false )
    end
    
    warningWnd = guiCreateWindow ( (scrX/2)-200, (scrY/2)-67, 400, 134, wHeader[level], false )
    local label = guiCreateLabel ( 114, 25,  276, 70, text, false, warningWnd )
    guiCreateButton ( 9, 25, 100,100, "image\nhere\nplox", false, warningWnd )
    guiLabelSetHorizontalAlign ( label, "left", true )
    guiSetFont ( label, "default-small" ) -- Need some advanced length-checker to avoid the resizing.
    
    
    local accept, decline
    if level == 0 then
        accept = guiCreateButton ( 114, 100, 277, 25, "Accept", false, warningWnd )
    else
        accept = guiCreateButton ( 114, 100, 136, 25, "Accept", false, warningWnd )
        decline = guiCreateButton ( 255, 100, 136, 25, "Cancel", false, warningWnd )
    end
    
    
    
    addEventHandler ( "onClientGUIClick", accept, function ( ) sendInput ( buttonAccept ) end, false )
    if isElement ( decline ) then
        addEventHandler ( "onClientGUIClick", decline, function ( ) sendInput ( buttonDecline ) end, false )
    end
    
    bindKey ( "enter", "down", sendInput, buttonAccept )
    
    
    
    guiBringToFront ( warningWnd )
    showCursor ( true, true )
    
    return warningWnd, accept, decline
end





function guiDestroyWarningWindow ( )
    showCursor ( false, false )

    local window = heditGUI.window
    
    if isElement ( warningWnd ) then
        guiSetEnabled ( window, true )
        destroyElement ( warningWnd )
    end

    if guiGetVisible ( window ) then
        guiBringToFront ( window )
        
        -- For some reason, this is suddenly needed :S Can't find out why..
        showCursor ( true, true )
    end

    return true
end