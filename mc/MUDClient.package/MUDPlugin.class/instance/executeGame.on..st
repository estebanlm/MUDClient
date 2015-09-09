execute
executeGame: aGame on: aConsole
	| plugin |
	plugin := self addToGame: aGame. 
	self position == #none asPluginPosition
		ifTrue: [ self openWindowFor: plugin game: aGame console: aConsole ]
		ifFalse: [ 
			"I need to send a hard-refresh because plugin will change console display"
			aConsole hardRefresh ].