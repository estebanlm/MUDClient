accessing
roomWithNumber: aNumber ifFound: foundBlock ifNone: noneBlock
	^ self rooms
		at: aNumber
		ifPresent: foundBlock
		ifAbsent: noneBlock 