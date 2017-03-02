testing
isEchoTerminal
	^ echoTerminal ifNil: [ echoTerminal := true ]