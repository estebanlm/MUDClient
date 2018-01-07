Class {
	#name : #MUDTextStyler,
	#superclass : #Object,
	#instVars : [
		'text'
	],
	#category : #'MUDClient-View-Text'
}

{ #category : #accessing }
MUDTextStyler >> applyStyle: aString [
	self subclassResponsibility
]

{ #category : #accessing }
MUDTextStyler >> text [
	^ text
]

{ #category : #accessing }
MUDTextStyler >> text: anObject [
	text := anObject
]
