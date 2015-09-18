accessing
dependentWindowsOf: aPlugin 
	| pluginBrowserClass |
	pluginBrowserClass := aPlugin pluginDefinition browserClass.
	^ self dependentWindows 
		select: [ :each | each class = pluginBrowserClass ]