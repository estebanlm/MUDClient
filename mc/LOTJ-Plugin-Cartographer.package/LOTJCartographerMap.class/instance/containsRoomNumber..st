testing
containsRoomNumber: aNumber
	^ self rooms 
		at: aNumber
		ifPresent: [ :each | true ]
		ifAbsent: [ false ]