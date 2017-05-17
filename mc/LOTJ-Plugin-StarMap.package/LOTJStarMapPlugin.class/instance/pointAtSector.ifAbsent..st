accessing
pointAtSector: aPoint ifAbsent: aBlock 
	^ self points 
		detect: [ :each | each sector = aPoint ]
		ifNone: aBlock