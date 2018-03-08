Class {
	#name : #LOTJCartographerBrowser,
	#superclass : #MUDPluginBrowser,
	#instVars : [
		'mapMorph'
	],
	#category : #'LOTJ-Plugin-Cartographer-View'
}

{ #category : #accessing }
LOTJCartographerBrowser class >> title [ 
	^ 'Cartographer'
]

{ #category : #building }
LOTJCartographerBrowser >> addActionsTo: aPresenter [
	aPresenter 
		act: [ :p | self browseAreas ] entitled: 'Browse areas';
		act: [ :p | 
				self exportLevelMap: (p selection ifNil: [ self plugin actualRoom ]) ] 
			entitled: 'Export map';
		act: [ self removeLevel ] entitled: 'Remove level';
		act: [ :p | 
				self removeAllConnections: (p selection ifNil: [ self plugin actualRoom ]) ] 
			entitled: 'Remove connections'
]

{ #category : #actions }
LOTJCartographerBrowser >> addNoteTo: aRoom then: aBlock [
	| acceptedRoom |
	acceptedRoom := (TkMagritteEditor 
		object: aRoom 
		presenter: #update
		title: 'Room')
		go.
	acceptedRoom ifNil: [ ^ self ].
	aBlock cull: acceptedRoom
]

{ #category : #actions }
LOTJCartographerBrowser >> browseAreas [
	(LOTJCartographerMapAreaBrowser 
		game: self game 
		plugin: self plugin)
		openOn: self owner
]

{ #category : #building }
LOTJCartographerBrowser >> buildOn: browser [
	browser column: #map.
	browser transmit 
		to: #map;
		andShow: [ :a |
			a tkMorph
				"title: 'Map';"
				in: [ :this | self addActionsTo: this ];
				morph: [ self mapMorph ];
				morphTransmissions: [ :presentation |
					self mapMorph 
						onSelect: [ :aRoom | presentation selection: aRoom ] ] ]
]

{ #category : #'private factory' }
LOTJCartographerBrowser >> createMapMorph [
	^ LOTJCartographerMapMorph new
]

{ #category : #actions }
LOTJCartographerBrowser >> exportLevelMap: aRoom [
	Clipboard clipboardText: (LOTJCartographerASCIIExporter room: aRoom) build.
	UIManager default inform: 'Map copied to clipboard'
]

{ #category : #initialization }
LOTJCartographerBrowser >> initialize [
	super initialize.
	self selectRoom: self plugin actualRoom
]

{ #category : #testing }
LOTJCartographerBrowser >> isMiniWindow [
	^ true
]

{ #category : #'private accessing' }
LOTJCartographerBrowser >> mapMorph [
	^ mapMorph ifNil: [ mapMorph := self createMapMorph ]
]

{ #category : #'private accessing' }
LOTJCartographerBrowser >> mapPaneMorph [
	| mapPane |

	(mapPane := GeneralScrollPane new)
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	mapPane scroller 
		removeAllMorphs;
		addMorph: self mapMorph.
	
	^ mapPane
]

{ #category : #actions }
LOTJCartographerBrowser >> removeAllConnections: aRoom [
	aRoom removeAllConnections
]

{ #category : #actions }
LOTJCartographerBrowser >> removeLevel [
	self plugin removeLevel
]

{ #category : #accessing }
LOTJCartographerBrowser >> selectRoom: aRoom [ 
	self mapMorph room: aRoom
]

{ #category : #actions }
LOTJCartographerBrowser >> storeNote: aString on: aRoom [
	aRoom notes: aString
]

{ #category : #accessing }
LOTJCartographerBrowser >> title [
	^ 'Cartographer'
]
