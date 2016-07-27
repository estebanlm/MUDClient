executing
executeOn: aTerminal
	| output |
	self isDefined ifFalse: [ ^ self ].
	output := (self pad prefix 
		ifNotNil: [ :prefix | (prefix, ' ', self text) trimBoth ]
		ifNil: [ self text ]).
	aTerminal sendFilteringInput: output