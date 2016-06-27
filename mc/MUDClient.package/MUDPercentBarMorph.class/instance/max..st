accessing
max: aNumber 
	self max = aNumber ifTrue: [ ^ self ].
	max := aNumber.
	self changed.