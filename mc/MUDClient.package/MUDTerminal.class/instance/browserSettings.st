private
browserSettings
	^ MUDBrowserSettings 
		findBy: [ :each | each browserClass = self class ] 
		ifAbsent: [ (MUDTerminalBrowserSettings browserClass: self class) save ]