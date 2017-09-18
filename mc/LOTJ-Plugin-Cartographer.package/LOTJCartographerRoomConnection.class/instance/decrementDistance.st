accessing
decrementDistance
	self distance = 1 ifTrue: [ ^ self ].
	self basicDecrementDistance.
	(self room 
		connectionAt: self direction inverse 
		ifAbsent: [ Error signal: 'This should not happen' ])
		basicDecrementDistance