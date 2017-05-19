actions
storeNote: aString on: aPoint
	(aPoint notes ifNil: [ '' ]) = aString trimBoth ifTrue: [ ^ self ].
	
	aPoint notes: aString.
	self plugin addPoint: aPoint