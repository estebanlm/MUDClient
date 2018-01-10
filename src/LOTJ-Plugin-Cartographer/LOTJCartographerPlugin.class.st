"
I'm a cartographer plugin. 
I receive information about rooms and create the conections between them.

I use MSDP variables ROOMVNUM, ROOMNAME, ROOMEXITS and I also process the input to detect the movement direction (n, s, e, w, nw, ne, sw, se, u, d).
"
Class {
	#name : #LOTJCartographerPlugin,
	#superclass : #MUDPlugin,
	#instVars : [
		'actualRoom',
		'lastRecordedDirection',
		'map'
	],
	#classVars : [
		'TaskRunner'
	],
	#pools : [
		'LOTJMSDPVariables',
		'MUDTelnetConstantsMSDP'
	],
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #private }
LOTJCartographerPlugin class >> runner [
	^ TaskRunner ifNil: [ TaskRunner := TKTNewProcessTaskRunner new ]
]

{ #category : #persistence }
LOTJCartographerPlugin class >> voyageActualRoom [
	<voyageDescription>
	
	^ VOTransientDescription new 
		attributeName: 'actualRoom';
		yourself
]

{ #category : #persistence }
LOTJCartographerPlugin class >> voyageLastRecordedDirection [
	<voyageDescription>
	
	^ VOTransientDescription new 
		attributeName: 'lastRecordedDirection';
		yourself
]

{ #category : #persistence }
LOTJCartographerPlugin class >> voyageMap [
	<voyageDescription>
	
	^ VOTransientDescription new 
		attributeName: 'map';
		yourself
]

{ #category : #testing }
LOTJCartographerPlugin >> acceptsProcotolCommand: aCommand [
	^ (self reportVariables includes: aCommand variable variableName)
		or: [ aCommand variable variableName = SERVER_ID ]
]

{ #category : #private }
LOTJCartographerPlugin >> activateOn: aTerminal [
	"Send reportable variables"
	(MUDServerMSDPReportCommand on: aTerminal)
		variables: self reportVariables;
		execute.
	"Send me the VNUM right now: I want to know where I am"
	"(MUDMSDPSendCommand on: aTerminal)
		variables: ROOM_VNUM;
		execute. "

]

{ #category : #accessing }
LOTJCartographerPlugin >> actualRoom [
	^ actualRoom
]

{ #category : #filtering }
LOTJCartographerPlugin >> filterOn: aTerminal input: aString [
	self class runner 
		schedule: [ self processOn: aTerminal input: aString ].
	^ super filterOn: aTerminal input: aString
]

{ #category : #initialization }
LOTJCartographerPlugin >> initialize [
	super initialize.
	map := LOTJCartographerMap new
]

{ #category : #testing }
LOTJCartographerPlugin >> isProcessingProtocol: protocolId [
	^ protocolId == MSDP
]

{ #category : #private }
LOTJCartographerPlugin >> lastRecordedDirection [
	^ lastRecordedDirection
]

{ #category : #accessing }
LOTJCartographerPlugin >> map [
	^ map
]

{ #category : #'command processing' }
LOTJCartographerPlugin >> processOn: aTerminal command: aCommand [
	| varName varValue |
	
	varName := aCommand variable variableName.
	varValue := aCommand variable value.
	
	varName = SERVER_ID ifTrue: [ ^ self activateOn: aTerminal ].
	varName = ROOM_VNUM ifFalse: [ ^ self ].
	(MUDMSDPSendCommand on: aTerminal)
		valueAt: #record put: (LOTJCartographerRecord new 
			direction: self lastRecordedDirection;
			originRoom: self actualRoom;
			arrivalRoomNumber: varValue asNumber;
			yourself);
		variables: { ROOM_NAME. ROOM_EXITS };
		executeThen: [ :values | 
			self recordWith: values in: aTerminal ].
	self reset
]

{ #category : #'command processing' }
LOTJCartographerPlugin >> processOn: aTerminal input: aString [
	"Chekc if 'direction' command: 
	n, s, e, o, ne, nw, se, sw, u, d"
	| direction | 
	
	direction := LOTJCartographerDirection all
		detect: [ :each | each matches: aString ]
		ifNone: [ ^ self "No direction, leave" ].
	"Check if it is expected exit"
	(self actualRoom exits includes: direction) 
		ifTrue: [ self recordDirection: direction ]
]

{ #category : #private }
LOTJCartographerPlugin >> recordDirection: aDirection [
	lastRecordedDirection := aDirection
]

{ #category : #'command processing' }
LOTJCartographerPlugin >> recordWith: aDictionary in: aTerminal [
	| record arrivalRoom |
	
	record := aDictionary at: #record.
	arrivalRoom := self map 
		roomAt: record arrivalRoomNumber 
		ifAbsent: [ self map addRoomWithNumber: record arrivalRoomNumber ].
	record arrivalRoom: arrivalRoom.
	arrivalRoom 
		ROOMEXITS: (aDictionary at: ROOM_EXITS);
		ROOMNAME:(aDictionary at: ROOM_NAME).
	record register.
	actualRoom := arrivalRoom.
	self updateActualRoomIn: aTerminal
]

{ #category : #actions }
LOTJCartographerPlugin >> removeLevel [
	"self actualRoom withAllLevelRoomsDo: [ :each | 
		self rooms 
			removeKey: each number
			ifAbsent: [ ] ]."

]

{ #category : #accessing }
LOTJCartographerPlugin >> reportVariables [
	^ { ROOM_VNUM }
]

{ #category : #private }
LOTJCartographerPlugin >> reset [
	lastRecordedDirection := nil
]

{ #category : #private }
LOTJCartographerPlugin >> updateActualRoomIn: aTerminal [
	| windows |
	windows := aTerminal dependentWindowsOf: self.
	windows do: [ :each | each selectRoom: self actualRoom ]
]
