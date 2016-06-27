accessing
value: aNumber
	self value = aNumber ifTrue: [ ^ self ]. 
	value := aNumber.
	self changed.