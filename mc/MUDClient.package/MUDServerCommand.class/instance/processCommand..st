private
processCommand: aCommand
	value := aCommand variable value.
	self terminal removeServerCommandReceiver: self.
	answerBlock ifNotNil: [ answerBlock cull: value ]