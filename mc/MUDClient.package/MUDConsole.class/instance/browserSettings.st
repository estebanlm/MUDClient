private
browserSettings
	^ MUDBrowserSettings 
		findBy: [ :each | each browserClass = self class ] 
		ifAbsent: [ (MUDConsoleBrowserSettings browserClass: self class) save ]