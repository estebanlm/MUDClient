private settings
restoreWindowSettings: aWindow
	| settings |
	settings := self browserSettings.
	settings opened.
	settings bounds 
		ifNotNil: [ :b | aWindow bounds: b ]
		ifNil: [ aWindow extent: self preferredExtent ]