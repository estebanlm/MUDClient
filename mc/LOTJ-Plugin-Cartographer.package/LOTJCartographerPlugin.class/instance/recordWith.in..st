command processing
recordWith: aDictionary in: aTerminal
	| record arrivalRoom |
	
	record := aDictionary at: #record.
	arrivalRoom := self map 
		roomAt: record arrivalRoomNumber 
		ifAbsent: [ self map addRoomWithNumber: record arrivalRoomNumber ].
	record arrivalRoom: arrivalRoom.
	arrivalRoom 
		ROOMEXITS: (aDictionary at: ROOM_EXITS);
		ROOMNAME:(aDictionary at: ROOM_NAME).
	record register.
	actualRoom := arrivalRoom.
	self updateActualRoomIn: aTerminal