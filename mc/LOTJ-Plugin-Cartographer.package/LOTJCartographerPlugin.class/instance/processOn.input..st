command processing
processOn: aTerminal input: aString
	"Chekc if 'direction' command: 
	n, s, e, o, ne, nw, se, sw, u, d"
	| direction | 
	
	direction := LOTJCartographerDirection all
		detect: [ :each | each matches: aString ]
		ifNone: [ ^ self "No direction, leave" ].
	"Check if it is expected exit"
	(self actualRoom exits includes: direction) 
		ifTrue: [ self recordDirection: direction ]