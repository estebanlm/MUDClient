command processing
processOn: aTerminal command: aCommand
	| varName varValue values |
	
	varName := aCommand variable variableName.
	varValue := aCommand variable value.
	
	varName = SERVER_ID ifTrue: [ ^ self activateOn: aTerminal ].
	varName = ROOM_VNUM ifFalse: [ ^ self ].
	"values := (MUDMSDPSendCommand on: aTerminal)
		variables: { ROOM_NAME. ROOM_EXITS };
		executeAndWait."