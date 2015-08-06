initialization
initializePlugin: aPlugin
	plugin := aPlugin.
	game := self client activeGame.
	self initialize