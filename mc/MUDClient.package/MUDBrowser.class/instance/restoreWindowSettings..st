private settings
restoreWindowSettings: aWindow
	| settings |
	settings := self browserSettings.
	settings opened.
	settings bounds 
		ifNotNil: [ :b | aWindow rootWindow bounds: b ]
		ifNil: [ aWindow rootWindow extent: self preferredExtent ]