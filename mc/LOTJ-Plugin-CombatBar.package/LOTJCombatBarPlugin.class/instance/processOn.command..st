command processing
processOn: aTerminal command: aCommand
	| varName varValue |
	varName := aCommand variable variableName.
	varValue := aCommand variable value.
	
	varName = SERVER_ID ifTrue: [ ^ self activateOn: aTerminal ].
	self valueAt: varName put: varValue.
	varName = OPPONENT_NAME
		ifTrue: [ self togglePanelVisibilityOn: aTerminal ].
	[ self changed: varName asSymbol ] executeOnUIThread