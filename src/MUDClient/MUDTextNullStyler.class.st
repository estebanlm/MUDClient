Class {
	#name : #MUDTextNullStyler,
	#superclass : #MUDTextStyler,
	#category : #'MUDClient-View-Text'
}

{ #category : #accessing }
MUDTextNullStyler >> applyStyle: aString [
	aString linesDo: [ :each |
		text endPosition insert: each, (String cr) ]
]
