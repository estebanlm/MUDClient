accessing
incrementDistance
	self basicIncrementDistance.
	(self room 
		connectionAt: self direction inverse 
		ifAbsent: [ Error signal: 'This should not happen' ])
		basicIncrementDistance