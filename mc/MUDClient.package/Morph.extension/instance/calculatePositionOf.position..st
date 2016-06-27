*MUDClient-View
calculatePositionOf: aMorph position: aSymbol
	aSymbol == #topLeft ifTrue: [ ^ self position ].
	aSymbol == #topRight ifTrue: [ ^ (self width - aMorph width)@(self position y) ].
	aSymbol == #bottomLeft ifTrue: [ ^ (self position x)@(self height - aMorph height) ].
	aSymbol == #bottomRight ifTrue: [ ^ self bounds corner - aMorph extent ].

	self error: 'Unknown position.'