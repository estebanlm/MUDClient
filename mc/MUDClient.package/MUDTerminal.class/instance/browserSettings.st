private settings
browserSettings
	^ MUDTerminalBrowserSettings
		findMatchFor: self   
		ifNone: [ (MUDTerminalBrowserSettings browserClass: self class) save ]