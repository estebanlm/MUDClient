accessing
parseCommand: aString 
	^ self commandLineDefinitionParser 
		parse: aString 
		onError: [ :e | 
			e emitLogError.
			MUDAliasCommand keywords: { MUDAliasCommandKeyword value: aString } ]