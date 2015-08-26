private
restoreWindowSettings: aWindow
	| settings |
	settings := self browserSettings.
	settings bounds 
		ifNotNil: [ :b | aWindow bounds: b ]
		ifNil: [ aWindow extent: self preferredExtent ]