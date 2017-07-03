accessing
roomAt: aNumber ifPresent: aBlock
	^ self 
		roomAt: aNumber 
		ifPresent: aBlock
		ifAbsent: [ "Do nothing" ]