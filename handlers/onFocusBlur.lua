--|| ***************************************************************************************************************** [[
--|| PROJECT:       MTA Ingame Handling Editor
--|| FILE:          handlers/menu/onFocusBlur.lua
--|| DEVELOPERS:    Remi-X <rdg94@live.nl>
--|| PURPOSE:       Manage the focus and blur on editboxes/memos
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| ***************************************************************************************************************** ]]

function onFocus ( )
    if sItem[source] then subItemHandler[ sItem[source] ]( menuContent[ sItem[source] ], source, "focus" ) end
end

function onBlur ( )
    if sItem[source] then subItemHandler[ sItem[source] ]( menuContent[ sItem[source] ], source, "blur" ) end
end