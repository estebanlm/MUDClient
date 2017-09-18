actions
incrementDistance: aDirection
	| connection |
	connection  := self room 
		connectionAt: aDirection 
		ifAbsent: [ ^ self ]. 
	connection incrementDistance