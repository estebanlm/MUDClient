Class {
	#name : #LOTJCartographerMapAreaBrowser,
	#superclass : #MUDPluginBrowser,
	#instVars : [
		'mapMorph'
	],
	#category : #'LOTJ-Plugin-Cartographer-View'
}

{ #category : #accessing }
LOTJCartographerMapAreaBrowser class >> title [ 
	^ 'Map areas'
]

{ #category : #accessing }
LOTJCartographerMapAreaBrowser >> actualRoom [
	^ self plugin actualRoom
]

{ #category : #building }
LOTJCartographerMapAreaBrowser >> addActionsTo: aPresenter [
	aPresenter 
		act: [ :p | self addAreaThen: [ p update ] ] 
			icon: #add asMUDIcon 
			entitled: 'Add area based on current room...'
]

{ #category : #actions }
LOTJCartographerMapAreaBrowser >> addAreaThen: aBlock [
	| area |
	area := (TkMagritteEditor 
		object: (LOTJCartographerMapArea new
			startRoom: self actualRoom;
			yourself)
		title: 'New area')
		go.
	area ifNil: [ ^ self ].
	self map addArea: area.
	aBlock value
]

{ #category : #actions }
LOTJCartographerMapAreaBrowser >> addMarkTo: aRoom then: aBlock [
	| mark |
	mark := (TkMagritteEditor 
		object:  LOTJCartographerRoomMark new 
		title: 'Mark')
		go.
	mark ifNil: [ ^ self ].
	aRoom addMark: mark.
	aBlock cull: mark
]

{ #category : #actions }
LOTJCartographerMapAreaBrowser >> addNoteTo: aRoom then: aBlock [
	| acceptedRoom |
	acceptedRoom := (TkMagritteEditor 
		object: aRoom 
		presenter: #update
		title: 'Room')
		go.
	acceptedRoom ifNil: [ ^ self ].
	aBlock cull: acceptedRoom
]

{ #category : #building }
LOTJCartographerMapAreaBrowser >> buildOn: browser [
	browser 
		column: #areas;
		column: #area span: 3.
		
	browser transmit 
		to: #areas; 
		andShow: [ :a |
			a fastList 
				title: 'Areas';
				display: [ self map areas ];
				format: #name;
				in: [ :this | self addActionsTo: this ] ].
		
	browser transmit 
		from: #areas;
		to: #area;
		andShow: [ :a | 
			a tkMorph
				"title: [ :area | area name ];"
				morph: [ :presentation :area | 
					self mapMorph room: area startRoom.
					self createMapPaneMorphFor: self mapMorph ];
				morphTransmissions: [ :presentation |
					self mapMorph 
						onAddMark: [ :aRoom | self addMarkTo: aRoom then: [ presentation update] ];
						onAddNote: [ :aRoom | self addNoteTo: aRoom then: [ presentation update] ];
						onSelect: [ :aRoom | presentation selection: aRoom ] ] ]
]

{ #category : #'private factory' }
LOTJCartographerMapAreaBrowser >> createMapMorph [
	^ LOTJCartographerMapMorph new
]

{ #category : #'private factory' }
LOTJCartographerMapAreaBrowser >> createMapPaneMorphFor: aMapMorph [
	| mapPane |

	(mapPane := GeneralScrollPane new)
		scrollTarget: (aMapMorph
			extent: 2000@2000;
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			yourself);
		scrollToShow: (1000@1000 extent: 100@100).
	
	^ mapPane
]

{ #category : #accessing }
LOTJCartographerMapAreaBrowser >> map [
	^ self plugin map
]

{ #category : #accessing }
LOTJCartographerMapAreaBrowser >> mapMorph [
	^ mapMorph ifNil: [ mapMorph := self createMapMorph ]
]
