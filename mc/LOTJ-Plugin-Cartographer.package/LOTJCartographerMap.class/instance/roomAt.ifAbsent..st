accessing
roomAt: aNumber ifAbsent: aBlock
	^ self 
		roomAt: aNumber
		ifPresent: [ :found | found ]
		ifAbsent: aBlock