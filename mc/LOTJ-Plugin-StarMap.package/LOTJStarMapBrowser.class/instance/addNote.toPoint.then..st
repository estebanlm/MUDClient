actions
addNote: aString toPoint: aPoint then: aBlock
	aString trimBoth = (aPoint notes ifNil: [ '' ]) ifTrue: [ ^ self ].
	
	aPoint notes: aString.
	(self plugin hasPoint: aPoint) 
		ifFalse:[ 
			self plugin addPoint: aPoint.
			aBlock value ]