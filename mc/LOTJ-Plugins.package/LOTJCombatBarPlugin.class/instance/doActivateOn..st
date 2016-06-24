private
doActivateOn: aTerminal
	aTerminal sendCommand: (self command: REPORT variables: self reportVariables)