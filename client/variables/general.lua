scrX, scrY = guiGetScreenSize ( )

guiTemplate = {}
guiLanguage = {}

guiElements = {}
guiID = {}

resetGUI = {
	background = {},
    menuButtons = {},
    menuItems = {},
    utilButtons = {},
    utilItems = {},
    specials = {}
}

staticinfo = {
    header = "",
    text = ""
}

pData = {
    userconfig = {}
}

centerOfMassModes = {
    "splitted",
    "concatenated"
}

heditGUI = resetGUI

logCreated = false
logItems = {}

hiddenEditBox = nil
openedEditBox = nil
pointedButton = nil
buttonValue = nil
buttonHoverColor = nil
pressedKey = nil

errorColor = {
    { 255, 255, 255 },
    { 227, 214, 0   },
    { 200, 0,   0   } 
}