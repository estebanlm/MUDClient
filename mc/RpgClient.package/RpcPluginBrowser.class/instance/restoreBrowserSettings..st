private
restoreBrowserSettings: aWindow
	| settings |
	settings := self browserSettings.
	settings bounds 
		ifNotNil: [ :b | aWindow bounds: b ]