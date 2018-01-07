"
I'm a base decoration to modify the text I will display in terminal.
"
Class {
	#name : #MUDParseDecoration,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : #'MUDClient-View-Morph'
}

{ #category : #accessing }
MUDParseDecoration >> next [
	^ next
]

{ #category : #accessing }
MUDParseDecoration >> next: anObject [
	next := anObject
]

{ #category : #parsing }
MUDParseDecoration >> parse: aString [
	self subclassResponsibility
]

{ #category : #parsing }
MUDParseDecoration >> parseNext: aString [ 
	^ self next 
		ifNotNil: [ :decoration | decoration parse: aString ]
		ifNil: [ aString ]
]
