command processing
processOn: aTerminal command: aCommand
	| varName varValue |
	
	varName := aCommand variable variableName.
	varValue := aCommand variable value.
	
	varName = SERVER_ID ifTrue: [ ^ self activateOn: aTerminal ].
	varName = ROOM_VNUM ifFalse: [ ^ self ].
	(MUDMSDPSendCommand on: aTerminal)
		variables: { ROOM_NAME. ROOM_EXITS };
		executeThen: [ :values |
			self isActualRoomAvailable ifTrue: [ 
				self recordOriginRoom: self actualRoom ].
			self moveActualRoomTo: varValue asInteger.
			self recordArrivalRoom: self actualRoom.
			self actualRoom addValues: values.
			self registerRecordedMovement.
			self updateActualRoomIn: aTerminal ]