accessing
size

	readIndex = writeIndex ifTrue: [ ^ overlapp ifTrue: [ self capacity ] ifFalse: [ 0 ] ].
	
	^ readIndex < writeIndex 
		ifTrue: [ writeIndex - readIndex ]
		ifFalse: [ self capacity - (readIndex - writeIndex) ]