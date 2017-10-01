"
I'm a room.
I display some extra information like:

- the existence of up/down connections
- the existence of ""multiple"" connections (on a lift, for example)
- the existence of ""unknown"" connections (those that are result of an enter, for example)

"
Class {
	#name : #LOTJCartographerRoomMorph,
	#superclass : #Morph,
	#instVars : [
		'room',
		'current'
	],
	#category : 'LOTJ-Plugin-Cartographer-View'
}

{ #category : #accessing }
LOTJCartographerRoomMorph class >> defaultExtent [
	^ 10@10
]

{ #category : #'instance creation' }
LOTJCartographerRoomMorph class >> new [
	self error: 'Use room:'
]

{ #category : #'instance creation' }
LOTJCartographerRoomMorph class >> room: aRoom [
	^ self basicNew 
		initializeRoom: aRoom;
		yourself
]

{ #category : #accessing }
LOTJCartographerRoomMorph >> backgroundColor [
	^ self roomType color
]

{ #category : #accessing }
LOTJCartographerRoomMorph >> beCurrent [
	current := true
]

{ #category : #accessing }
LOTJCartographerRoomMorph >> beSelected [
	self borderWidth: 0
]

{ #category : #accessing }
LOTJCartographerRoomMorph >> borderColor [
	^ Color black
]

{ #category : #actions }
LOTJCartographerRoomMorph >> changeType: aType [
	self room type: aType.
	self owner refresh 
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> colorIcon: aColor [
	^ Morph new 
		color: aColor;
		extent: 16@16;
		imageForm
]

{ #category : #accessing }
LOTJCartographerRoomMorph >> connectionColor [
	^ Color gray
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> createDecrementModifierFor: aDirection [
	^ MUDAction new 
		action: [ self decrementDistance: aDirection ];
		title: 'Decrement distance ', aDirection label;
		category: 'Edition';
		yourself	
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> createEditActions [
	^ { 
		LOTJCartographerDirection north. 
		LOTJCartographerDirection south. 
		LOTJCartographerDirection east. 
		LOTJCartographerDirection west. 
	} inject: (OrderedCollection with: self createRemoveAllConnectionsAction) 
	into: [ :all :each | 
		all 
			add: (self createIncrementModifierFor: each);
			add: (self createDecrementModifierFor: each);
			yourself ]
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> createIncrementModifierFor: aDirection [
	^ MUDAction new 
		action: [ self incrementDistance: aDirection ];
		title: 'Increment distance ', aDirection label;
		category: 'Edition';
		yourself	
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> createInspectAction [
	^ MUDAction new 
		action: [ self room inspect ];
		title: 'inspect';
		category: 'DEBUG';
		yourself
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> createNotesAction [
	^ MUDAction new 
		action: [  ];
		title: 'Notes';
		yourself
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> createRemoveAllConnectionsAction [
	^ MUDAction new 
		action: [  ];
		title: 'Remove all connections';
		category: 'Edition';
		yourself
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> createTypeActionFor: aType [
	^ MUDAction new 
		action: [ self changeType: aType ];
		title: aType label;
		icon: (self colorIcon: aType color);
		category: 'Room type';
		yourself
]

{ #category : #'private factory' }
LOTJCartographerRoomMorph >> createTypeActions [
	^ LOTJCartographerRoomType allTypes
		collect: [ :each | self createTypeActionFor: each ]
]

{ #category : #accessing }
LOTJCartographerRoomMorph >> currentColor [
	^ Color cyan
]

{ #category : #actions }
LOTJCartographerRoomMorph >> decrementDistance: aDirection [
	| connection |
	connection  := self room 
		connectionAt: aDirection 
		ifAbsent: [ ^ self ]. 
	connection decrementDistance
]

{ #category : #drawing }
LOTJCartographerRoomMorph >> drawConnection: aConnection on: canvas [
	| mod fromPoint toPoint |

	 mod := aConnection direction coordinateModifier.
	fromPoint := self center + (mod * 5).
	toPoint := self center + (mod * (self owner roomSeparation / 2) * aConnection distance) asIntegerPoint.
	canvas
		line: fromPoint
		to: toPoint
		width: 1
		color: self connectionColor
]

{ #category : #drawing }
LOTJCartographerRoomMorph >> drawCurrentOn: canvas [
	| w h font |
	font := LOTJCartographerMapMorph font.
	w := font widthOfString: '<'. 
	h := font height.
	canvas 
		drawString: '<' 
		at: self topRight 
		font: font
		color: Color white
]

{ #category : #drawing }
LOTJCartographerRoomMorph >> drawOn: canvas [
	| directions |
	super drawOn: canvas.
	self isCurrent ifTrue: [ self drawCurrentOn: canvas ].
	directions := Set new.
	"Draw connections"
	self room withLevelConnectionsDo: [ :each | 
		directions add: each direction.
		self drawConnection: each on: canvas ].
	"Draw unexplored exits"
	(self room levelExits \ directions)
		reject: #isUnknown
		thenDo: [ :each |  
			self drawUnexploredConnectionDirection: each on: canvas  ]
]

{ #category : #drawing }
LOTJCartographerRoomMorph >> drawUnexploredConnectionDirection: aDirection on: canvas [
	| fromPoint toPoint mod |

	mod := aDirection coordinateModifier.
	fromPoint := self center + (mod * 5).
	toPoint := self center + (mod * 10).
	canvas
		line: fromPoint
		to: toPoint
		width: 1
		color: self connectionColor
]

{ #category : #'event handling' }
LOTJCartographerRoomMorph >> handlesMouseDown: evt [
	^  true
]

{ #category : #actions }
LOTJCartographerRoomMorph >> incrementDistance: aDirection [
	| connection |
	connection  := self room 
		connectionAt: aDirection 
		ifAbsent: [ ^ self ]. 
	connection incrementDistance
]

{ #category : #initialization }
LOTJCartographerRoomMorph >> initialize [
	super initialize.
	current := false.
	self 
		extent: self class defaultExtent;
		borderWidth: 1;
		borderColor: self borderColor;
		color: self backgroundColor
]

{ #category : #initialization }
LOTJCartographerRoomMorph >> initializeRoom: aRoom [
	room := aRoom.
	self initialize.	
	self setBalloonText: room helpText
]

{ #category : #testing }
LOTJCartographerRoomMorph >> isCurrent [
	^ current
]

{ #category : #accessing }
LOTJCartographerRoomMorph >> menu: aMorph [
	^ TkMenuBuilder new 
		model: self;
		actions: (
			self createTypeActions,
			{ self createNotesAction }, 
			self createEditActions, 
			{ self createInspectAction });
		build
]

{ #category : #'event handling' }
LOTJCartographerRoomMorph >> mouseDown: evt [
	super mouseDown: evt.
	evt yellowButtonPressed ifTrue: [ ^ self showMenu ] .
	self owner 
		internalSelect: self room;
		update

]

{ #category : #accessing }
LOTJCartographerRoomMorph >> room [
	^ room
]

{ #category : #accessing }
LOTJCartographerRoomMorph >> roomType [ 
	^ self room type
]

{ #category : #'event handling' }
LOTJCartographerRoomMorph >> showMenu [
	(self menu: nil) invokeModal
]
