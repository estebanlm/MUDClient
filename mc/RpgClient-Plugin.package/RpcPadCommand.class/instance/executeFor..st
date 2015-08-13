executing
executeFor: aBrowser
	self isDefined ifFalse: [ ^ self ].
	aBrowser sendCommand: (self pad prefix 
		ifNotNil: [ :prefix | (prefix, ' ', self text) trimBoth ]
		ifNil: [ self text ])