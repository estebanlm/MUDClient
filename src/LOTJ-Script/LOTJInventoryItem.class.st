Class {
	#name : #LOTJInventoryItem,
	#superclass : #Object,
	#instVars : [
		'quantity',
		'name'
	],
	#category : #'LOTJ-Script'
}

{ #category : #'instance creation' }
LOTJInventoryItem class >> fromString: aString [
	"self fromString: 'A bolt of demicot silk (19)'"
	^ self new fromString: aString
]

{ #category : #'instance creation' }
LOTJInventoryItem >> fromString: aString [
	| tuple |
	tuple := aString substrings: '()'.
	self quantity: (tuple size > 1 
		ifTrue: [ tuple second asNumber ] 
		ifFalse: [ 1 ]).
	self name: tuple first trimBoth.
]

{ #category : #accessing }
LOTJInventoryItem >> name [
	^ name
]

{ #category : #accessing }
LOTJInventoryItem >> name: anObject [
	name := anObject
]

{ #category : #accessing }
LOTJInventoryItem >> nameWithoutArticle [
	(self name asLowercase beginsWithAnyOf: #('a ' 'an ')) 
		ifTrue: [ ^ self name copyUpTo: Character space ].
	^ self name 
]

{ #category : #printing }
LOTJInventoryItem >> printOn: stream [ 
	stream << self name.
	self quantity > 1
		ifTrue: [ stream << ' (' << self quantity asString << ')' ]
]

{ #category : #accessing }
LOTJInventoryItem >> quantity [
	^ quantity
]

{ #category : #accessing }
LOTJInventoryItem >> quantity: anObject [
	quantity := anObject
]