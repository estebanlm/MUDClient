command processing
processOn: aTerminal command: aCommand
	| varName varValue |
	varName := aCommand variable variableName.
	varValue := aCommand variable value.
	
	varName = SERVER_ID ifTrue: [ ^ self activateOn: aTerminal ].
	
	varName = ROOM_VNUM 
		ifTrue: [ 
			self recordOriginRoom: self actualRoom.
			self moveActualRoomTo: varValue.
			self recordArrivalRoom: self actualRoom.
			self registerRecordedMovement ]
		ifFalse: [ 
			self actualRoom valueAt: varName put: varValue ]