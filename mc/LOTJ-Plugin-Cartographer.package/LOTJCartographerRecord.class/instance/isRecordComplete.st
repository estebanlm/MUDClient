testing
isRecordComplete 
	self direction ifNil: [ ^ false ].
	(self originRoom isNil or: [ self originRoom isValid not ])
		ifFalse: [ ^ false ].
	(self arrivalRoom isNil or: [ self arrivalRoom isValid not ])
		ifFalse: [ ^ false ].
	^ true