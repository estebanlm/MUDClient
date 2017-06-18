testing
isRecordComplete 
	self direction ifNil: [ ^ false ].
	(self originRoom isNil or: [ self originRoom isValid not ])
		ifTrue: [ ^ false ].
	(self arrivalRoom isNil or: [ self arrivalRoom isValid not ])
		ifTrue: [ ^ false ].
	^ true