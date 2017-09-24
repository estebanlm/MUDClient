Class {
	#name : #MUDFonts,
	#superclass : #Object,
	#category : 'MUDClient-Fonts'
}

{ #category : #accessing }
MUDFonts class >> terminalFont [
	^ LogicalFont familyName: 'Consolas' pointSize: 10
]
