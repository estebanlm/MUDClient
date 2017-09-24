Class {
	#name : #LOTJCartographerASCIIExporter,
	#superclass : #Object,
	#instVars : [
		'room'
	],
	#category : 'LOTJ-Plugin-Cartographer-View'
}

{ #category : #accessing }
LOTJCartographerASCIIExporter class >> room: aRoom [
	^ self new room: aRoom
]

{ #category : #building }
LOTJCartographerASCIIExporter >> build [
	| size center matrix |
	
	"2 to have the full area (I will strip it later) and 2 to give space for connectors"
	size := self calculateLevelSize * 8. 
	center := (size / 2) asIntegerPoint. 
	matrix := Matrix rows: size x columns: size y.
	self traverseRoom: self room position: 0@0 do: [ :eachRoom :position | | roomPos |
		"Yep, inverted :)"
		roomPos := center + (position inversed * 2). 
		matrix 
			at: roomPos x 
			at: roomPos y 
			put: (self roomIdFor: eachRoom).
		eachRoom withLevelConnectionsDo: [ :eachConnection | | connectionPos |
			connectionPos := roomPos + eachConnection direction coordinateModifier inversed. 
			matrix 
				at: connectionPos x 
				at: connectionPos y 
				put: eachConnection direction asciiConnector ] ].
	^ String streamContents: [ :stream | 
		(matrix rows 
			reject: [ :each | each allSatisfy: #isNil ])
			do: [ :eachRow | eachRow do: [ :each | stream << (each ifNil: [ Character space ]) ] ]
			separatedBy: [ stream crlf ] ].
]

{ #category : #private }
LOTJCartographerASCIIExporter >> calculateLevelSize [
	| minX maxX minY maxY |
	minX := maxX := minY := maxY := 0.
	self traverseRoom: self room position: 0@0 do: [ :each :position | 
		minX := minX min: position x.
		minY := minY min: position y.
		maxX := maxX max: position x.
		maxY := maxY max: position y ].
	^ (maxX - minX) @ (maxY - minY)

]

{ #category : #accessing }
LOTJCartographerASCIIExporter >> room [
	^ room
]

{ #category : #accessing }
LOTJCartographerASCIIExporter >> room: anObject [
	room := anObject
]

{ #category : #private }
LOTJCartographerASCIIExporter >> roomIdFor: aRoom [
	aRoom = self room ifTrue: [ ^ $@ ].
	^ aRoom asciiId
]

{ #category : #private }
LOTJCartographerASCIIExporter >> traverseRoom: aRoom position: aPoint do: aBlock [
	self 
		traverseRoom: aRoom 
		position: aPoint 
		excluding: Set new 
		do: aBlock  
]

{ #category : #private }
LOTJCartographerASCIIExporter >> traverseRoom: aRoom position: aPoint excluding: excludes do: aBlock [  
	"Exit if is already there"
	(excludes includes: aRoom) ifTrue: [ ^ self ].

	excludes add: aRoom.
	aBlock cull: aRoom cull: aPoint.
	aRoom withLevelConnectionsDo: [ :each | 
		self 
			traverseRoom: each room 
			position: (aPoint + each direction coordinateModifier)
			excluding: excludes
			do: aBlock ]
]
