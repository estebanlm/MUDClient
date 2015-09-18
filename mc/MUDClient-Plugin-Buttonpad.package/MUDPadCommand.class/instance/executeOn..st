executing
executeOn: aTerminal
	self isDefined ifFalse: [ ^ self ].
	aTerminal send: (self pad prefix 
		ifNotNil: [ :prefix | (prefix, ' ', self text) trimBoth ]
		ifNil: [ self text ])