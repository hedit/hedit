addEventHandler("onResourceStart", resourceRoot, function(resource)
		if getResourceName(resource) ~= "hedit" then
			print("This resource must be named \"hedit\" in order to be run.")
			cancelEvent()
		end
		
		
	end
)