--|| ***************************************************************************************************************** [[
--|| PROJECT:		MTA Ingame Handling Editor
--|| FILE:			gui/checkGui.lua
--|| DEVELOPERS:	Remi-X <rdg94@live.nl>
--|| PURPOSE:		Verifying the current GUI
--||
--|| COPYRIGHTED BY REMI-X
--|| YOU ARE NOT ALLOWED TO MAKE MIRRORS OR RE-RELEASES OF THIS SCRIPT WITHOUT PERMISSION FROM THE OWNERS
--|| THIS RESOURCE HAS BEEN UPLOADED TO COMMUNITY.MTASA.COM
--|| ***************************************************************************************************************** ]]

function isTranslationValid ( )
	local valid = {
		text.header, text.logheader, text.hr, text.reenter, text.incorrectTemplate, text.invalidTemplate, text.noDefaultTemplate,
		
		text.utilFile, text.utilView, text.utilOptions,
		
		text.newHandling, text.openHandling, text.importHandling, text.exportHandling, text.saveHandling, text.saveHandlingAs, text.closeWindow,
		text.showTransmission, text.showSuspension, text.showOther, text.showTest, text.showHelp, text.showLog, text.showDyno,
		text.pickLanguage, text.pickTemplate,
		
		text.resetHeader, text.resetLabel,
		
		text.accept, text.continue, text.cancel,
		
		log.same, log.succes, log.unable, log.invalid, log.needNumber,
		
		info[1], info[2], info[3], info[4], info[5], 
		
		info["transmission"].l[1], info["transmission"].l[2], info["transmission"].l[3], info["transmission"].l[4], info["transmission"].l[5],
		info["transmission"].l[6], info["transmission"].l[7], info["transmission"].l[8], info["transmission"].l[9], info["transmission"].l[10],
		info["transmission"].l[11], info["transmission"].l[12], info["transmission"].l[13],
		
		info["suspension"].l[1], info["suspension"].l[2], info["suspension"].l[3], info["suspension"].l[4], info["suspension"].l[5],
		info["suspension"].l[6], info["suspension"].l[7], info["suspension"].l[8], info["suspension"].l[9], info["suspension"].l[10],
		info["suspension"].l[11], info["suspension"].l[12],
		
		info["other"].l[1], info["other"].l[2], info["other"].l[3],
		info["other"].l[4], info["other"].l[5], info["other"].l[6],
		
		info["transmission"].h[1], info["transmission"].h[2], info["transmission"].h[3], info["transmission"].h[4], info["transmission"].h[5],
		info["transmission"].h[6], info["transmission"].h[7], info["transmission"].h[8], info["transmission"].h[9], info["transmission"].h[10],
		info["transmission"].h[11], info["transmission"].h[12], info["transmission"].h[13],
		
		info["suspension"].h[1], info["suspension"].h[2], info["suspension"].h[3], info["suspension"].h[4], info["suspension"].h[5],
		info["suspension"].h[6], info["suspension"].h[7], info["suspension"].h[8], info["suspension"].h[9], info["suspension"].h[10],
		info["suspension"].h[11], info["suspension"].h[12],
		
		info["other"].h[1], info["other"].h[2], info["other"].h[3],
		info["other"].h[4], info["other"].h[5], info["other"].h[6],
		
		hName["transmission"].h[1], hName["transmission"].h[2], hName["transmission"].h[3], hName["transmission"].h[4], hName["transmission"].h[5],
		hName["transmission"].h[6], hName["transmission"].h[7], hName["transmission"].h[8], hName["transmission"].h[9], hName["transmission"].h[10],
		hName["transmission"].h[11], hName["transmission"].h[12], hName["transmission"].h[13],
		
		hName["suspension"].h[1], hName["suspension"].h[2], hName["suspension"].h[3], hName["suspension"].h[4], hName["suspension"].h[5],
		hName["suspension"].h[6], hName["suspension"].h[7], hName["suspension"].h[8], hName["suspension"].h[9], hName["suspension"].h[10],
		hName["suspension"].h[11], hName["suspension"].h[12],
		
		hName["other"].h[1], hName["other"].h[2], hName["other"].h[3],
		hName["other"].h[4], hName["other"].h[5], hName["other"].h[6]
	}
	for k,v in ipairs(valid) do
		if type(valid[k])~="string" then
			return false
		end
	end
	return true
end
-------------------------------------------------------------------------------------------------------------------------------
function isTemplateValid ( )
	local valid = {
		mainWnd.window, menuButton[1], menuButton[2], menuButton[3], menuButton[4],
		utilButton.file, utilButton.view, utilButton.options, utilButton.close,
		label[1], label[2], label[3], label[4], label[5], label[6], label[7], label[8], label[9], label[10], label[11], label[12], label[13],
		defHedit[1], defHedit[2], defHedit[3], defHedit[4], defHedit[5], defHedit[6], defHedit[7],
		defHedit[8], defHedit[9], defHedit[10], defHedit[11], defHedit[12], defHedit[13],
		mainWnd.info,
		logWnd.window, logWnd.scrollpane
	}
	for k,v in ipairs(valid) do
		if not isElement(valid[k]) then
			return false
		end
	end
	return true
end
-------------------------------------------------------------------------------------------------------------------------------
function faultTranslation ( txt )
	if usedTranslation == "english" then
		outputChatBox ( "HANDLING EDITOR: No english translation available! Handling editor will not work now.", 255, 0, 0 )
		stopResource ( )
	else
		if loadTemplate["default"] then
			loadTemplate["default"]()
			if isTemplateValid ( ) then
				enableTemplate ( )
				outputChatBox ( txt, 255, 0, 0 )
			else
				outputChatBox ( "HANDLING EDITOR: No english translation available! Handling editor will not work now.", 255, 0, 0 )
				stopResource ( )
			end
		else
			outputChatBox ( "HANDLING EDITOR: No english translation available! Handling editor will not work now.", 255, 0, 0 )
			stopResource ( )
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------
function faultTemplate ( txt )
	if usedTemplate == "default" then
		outputChatBox ( text.noDefaultTemplate, 255, 0, 0 )
		stopResource ( )
	else
		if loadTemplate["default"] then
			loadTemplate["default"]()
			if isTemplateValid ( ) then
				enableTemplate ( )
				outputChatBox ( txt, 255, 0, 0 )
			else
				outputChatBox ( text.noDefaultTemplate, 255, 0, 0 )
				stopResource ( )
			end
		else
			outputChatBox ( text.noDefaultTemplate, 255, 0, 0 )
			stopResource ( )
		end
	end
end
