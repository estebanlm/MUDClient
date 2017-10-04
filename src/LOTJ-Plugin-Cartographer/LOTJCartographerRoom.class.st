"
I'm a room on a map.
"
Class {
	#name : #LOTJCartographerRoom,
	#superclass : #Object,
	#instVars : [
		'map',
		'ROOMVNUM',
		'ROOMNAME',
		'ROOMEXITS',
		'connections',
		'type',
		'notes'
	],
	#pools : [
		'LOTJMSDPVariables'
	],
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #'instance creation' }
LOTJCartographerRoom class >> number: roomNumber [
	^ self basicNew 
		initializeNumber: roomNumber;
		yourself
]

{ #category : #'accessing variables' }
LOTJCartographerRoom >> ROOMEXITS [
	^ ROOMEXITS
]

{ #category : #'accessing variables' }
LOTJCartographerRoom >> ROOMEXITS: anObject [
	^ ROOMEXITS := anObject
]

{ #category : #'accessing variables' }
LOTJCartographerRoom >> ROOMNAME [
	^ ROOMNAME
]

{ #category : #'accessing variables' }
LOTJCartographerRoom >> ROOMNAME: aString [
	^ ROOMNAME := aString
]

{ #category : #'accessing variables' }
LOTJCartographerRoom >> ROOMVNUM [
	^ ROOMVNUM
]

{ #category : #'accessing variables' }
LOTJCartographerRoom >> ROOMVNUM: aNumber [
	^ ROOMVNUM := aNumber
]

{ #category : #accessing }
LOTJCartographerRoom >> addConnection: direction to: aRoom [
	"I can just add a direction if 
		- there is no connection registered 
		- or direction allows multiple collections
		- or room type is transition (like lifts)
	AND if I have the exit in my exit list.
	 "
	((self hasConnectionTo: direction) not
		or: [ direction isMultiple 
		or: [ self type isAreaTransition ] ])
		ifFalse: [ ^ self ].
	(self exits includes: direction) ifFalse: [ ^ self ].
	
	self basicConnection: direction to: aRoom.
	aRoom basicConnection: direction inverse to: self
]

{ #category : #converting }
LOTJCartographerRoom >> asMorph [
	^ LOTJCartographerRoomMorph room: self
]

{ #category : #accessing }
LOTJCartographerRoom >> asciiId [
	"This is for the ASCII exporter"
	(self hasConnectionTo: LOTJCartographerDirection unknown) ifTrue: [ ^ $+ ].
	(self hasConnectionTo: LOTJCartographerDirection up) ifTrue: [ ^ $< ].
	(self hasConnectionTo: LOTJCartographerDirection down) ifTrue: [ ^ $> ].
	^ self type asciiId
]

{ #category : #private }
LOTJCartographerRoom >> basicConnection: direction to: aRoom [
	| previousConnection |
	
	previousConnection := self connectionAt: direction ifAbsent: [ nil ].
	previousConnection ifNil: [ 
		connections add: (direction connectsTo: aRoom). 
		^ self ].
	(previousConnection includes: aRoom) ifTrue: [ ^ self ].
	connections remove: previousConnection ifAbsent: [].
	connections add: (previousConnection, aRoom) 	
]

{ #category : #accessing }
LOTJCartographerRoom >> cleanName [
	^ LOTJTextDecorationParser cleanText: (self ROOMNAME ifNil: [ '' ])
]

{ #category : #private }
LOTJCartographerRoom >> collectLevelRoomsInto: aCollection [
	(aCollection includes: self) ifTrue: [ ^ aCollection ].
	aCollection add: self.
	self withLevelConnectionsDo: [ :each |
		each room collectLevelRoomsInto: aCollection ].
	^ aCollection
]

{ #category : #accessing }
LOTJCartographerRoom >> connectionAt: aDirectionOrSymbol ifAbsent: aBlock [
	| direction |
	direction := aDirectionOrSymbol asDirection.
	^ self connections 
		detect: [ :each | each direction = direction ] 
		ifNone: aBlock
]

{ #category : #accessing }
LOTJCartographerRoom >> connections [ 
	^ connections
]

{ #category : #descriptions }
LOTJCartographerRoom >> descriptionConnections [
	<magritteDescription>
	<presenters: #(inspect)>
	
	^ MAToManyRelationDescription new 
		priority: 30;
		label: 'Connections';
		accessor: #connections;
		reference: LOTJCartographerRoomConnection basicNew descriptionLabel asContainer;
		morphClass: TkOneToManyFastListMorph;
		tkRowsToShow: 4;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJCartographerRoom >> descriptionExits [
	<magritteDescription>
	<presenters: #(inspect view)>
	
	^ MAStringDescription new 
		priority: 20;
		label: 'Exits';
		accessor: #exitsAsString;
		morphClass: TkTextMorph;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJCartographerRoom >> descriptionName [
	<magritteDescription>
	<presenters: #(inspect view)>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #cleanName;
		morphClass: TkTextMorph;
		beReadonly;
		yourself

]

{ #category : #descriptions }
LOTJCartographerRoom >> descriptionNotes [
	<magritteDescription>
	<presenters: #(inspect)>
	
	^ MAMemoDescription new 
		priority: 100;
		label: 'Notes';
		accessor: #notes;
		lineCount: 8;
		yourself
]

{ #category : #descriptions }
LOTJCartographerRoom >> descriptionType [
	<magritteDescription>
	<presenters: #(inspect view)>
	
	^ MASingleOptionDescription new
		priority: 40;
		label: 'Type';
		accessor: #type;
		options: (LOTJCartographerRoomType allTypes sorted: [ :a :b | a label < b label ]);
		reference: LOTJCartographerRoomType default descriptionLabel asContainer; 
		morphClass: MADropListMorph;
		beRequired;
		yourself
]

{ #category : #accessing }
LOTJCartographerRoom >> exits [
	^ self ROOMEXITS 
		ifNotNil: [ :exits | 
			exits collect: [ :each | 
				LOTJCartographerDirection 
					findByName: each variableName
					ifAbsent: [ LOTJCartographerUnknown named: each variableName ] ] ]
		ifNil: [ #() ]
]

{ #category : #private }
LOTJCartographerRoom >> exitsAsString [
	^ String streamContents: [ :stream | 
		self exits
			do: [ :each | stream << each label ]
			separatedBy: [ stream << ', ' ] ]
]

{ #category : #inspecting }
LOTJCartographerRoom >> gtDisplayOn: stream [ 
	stream 
		<< self ROOMVNUM asString
		<< ' - '
		<< self cleanName
]

{ #category : #inspecting }
LOTJCartographerRoom >> gtInspectorMapIn: composite [
	<gtInspectorPresentationOrder: 50> 

	^ composite morph
		title: 'Map';
		display: [ 
			LOTJCartographerMapMorph new
				layoutPolicy: ProportionalLayout new;
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				room: self;
				yourself ]
]

{ #category : #testing }
LOTJCartographerRoom >> hasConnectionTo: aDirection [
	self connectionAt: aDirection ifAbsent: [ ^ false ].
	^ true
]

{ #category : #accessing }
LOTJCartographerRoom >> helpText [
	^ String streamContents: [ :stream | 
		stream << self name.
		self type isNone 
			ifFalse: [ stream << ' [' << self type label << ']' ].
		self notes isEmptyOrNil 
			ifFalse: [ stream << String cr << self notes ] ]
]

{ #category : #initialization }
LOTJCartographerRoom >> initialize [
	super initialize.
	values := SmallDictionary newFromPairs: { 
		ROOM_VNUM. 	nil.
		ROOM_NAME. 	nil.
		ROOM_EXITS. 	nil }.
	connections := Set new
]

{ #category : #initialization }
LOTJCartographerRoom >> initializeNumber: roomNumber [
	self initialize.
	self ROOMVNUM: roomNumber
]

{ #category : #testing }
LOTJCartographerRoom >> isValid [
	^ self number notNil 
		and: [ self number ~= 0 ]
]

{ #category : #accessing }
LOTJCartographerRoom >> levelExits [
	^ self exits select: #isLevel

]

{ #category : #accessing }
LOTJCartographerRoom >> map [
	^ map
]

{ #category : #accessing }
LOTJCartographerRoom >> map: aMap [
	map := aMap
]

{ #category : #accessing }
LOTJCartographerRoom >> name [
	^ self cleanName
]

{ #category : #accessing }
LOTJCartographerRoom >> notes [
	^ notes
]

{ #category : #accessing }
LOTJCartographerRoom >> notes: anObject [
	notes := anObject
]

{ #category : #accessing }
LOTJCartographerRoom >> number [
	^ self ROOMVNUM
]

{ #category : #printing }
LOTJCartographerRoom >> printOn: stream [ 
	stream << self number asString << ' - ' << (self name ifNil: [ 'NONAME' ])
]

{ #category : #accessing }
LOTJCartographerRoom >> removeAllConnections [
	connections 
		collect: #direction
		thenDo: [ :each | self removeConnectionAt: each ]
	
]

{ #category : #accessing }
LOTJCartographerRoom >> removeConnectionAt: aDirection [ 
	self connections copy 
		detect: [ :each | each direction = aDirection ]
		ifFound: [ :each |
			self connections remove: each.
			each room connections 
				remove: aDirection inverse 
				ifAbsent: [] ]
]

{ #category : #accessing }
LOTJCartographerRoom >> removeConnectionTo: aDirectionOrSymbol [
	| connection |
	connection := self connectionAt: aDirectionOrSymbol ifAbsent: [ ^ self ]. 
	connections remove: connection
]

{ #category : #accessing }
LOTJCartographerRoom >> type [
	^ type ifNil: [ type := LOTJCartographerRoomType default ]
]

{ #category : #accessing }
LOTJCartographerRoom >> type: aType [
	type := aType
]

{ #category : #accessing }
LOTJCartographerRoom >> values [
	^ values
]

{ #category : #accessing }
LOTJCartographerRoom >> withAllLevelRoomsDo: aBlock [
	(self collectLevelRoomsInto: OrderedCollection new)
		do: aBlock
]

{ #category : #accessing }
LOTJCartographerRoom >> withLevelConnectionsDo: aBlock [
	self type isTerminal ifTrue: [ ^ self ].
	self connections 
		select: [ :each | 
			(each direction isLevel) and: [ each isSimple ] ]
		thenDo: aBlock
]
