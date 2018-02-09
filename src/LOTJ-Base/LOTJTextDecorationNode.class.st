Class {
	#name : #LOTJTextDecorationNode,
	#superclass : #PPCompositeParser,
	#instVars : [
		'decoration',
		'text'
	],
	#classVars : [
		'DecorationANSIMap'
	],
	#classInstVars : [
		'decorationANSIMap'
	],
	#category : #'LOTJ-Base-TextDecoration'
}

{ #category : #private }
LOTJTextDecorationNode class >> createDecorationANSIMap [
	| esc |
	esc := Character escape asString.
	^ Dictionary newFromPairs: { 
	$x. esc, '[0;30m'.
	$r. esc, '[0;31m'.
	$g. esc, '[0;32m'.
	$b. esc, '[0;34m'.
	$c. esc, '[0;36m'.
	$z. esc, '[1;30m'.
	$O. esc, '[0;33m'.
	$p. esc, '[0;35m'.
	$w. esc, '[0;37m'.
		
	$R. esc, '[1;31m'.
	$G. esc, '[1;32m'.
	$B. esc, '[1;34m'.
	$C. esc, '[1;36m'.
	$Y. esc, '[1;33m'.
	$P. esc, '[1;35m'.
	$W. esc, '[1;37m'.
	}
]

{ #category : #'instance creation' }
LOTJTextDecorationNode class >> decoration: aCharacter text: aString [
	^ self basicNew 
		initializeDecoration: aCharacter text: aString;
		yourself
]

{ #category : #accessing }
LOTJTextDecorationNode class >> decorationANSIMap [ 
	^ decorationANSIMap ifNil: [ decorationANSIMap := self createDecorationANSIMap ]
]

{ #category : #accessing }
LOTJTextDecorationNode class >> decorationANSIMapAt: aString [
	^ self decorationANSIMap 
		at: aString
		ifAbsent: [ nil ]
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

{ #category : #converting }
LOTJTextDecorationNode >> decorationAsANSI [
	^ self class decorationANSIMapAt: self decoration
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

{ #category : #converting }
LOTJTextDecorationNode >> toANSI [
	^ self decoration 
		ifNotNil: [ self decorationAsANSI, self text ]
		ifNil: [ self text ]
]
