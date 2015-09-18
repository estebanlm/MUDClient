execute
executeGame: aGame on: aTerminal
	| plugin |
	plugin := self addToGame: aGame. 
	self position == #none asPluginPosition
		ifTrue: [ self openWindowFor: plugin game: aGame terminal: aTerminal ]
		ifFalse: [ 
			"I need to send a hard-refresh because plugin will change terminal display"
			aTerminal hardRefresh ].