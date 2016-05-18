accessing
dependentWindowsOf: aPlugin
	^ self dependentWindows 
		select: [ :each | each plugin = aPlugin ]