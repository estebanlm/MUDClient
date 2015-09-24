private
storeWindowSettings: aWindow
	| settings |
	settings := self browserSettings.
	aWindow isRestored 
		ifTrue: [ settings bounds: aWindow bounds ]