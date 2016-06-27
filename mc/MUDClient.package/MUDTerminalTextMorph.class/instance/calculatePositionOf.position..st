private
calculatePositionOf: aMorph position: aSymbol
	| position |
	
	position := super calculatePositionOf: aMorph position: aSymbol. 
	(aSymbol == #topRight or: [ aSymbol == #bottomRight ]) 
		ifTrue: [ position := position - (14@0) ].
	 ^ position
