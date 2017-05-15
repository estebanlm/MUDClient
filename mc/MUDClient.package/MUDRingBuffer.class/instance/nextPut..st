accessing
nextPut: aValue

	array at: writeIndex put: aValue.
	
	self incrementWrite.
	
	^ aValue 