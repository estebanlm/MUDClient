"
I'm a record of things happening on cartographer. 
I record
- last movement of character
- origin room
- arrival room 

with this is possible to generate a path (who will in time become a map)
"
Class {
	#name : #LOTJCartographerRecord,
	#superclass : #Object,
	#instVars : [
		'direction',
		'originRoom',
		'arrivalRoomNumber',
		'arrivalRoom'
	],
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerRecord >> arrivalRoom [
	^ arrivalRoom
]

{ #category : #accessing }
LOTJCartographerRecord >> arrivalRoom: anObject [
	arrivalRoom := anObject
]

{ #category : #accessing }
LOTJCartographerRecord >> arrivalRoomNumber [
	^ arrivalRoomNumber
]

{ #category : #accessing }
LOTJCartographerRecord >> arrivalRoomNumber: anObject [
	arrivalRoomNumber := anObject
]

{ #category : #accessing }
LOTJCartographerRecord >> direction [
	^ direction
]

{ #category : #accessing }
LOTJCartographerRecord >> direction: anObject [
	direction := anObject
]

{ #category : #testing }
LOTJCartographerRecord >> isRecordComplete [ 
	self direction ifNil: [ ^ false ].
	(self originRoom isNil or: [ self originRoom isValid not ])
		ifTrue: [ ^ false ].
	(self arrivalRoom isNil or: [ self arrivalRoom isValid not ])
		ifTrue: [ ^ false ].
	^ true
]

{ #category : #accessing }
LOTJCartographerRecord >> originRoom [
	^ originRoom
]

{ #category : #accessing }
LOTJCartographerRecord >> originRoom: anObject [
	originRoom := anObject
]

{ #category : #actions }
LOTJCartographerRecord >> register [
	self isRecordComplete ifFalse: [ ^ self ].
	"Come from nowhere, it was likelly a change of area"
	"self direction ifNil: [ ^ self ]. "
	"No idea how this arrived here. But unknown is to ignore."
	"self direction = LOTJCartographerDirection unknown ifNil: [ ^ self ]."
	self originRoom 
		addConnection: (self direction ifNil: [ LOTJCartographerDirection unknown ])
		to: self arrivalRoom
]
