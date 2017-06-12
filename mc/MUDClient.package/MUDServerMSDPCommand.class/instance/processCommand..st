private protocol
processCommand: aCommand
	value ifNil: [ value := SmallDictionary new ].
	value 
		at: aCommand variable variableName 
		put: aCommand variable value.
	self isCompleted ifFalse: [ ^ self ].
	self terminal removeServerCommandReceiver: self.
	answerBlock ifNotNil: [ 
		answerBlock cull: value ]