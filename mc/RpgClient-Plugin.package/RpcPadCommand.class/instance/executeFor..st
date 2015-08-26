executing
executeFor: aConsole
	self isDefined ifFalse: [ ^ self ].
	aConsole send: (self pad prefix 
		ifNotNil: [ :prefix | (prefix, ' ', self text) trimBoth ]
		ifNil: [ self text ])