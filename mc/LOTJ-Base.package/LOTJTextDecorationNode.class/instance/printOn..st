printing
printOn: aStream 
	self decoration 
		ifNotNil: [ 
			aStream 
				nextPut: $&;
				nextPut: self decoration ].
	aStream nextPutAll: self text.