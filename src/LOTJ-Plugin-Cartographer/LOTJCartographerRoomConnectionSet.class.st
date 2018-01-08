"
I'm a set of rooms on same direction. 
This is useful for keeping the connections of lifts, etc. who can actualy point to other areas.
"
Class {
	#name : #LOTJCartographerRoomConnectionSet,
	#superclass : #Object,
	#instVars : [
		'direction',
		'rooms'
	],
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerRoomConnectionSet class >> direction: aDirection [
	^ self new direction: aDirection
]

{ #category : #copying }
LOTJCartographerRoomConnectionSet >> , aRoom [
	self add: aRoom
]

{ #category : #adding }
LOTJCartographerRoomConnectionSet >> add: aRoom [ 
	(rooms includes: aRoom) ifTrue: [ ^ self ]. 
	rooms add: aRoom
]

{ #category : #accessing }
LOTJCartographerRoomConnectionSet >> collectLevelRoomsInto: aCollection [ 
	"Multiple connections are natural stops (because we don't know where to go)"
	^ aCollection
]

{ #category : #accessing }
LOTJCartographerRoomConnectionSet >> direction [
	^ direction
]

{ #category : #accessing }
LOTJCartographerRoomConnectionSet >> direction: anObject [
	direction := anObject
]

{ #category : #inspecting }
LOTJCartographerRoomConnectionSet >> gtDisplayOn: stream [ 
	stream << '['.
	self rooms 
		do: [ :each | each gtDisplayOn: stream  ]
		separatedBy: [ stream << ', ' ].
	stream << ']'
]

{ #category : #testing }
LOTJCartographerRoomConnectionSet >> includes: aRoom [
	^ self rooms includes: aRoom
]

{ #category : #initialization }
LOTJCartographerRoomConnectionSet >> initialize [
	super initialize.
	rooms := Set new
]

{ #category : #testing }
LOTJCartographerRoomConnectionSet >> isSimple [
	^ false
]

{ #category : #printing }
LOTJCartographerRoomConnectionSet >> printOn: stream [ 
	stream print: self rooms
]

{ #category : #accessing }
LOTJCartographerRoomConnectionSet >> removeAllConnections [
	self shouldBeImplemented.
]

{ #category : #accessing }
LOTJCartographerRoomConnectionSet >> rooms [
	^ rooms
]
