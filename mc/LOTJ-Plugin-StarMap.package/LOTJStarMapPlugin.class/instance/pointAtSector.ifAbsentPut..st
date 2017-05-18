accessing
pointAtSector: aPoint ifAbsentPut: aBlock 
	^ self points 
		detect: [ :each | each sector = aPoint ]
		ifNone: [ self addPoint: aBlock value ]