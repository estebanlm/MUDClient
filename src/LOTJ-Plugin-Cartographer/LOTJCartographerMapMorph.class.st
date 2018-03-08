"
I'm a map to show all rooms connected.
"
Class {
	#name : #LOTJCartographerMapMorph,
	#superclass : #Morph,
	#instVars : [
		'selectedRoom',
		'levelRooms',
		'selectionBlock',
		'needsDisplay',
		'currentRoom',
		'addMarkBlock',
		'addNoteBlock',
		'adjustToMapSize'
	],
	#category : #'LOTJ-Plugin-Cartographer-View'
}

{ #category : #accessing }
LOTJCartographerMapMorph class >> font [
	^ LogicalFont familyName: 'Consolas' pointSize: 7
]

{ #category : #actions }
LOTJCartographerMapMorph >> addMarkerTo: aRoom [
	addMarkBlock ifNotNil: [ addMarkBlock cull: aRoom ] 
]

{ #category : #private }
LOTJCartographerMapMorph >> addRoom: aRoom position: aPoint into: aCollection [
	| roomMorph |
	 
	"Exit if is already there"
	(aCollection anySatisfy: [ :each | 
		"If room is already added or possition is occupied, we do not show 
		this room, and we end adding rooms here."
		(each room = aRoom) or: [ each position = aPoint ] ]) 
		ifTrue: [ ^ self ].
	
	roomMorph := aRoom asMorph.
	aRoom = selectedRoom ifTrue: [ roomMorph beSelected ].
	aRoom = currentRoom ifTrue: [ roomMorph beCurrent ]. 
	roomMorph position: aPoint.
	aCollection add: roomMorph.
	aRoom withLevelConnectionsDo: [ :each | 
		self 
			addRoom: each room 
			position: (aPoint + (each direction coordinateModifier * (self roomSeparation * each distance)))
			into: aCollection ]
]

{ #category : #accessing }
LOTJCartographerMapMorph >> adjustToMapSize [
	adjustToMapSize := true
]

{ #category : #accessing }
LOTJCartographerMapMorph >> backgroundColor [
	^ Color black
]

{ #category : #private }
LOTJCartographerMapMorph >> calculateLevel [
	| roomMorphs startPoint |

	needsDisplay := false.
	startPoint := self isAdjustToMapSize 
		ifTrue: [ 10000@10000 ]
		ifFalse: [ self bounds center ].
	currentRoom ifNil: [ ^ self ].
	roomMorphs := OrderedCollection new.
	self 
		addRoom: currentRoom 
		position: startPoint
		into: roomMorphs.
	roomMorphs do: [ :each | each privateOwner: self ].
		
	self isAdjustToMapSize 
		ifTrue: [ | x1 y1 x2 y2 |
			x1 := y1 := 20000. 
			x2 := y2 := 0. 
			submorphs := roomMorphs asArray.
			submorphs do: [ :each |
				x1 := x1 min: each left.
				y1 := y1 min: each top.
				x2 := x2 max: each right.
				y2 := y2 max: each bottom.
				each position: (each position - startPoint) + self bounds center ].
			bounds := (bounds topLeft extent: (x1@y1 corner: x2@y2) extent). ]
		ifFalse: [ 
			submorphs := (roomMorphs 
				select: [ :each | self isVisible: each ])
				asArray ].
]

{ #category : #drawing }
LOTJCartographerMapMorph >> drawLabelOn: aCanvas [
	| w font |
	font := self class font.
	w := font widthOfString: selectedRoom name. 
	aCanvas 
		drawString: selectedRoom name
		at: ((self width - w) / 2) asInteger @ 5 
		font: font
		color: self fontColor	
]

{ #category : #drawing }
LOTJCartographerMapMorph >> drawOn: aCanvas [
	self needsDisplay ifTrue: [ self calculateLevel ].
	super drawOn: aCanvas.
	self drawLabelOn: aCanvas
]

{ #category : #accessing }
LOTJCartographerMapMorph >> fontColor [
	^ Color white
]

{ #category : #'event handling' }
LOTJCartographerMapMorph >> handlesMouseDown: evt [
	^  true
]

{ #category : #initialization }
LOTJCartographerMapMorph >> initialize [
	super initialize.
	self
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		color: self backgroundColor.
	adjustToMapSize := false.
	self setNeedsDisplay
]

{ #category : #private }
LOTJCartographerMapMorph >> internalSelect: aRoom [
	"self selected: aRoom."
	"self update."
	selectedRoom := aRoom.
	selectionBlock ifNotNil: [ selectionBlock value: aRoom ]
]

{ #category : #testing }
LOTJCartographerMapMorph >> isAdjustToMapSize [
	^ adjustToMapSize
]

{ #category : #'private testing' }
LOTJCartographerMapMorph >> isVisible: aMorph [
	^ self bounds containsPoint: aMorph position
]

{ #category : #recategorized }
LOTJCartographerMapMorph >> layoutChanged [
	self setNeedsDisplay.
	^ super layoutChanged
]

{ #category : #'private testing' }
LOTJCartographerMapMorph >> needsDisplay [
	^ needsDisplay
]

{ #category : #enumerating }
LOTJCartographerMapMorph >> onAddMark: aBlock [
	addMarkBlock := aBlock
]

{ #category : #enumerating }
LOTJCartographerMapMorph >> onAddNote: aBlock [
	addNoteBlock := aBlock
]

{ #category : #enumerating }
LOTJCartographerMapMorph >> onSelect: aBlock [
	selectionBlock := aBlock
]

{ #category : #private }
LOTJCartographerMapMorph >> refresh [
	self setNeedsDisplay.
	self changed
]

{ #category : #accessing }
LOTJCartographerMapMorph >> room: aRoom [ 
	currentRoom := aRoom.
	self internalSelect: aRoom.
	self refresh
]

{ #category : #accessing }
LOTJCartographerMapMorph >> roomSeparation [
	^ 30
]

{ #category : #private }
LOTJCartographerMapMorph >> setNeedsDisplay [
	needsDisplay := true
]

{ #category : #accessing }
LOTJCartographerMapMorph >> update [
	self refresh
]
