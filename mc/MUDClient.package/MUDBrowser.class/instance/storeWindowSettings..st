private settings
storeWindowSettings: aWindow
	| settings |
	settings := self browserSettings.
	settings closed.
	aWindow isRestored 
		ifTrue: [ settings bounds: aWindow rootWindow bounds ]