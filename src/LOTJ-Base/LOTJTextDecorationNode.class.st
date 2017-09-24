Class {
	#name : #LOTJTextDecorationNode,
	#superclass : #PPCompositeParser,
	#instVars : [
		'decoration',
		'text'
	],
	#category : 'LOTJ-Base-TextDecoration'
}

{ #category : #'instance creation' }
LOTJTextDecorationNode class >> decoration: aCharacter text: aString [
	^ self basicNew 
		initializeDecoration: aCharacter text: aString;
		yourself
]

{ #category : #'instance creation' }
LOTJTextDecorationNode class >> new [ 
	self error: 'Use one of my creation methods'
]

{ #category : #'instance creation' }
LOTJTextDecorationNode class >> text: aString [ 
	^ self decoration: nil text: aString
]

{ #category : #accessing }
LOTJTextDecorationNode >> decoration [
	^ decoration
]

{ #category : #initialization }
LOTJTextDecorationNode >> initializeDecoration: aCharacter text: aString [
	self initialize.
	decoration := aCharacter.
	text := aString.
]

{ #category : #printing }
LOTJTextDecorationNode >> printOn: aStream [ 
	self decoration 
		ifNotNil: [ 
			aStream 
				nextPut: $&;
				nextPut: self decoration ].
	aStream nextPutAll: self text.
]

{ #category : #accessing }
LOTJTextDecorationNode >> text [
	^ text
]
