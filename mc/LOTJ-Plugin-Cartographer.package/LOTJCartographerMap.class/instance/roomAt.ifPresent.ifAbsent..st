accessing
roomAt: aNumber ifPresent: foundBlock ifAbsent: noneBlock
	^ self rooms
		at: aNumber
		ifPresent: foundBlock
		ifAbsent: noneBlock 