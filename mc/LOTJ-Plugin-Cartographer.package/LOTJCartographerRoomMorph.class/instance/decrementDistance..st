actions
decrementDistance: aDirection
	| connection |
	connection  := self room 
		connectionAt: aDirection 
		ifAbsent: [ ^ self ]. 
	connection decrementDistance