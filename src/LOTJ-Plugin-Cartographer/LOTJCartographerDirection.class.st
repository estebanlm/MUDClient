"
I'm a direction.
"
Class {
	#name : #LOTJCartographerDirection,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerDirection class >> all [ 
	^ self subclasses collect: #uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> allKnown [
	^ self all reject: #isUnknown
]

{ #category : #accessing }
LOTJCartographerDirection class >> directions [
	^ self subclassResponsibility
]

{ #category : #accessing }
LOTJCartographerDirection class >> down [
	^ LOTJCartographerDown uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> east [
	^ LOTJCartographerEast uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> findByName: aString [
	^ self perform: aString asLowercase asSymbol
]

{ #category : #accessing }
LOTJCartographerDirection class >> findByName: aString ifAbsent: aBlock [
	| selector |
	selector := aString asLowercase asSymbol.
	^ (self class includesSelector: selector)
		ifTrue: [ self perform: selector ]
		ifFalse: aBlock
]

{ #category : #'instance creation' }
LOTJCartographerDirection class >> fromSton: stonReader [
	^ self uniqueInstance
		fromSton: stonReader;
		yourself	
]

{ #category : #'instance creation' }
LOTJCartographerDirection class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #accessing }
LOTJCartographerDirection class >> north [
	^ LOTJCartographerNorth uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> northeast [
	^ LOTJCartographerNortheast uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> northwest [
	^ LOTJCartographerNorthwest uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> south [
	^ LOTJCartographerSouth uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> southeast [
	^ LOTJCartographerSoutheast uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> southwest [
	^ LOTJCartographerSouthwest uniqueInstance
]

{ #category : #'instance creation' }
LOTJCartographerDirection class >> uniqueInstance [
	self = LOTJCartographerDirection 
		ifTrue: [ self error: 'I''m abstract, use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #accessing }
LOTJCartographerDirection class >> unknown [ 
	^ LOTJCartographerUnknown uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> up [
	^ LOTJCartographerUp uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection class >> west [
	^ LOTJCartographerWest uniqueInstance
]

{ #category : #converting }
LOTJCartographerDirection >> asDirection [
	^ self
]

{ #category : #accessing }
LOTJCartographerDirection >> asciiConnector [
	"This is used for the ASCII exporter"
	^ nil
]

{ #category : #converting }
LOTJCartographerDirection >> connectsTo: aRoom [
	^ LOTJCartographerRoomConnection 
		direction: self 
		room: aRoom
]

{ #category : #accessing }
LOTJCartographerDirection >> coordinateModifier [
	"This just has sense on level connections, to draw them"
	^ nil
]

{ #category : #descriptions }
LOTJCartographerDirection >> descriptionLabel [
	^ MAStringDescription new 
		priority: 10;
		accessor: #printString;
		beReadonly;
		yourself
]

{ #category : #accessing }
LOTJCartographerDirection >> directionShortString [
	^ self class directions first
]

{ #category : #hooks }
LOTJCartographerDirection >> fuelAccept: aGeneralMapper [
	^ aGeneralMapper 
		visitGlobalSend: self 
		name: self className 
		selector: #uniqueInstance
]

{ #category : #accessing }
LOTJCartographerDirection >> inverse [
	^ self subclassResponsibility
]

{ #category : #testing }
LOTJCartographerDirection >> isLevel [
	^ self ~= self class unknown 
		and: [ self ~= self class up 
		and: [ self ~= self class down ] ]
]

{ #category : #testing }
LOTJCartographerDirection >> isUnknown [
	^ false
]

{ #category : #accessing }
LOTJCartographerDirection >> label [
	^ self class label
]

{ #category : #testing }
LOTJCartographerDirection >> matches: aString [
	^ self class directions includes: aString trimBoth
]

{ #category : #printing }
LOTJCartographerDirection >> printOn: stream [ 
	stream << self label
]
