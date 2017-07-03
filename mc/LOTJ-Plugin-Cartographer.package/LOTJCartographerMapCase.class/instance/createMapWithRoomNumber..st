private factory
createMapWithRoomNumber: aNumber
	^ LOTJCartographerMap new 
		addRoom: (LOTJCartographerRoom number: aNumber);
		yourself