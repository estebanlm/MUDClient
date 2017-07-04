private protocol
processCommand: aCommand
	self 
		valueAt: aCommand variable variableName 
		put: aCommand variable value.
	self isCompleted ifFalse: [ ^ self ].
	self terminal removeServerCommandReceiver: self.
	answerBlock ifNotNil: [ 
		answerBlock cull: value ]