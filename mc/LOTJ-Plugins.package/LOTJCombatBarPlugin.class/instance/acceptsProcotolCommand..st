testing
acceptsProcotolCommand: aCommand
	^ (self reportVariables includes: aCommand variable variableName)
		or: [ aCommand variable variableName = SERVER_ID ]