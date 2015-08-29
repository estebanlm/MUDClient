execute
executeGame: aGame on: aConsole
	"There is just one notepad for game"
	| plugin |
	plugin := self addToGame: aGame. 
	self position == #none asPluginPosition
		ifTrue: [ self openWindowFor: plugin game: aGame console: aConsole ]
		ifFalse: [ 
			"I need to send a hard-refresh because plugin will change console display"
			aConsole hardRefresh ].