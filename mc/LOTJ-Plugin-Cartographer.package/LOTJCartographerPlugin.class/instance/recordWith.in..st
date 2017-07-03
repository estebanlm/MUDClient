command processing
recordWith: aDictionary in: aTerminal
	| record lastDirection roomNumber originRoom arrivalRoom |
	
	originRoom := aDictionary at: #originRoom.
	lastDirection :=aDictionary at: #lastRecordedDirection.
	roomNumber := (aDictionary at: ROOM_VNUM) asNumber.
	
	record := LOTJCartographerRecord new.
	record direction: lastDirection.
	(originRoom notNil and: [ originRoom isValid ]) 
		ifTrue: [ record originRoom: originRoom ].
	arrivalRoom := self case 
		startingAt: (originRoom ifNotNil: [ originRoom map ])
		roomWithNumber: roomNumber 
		ifNone: [ | map |
			map := (originRoom 
				ifNotNil: [ originRoom map ]
				ifNil: [ self case addMap ]).
			map addRoomWithNumber: roomNumber ].
	record arrivalRoom: arrivalRoom.
	arrivalRoom 
		ROOMEXITS: (aDictionary at: ROOM_EXITS);
		ROOMNAME:(aDictionary at: ROOM_NAME).
	record register.
	actualRoom := arrivalRoom.
	self updateActualRoomIn: aTerminal