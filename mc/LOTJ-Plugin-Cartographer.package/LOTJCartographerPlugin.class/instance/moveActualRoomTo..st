private
moveActualRoomTo: aNumber
	actualRoom := self rooms 
		at: aNumber
		ifAbsentPut: [ LOTJCartographerRoom new ]