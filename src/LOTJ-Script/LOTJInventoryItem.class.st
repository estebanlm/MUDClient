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

{ #category : #descriptions }
LOTJInventoryItem >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 10;
		label: 'Name';
		accessor: #name;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJInventoryItem >> descriptionQuantity [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 20;
		label: 'Quantity';
		accessor: #quantity;
		beReadonly;
		yourself
]

{ #category : #'instance creation' }
LOTJInventoryItem >> fromString: aString [
	self name: (aString copyUpToLast: $() trimBoth.	
	self quantity: (((aString copyAfterLast: $() select: #isDigit) 
		ifNotEmpty: #asNumber
		ifEmpty: [ 1 ])
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
