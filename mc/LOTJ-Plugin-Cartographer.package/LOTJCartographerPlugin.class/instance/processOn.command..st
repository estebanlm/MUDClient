command processing
processOn: aTerminal command: aCommand
	| varName varValue |
	
	varName := aCommand variable variableName.
	varValue := aCommand variable value.
	
	varName = SERVER_ID ifTrue: [ ^ self activateOn: aTerminal ].
	varName = ROOM_VNUM ifFalse: [ ^ self ].
	(MUDMSDPSendCommand on: aTerminal)
		variables: { ROOM_NAME. ROOM_EXITS };
		onAnswer: [ :values |
			self recordOriginRoom: self actualRoom.
			self moveActualRoomTo: varValue asInteger.
			self actualRoom 
				name: (values at: ROOM_NAME);
				exits: (values at: ROOM_EXITS).
			self recordArrivalRoom: self actualRoom.
			self registerRecordedMovement ]