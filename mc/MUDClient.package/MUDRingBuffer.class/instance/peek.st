accessing
peek

	self isEmpty ifTrue: [ ^ nil ].
	
	^ array at: readIndex.