"
I'm a connection for a room. 
I have a direction and the destination room.
"
Class {
	#name : #LOTJCartographerRoomConnection,
	#superclass : #Object,
	#instVars : [
		'direction',
		'room',
		'distance'
	],
	#pools : [
		'LOTJMSDPVariables'
	],
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #'instance creation' }
LOTJCartographerRoomConnection class >> direction: aDirection room: aRoom [
	^ self new
		direction: aDirection; 
		room: aRoom;
		yourself
]

{ #category : #copying }
LOTJCartographerRoomConnection >> , aRoom [
	^ (LOTJCartographerRoomConnectionSet direction: self direction) 
		add: self room;
		add: aRoom;
		yourself
]

{ #category : #private }
LOTJCartographerRoomConnection >> basicDecrementDistance [
	distance := distance - 1
]

{ #category : #private }
LOTJCartographerRoomConnection >> basicIncrementDistance [
	self distance. "Ensure initialize"
	distance := distance + 1
]

{ #category : #accessing }
LOTJCartographerRoomConnection >> decrementDistance [
	self distance = 1 ifTrue: [ ^ self ].
	self basicDecrementDistance.
	(self room 
		connectionAt: self direction inverse 
		ifAbsent: [ Error signal: 'This should not happen' ])
		basicDecrementDistance
]

{ #category : #descriptions }
LOTJCartographerRoomConnection >> descriptionLabel [
	^ MAStringDescription new 
		priority: 10;
		accessor: #printString;
		beReadonly;
		yourself
]

{ #category : #accessing }
LOTJCartographerRoomConnection >> direction [
	^ direction
]

{ #category : #accessing }
LOTJCartographerRoomConnection >> direction: anObject [
	direction := anObject
]

{ #category : #accessing }
LOTJCartographerRoomConnection >> distance [
	^ distance ifNil: [ distance := 1 ].
]

{ #category : #testing }
LOTJCartographerRoomConnection >> includes: aRoom [ 
	^ self room = aRoom
]

{ #category : #accessing }
LOTJCartographerRoomConnection >> incrementDistance [
	self basicIncrementDistance.
	(self room 
		connectionAt: self direction inverse 
		ifAbsent: [ Error signal: 'This should not happen' ])
		basicIncrementDistance
]

{ #category : #testing }
LOTJCartographerRoomConnection >> isSimple [
	^ true
]

{ #category : #printing }
LOTJCartographerRoomConnection >> printOn: stream [ 
	stream 
		print: self direction;
		<< '->';
		print: self room
]

{ #category : #accessing }
LOTJCartographerRoomConnection >> room [
	^ room
]

{ #category : #accessing }
LOTJCartographerRoomConnection >> room: anObject [
	room := anObject
]
