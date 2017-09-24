Class {
	#name : #LOTJCartographerRadialVisitor,
	#superclass : #Object,
	#instVars : [
		'room'
	],
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #'instance creation' }
LOTJCartographerRadialVisitor class >> new [
	self error: 'Use #room:'
]

{ #category : #'instance creation' }
LOTJCartographerRadialVisitor class >> room: aRoom [
	^ self basicNew 	
		initializeRoom: aRoom;
		yourself
]

{ #category : #initialization }
LOTJCartographerRadialVisitor >> initializeRoom: aRoom [ 
	room := aRoom.
	self initialize
]

{ #category : #accessing }
LOTJCartographerRadialVisitor >> room [
	^ room
]

{ #category : #enumerating }
LOTJCartographerRadialVisitor >> withLevelConnectionsDo: aBlock [
	self 
		withNext: { self room } 
		excluding: #()
		levelConnectionsDo: aBlock
]

{ #category : #private }
LOTJCartographerRadialVisitor >> withNext: aCollection excluding: excludeCollection levelConnectionsDo: aBlock [
	| next |
	
	aCollection ifEmpty: [ ^ self ].
	next := OrderedCollection new.
	aCollection do: [ :eachRoom | 
		eachRoom withLevelConnectionsDo: [ :eachConnection |
			(excludeCollection includes: eachConnection room) ifFalse: [ 
				aBlock value: eachConnection.
				next add: eachConnection room ] ] ].
	self 
		withNext: next 
		excluding: (excludeCollection, next) 
		levelConnectionsDo: aBlock
]
