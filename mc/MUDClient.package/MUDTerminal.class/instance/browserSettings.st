private settings
"protocol: private"
browserSettings
	^ MUDTerminalBrowserSettings
		findMatchFor: self   
		ifNone: [ (MUDTerminalBrowserSettings browserClass: self class) save ]