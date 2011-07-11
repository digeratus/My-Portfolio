-- Hide the status bar.
display.setStatusBar( display.HiddenStatusBar )

-- Open external links in the browser and email in the mail app.
local function urlHandler(event)

	local url = event.url
	
	if( string.find( url, "http:" ) ~= nil or string.find( url, "mailto:" ) ~= nil ) then
		
		print("url: ".. url)
		system.openURL(url)

	end

	return true
end

-- Location of my website files.
local url = "html/index.html"

-- Options for the web view.
local options = { hasBackground=false, baseUrl=system.ResourceDirectory, urlRequest=urlHandler }

-- Open my website in a web view.
native.showWebPopup( url, options )

-- Web views are not supported in the Simulator, so show a warning message if this opens in the Simulator.
if "simulator" == system.getInfo("environment") then
	msg = "Web views are not supported in the Simulator!"
	msg = display.newText( msg, 0, 0, native.systemFont, 14 )
	msg.x, msg.y = display.contentWidth/2, display.contentHeight/2 
end
