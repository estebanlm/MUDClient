*MUDClient-View
addMorph: aMorph position: aSymbol
	| position |
	
	"Possible positions: #topLeft, #topRight, #bottomLeft #bottomRight"	
	position := self calculatePositionOf: aMorph position: aSymbol. 
	aMorph position: position.
	^ self addMorph: aMorph