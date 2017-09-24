Class {
	#name : #LOTJCartographerMap,
	#superclass : #Object,
	#instVars : [
		'name',
		'rooms'
	],
	#pools : [
		'LOTJMSDPVariables'
	],
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerMap >> addRoom: aRoom [
	aRoom map: self.
	^ self rooms 
		at: aRoom number 
		put: aRoom
]

{ #category : #accessing }
LOTJCartographerMap >> addRoomWithNumber: aNumber [
	^ self addRoom: (LOTJCartographerRoom number: aNumber)
]

{ #category : #testing }
LOTJCartographerMap >> containsRoom: aRoom [
	^ self rooms includes: aRoom
]

{ #category : #testing }
LOTJCartographerMap >> containsRoomNumber: aNumber [
	^ self rooms 
		at: aNumber
		ifPresent: [ :each | true ]
		ifAbsent: [ false ]
]

{ #category : #'private factory' }
LOTJCartographerMap >> createRoomWithNumber: aNumber [
	^ LOTJCartographerRoom number: aNumber
	
]

{ #category : #initialization }
LOTJCartographerMap >> initialize [
	super initialize.
	rooms := Dictionary new
]

{ #category : #accessing }
LOTJCartographerMap >> name [
	^ name
]

{ #category : #accessing }
LOTJCartographerMap >> name: anObject [
	name := anObject
]

{ #category : #accessing }
LOTJCartographerMap >> roomAt: aNumber ifAbsent: aBlock [
	^ self 
		roomAt: aNumber
		ifPresent: [ :found | found ]
		ifAbsent: aBlock
]

{ #category : #accessing }
LOTJCartographerMap >> roomAt: aNumber ifPresent: aBlock [
	^ self 
		roomAt: aNumber 
		ifPresent: aBlock
		ifAbsent: [ "Do nothing" ]
]

{ #category : #accessing }
LOTJCartographerMap >> roomAt: aNumber ifPresent: foundBlock ifAbsent: noneBlock [
	^ self rooms
		at: aNumber
		ifPresent: foundBlock
		ifAbsent: noneBlock 
]

{ #category : #accessing }
LOTJCartographerMap >> rooms [
	^ rooms
]
