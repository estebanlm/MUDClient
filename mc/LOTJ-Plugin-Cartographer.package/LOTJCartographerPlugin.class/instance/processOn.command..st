command processing
processOn: aTerminal command: aCommand
	| varName varValue |
	
	varName := aCommand variable variableName.
	varValue := aCommand variable value.
	
	varName = SERVER_ID ifTrue: [ ^ self activateOn: aTerminal ].
	varName = ROOM_VNUM ifFalse: [ ^ self ].
	(MUDMSDPSendCommand on: aTerminal)
		value: { 
			#lastRecordedDirection -> self lastRecordedDirection. 
			#originRoom -> self actualRoom. 
			ROOM_VNUM -> varValue asNumber } asDictionary;
		variables: { ROOM_NAME. ROOM_EXITS };
		executeThen: [ :values | self recordWith: values in: aTerminal ].
	self reset