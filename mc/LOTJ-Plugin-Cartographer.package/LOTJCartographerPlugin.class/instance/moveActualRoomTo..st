private
moveActualRoomTo: roomNumber
	actualRoom := self rooms 
		at: roomNumber
		ifAbsentPut: [ LOTJCartographerRoom number: roomNumber ]