"
I'm a browser to work with the startmap.
"
Class {
	#name : #LOTJStarMapBrowser,
	#superclass : #MUDPluginBrowser,
	#instVars : [
		'starMapMorph'
	],
	#category : #'LOTJ-Plugin-StarMap-View'
}

{ #category : #actions }
LOTJStarMapBrowser >> addNote: aString toPoint: aPoint then: aBlock [
	aString trimBoth = (aPoint notes ifNil: [ '' ]) ifTrue: [ ^ self ].
	
	aPoint notes: aString.
	(self plugin hasPoint: aPoint) 
		ifFalse:[ 
			self plugin addPoint: aPoint.
			aBlock value ]
]

{ #category : #actions }
LOTJStarMapBrowser >> addPointThen: aBlock [
	self inform: 'TODO'
]

{ #category : #building }
LOTJStarMapBrowser >> buildOn: browser [
	browser 
		column: #map span: 2;
		column: [ :column |
			column 
				row: #pointDetail;
				row: #pointNotes ].
		
	browser transmit 
		to: #map;
		andShow: [ :a |
			a tkMorph
				title: 'Map';
				morph: [ self mapPaneMorph ];
				morphTransmissions: [ :presentation |
					self starMapMorph 
						onSelect: [ :aPoint | presentation selection: aPoint ] ].
			a fastList 
				title: 'List';
				display: [ self plugin points asArray ] ].
			
	browser transmit 	
		from: #map;
		to: #pointDetail;
		andShow: [ :a |
			a tkMagritte  
				title: [ :point | point type ];
				beReadOnly ].
			
	browser transmit 
		from: #map;
		to: #pointNotes;
		andShow: [ :a |
			a text
				title: 'Notes';
				display: [ :point | point notes ifNil: [ '' ] ];
				onChangeOfPort: #text act: [ :presentation :point | 
					self 
						addNote: presentation text asString 
						toPoint: point
						then: [ self starMapMorph refresh ] ] ]
]

{ #category : #building }
LOTJStarMapBrowser >> buildToolbarOn: aPresentation [
	aPresentation
		act: [ :presentation | self importPointsThen: [ presentation update ] ]
			icon: #import asMUDIcon
			entitled: 'Import points (from planets, moons and systems)';
		act: [ :presentation | self addPointThen: [ presentation update ] ]
			icon: #add asMUDIcon
			entitled: 'Add a point (taken from ''calc'' style)';
		toggleAct: [ :presentation :entity :isOn | self starMapMorph showNames: isOn ]
			icon: #flagRed asMUDIcon
			entitled: 'Show names'
			initialState: self initialShowNames;
		toggleAct: [ :presentation :entity :isShow | self starMapMorph showMarkers: isShow ]
			icon: #flagBlue asMUDIcon
			entitled: 'Show markers'
			initialState: self initialShowMarkers
]

{ #category : #'private factory' }
LOTJStarMapBrowser >> createStarMapMorph [
	^ LOTJStarMapMorph new
		starMap: self plugin;
		showNames: self initialShowNames;
		showMarkers: self initialShowMarkers;
		yourself
]

{ #category : #actions }
LOTJStarMapBrowser >> importPointsThen: aBlock [
	| builder |

	builder := (TkMagritteEditor object: LOTJStarMapPlanetBuilder new) go.
	builder ifNil: [ ^ self ].

	self plugin newInternalSystems: builder build.
	aBlock value
]

{ #category : #accessing }
LOTJStarMapBrowser >> initialShowMarkers [
	^ false
]

{ #category : #accessing }
LOTJStarMapBrowser >> initialShowNames [
	^ true
]

{ #category : #testing }
LOTJStarMapBrowser >> isMiniWindow [
	^ false
]

{ #category : #'private accessing' }
LOTJStarMapBrowser >> mapPaneMorph [
	| mapPane mapMorph |

	mapMorph := self starMapMorph.
	(mapPane := GeneralScrollPane new)
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	mapPane scroller addMorph: mapMorph.
	mapMorph centerMapOnPane: mapPane.
	
	^ mapPane
]

{ #category : #'private accessing' }
LOTJStarMapBrowser >> starMapMorph [
	^ starMapMorph ifNil: [ starMapMorph := self createStarMapMorph ]
]

{ #category : #accessing }
LOTJStarMapBrowser >> title [
	^ 'Star map'
]
