Extension { #name : #Morph }

{ #category : #'*MUDClient-View' }
Morph >> addMorph: aMorph position: aSymbol [
	| position |
	
	"Possible positions: #topLeft, #topRight, #bottomLeft #bottomRight"	
	position := self calculatePositionOf: aMorph position: aSymbol. 
	aMorph position: position.
	^ self addMorph: aMorph
]

{ #category : #'*MUDClient-View' }
Morph >> calculatePositionOf: aMorph position: aSymbol [
	aSymbol == #topLeft ifTrue: [ ^ self position ].
	aSymbol == #topRight ifTrue: [ ^ (self width - aMorph width)@(self position y) ].
	aSymbol == #bottomLeft ifTrue: [ ^ (self position x)@(self height - aMorph height) ].
	aSymbol == #bottomRight ifTrue: [ ^ self bounds corner - aMorph extent ].

	self error: 'Unknown position.'
]
