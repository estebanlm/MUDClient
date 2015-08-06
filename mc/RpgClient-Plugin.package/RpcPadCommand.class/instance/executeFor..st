executing
executeFor: aClient
	self isDefined ifFalse: [ ^ self ].
	aClient sendCommand: (self pad prefix 
		ifNotNil: [ :prefix | (prefix, ' ', self text) trimBoth ]
		ifNil: [ self text ])