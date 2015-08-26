private
storeWindowSettings: aWindow
	| settings |
	settings := self browserSettings.
	settings bounds: aWindow bounds