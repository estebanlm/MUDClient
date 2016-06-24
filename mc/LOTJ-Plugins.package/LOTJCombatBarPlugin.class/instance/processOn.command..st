command processing
processOn: aTerminal command: aCommand
	aCommand variable variableName = SERVER_ID ifTrue: [ ^ self doActivateOn: aTerminal ].
	aCommand variable crLog.