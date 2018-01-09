"
I'm a star map morph. 
I show all interesting points on list.

"
Class {
	#name : #LOTJStarMapMorph,
	#superclass : #Morph,
	#instVars : [
		'starMap',
		'regionRectangle',
		'sectorSize',
		'selectionBlock',
		'selected',
		'showNames',
		'showMarkers'
	],
	#category : #'LOTJ-Plugin-StarMap-View'
}

{ #category : #accessing }
LOTJStarMapMorph class >> sectorSize [
	^ 6
]

{ #category : #accessing }
LOTJStarMapMorph >> addPoints [
	self removeAllMorphs.
	self starMap points do: [ :each | 
		self addMorphBack: (each asMorph
			position: (self sectorToPosition: each sector);
			extent: self sectorSize asPoint;
			yourself) ]
]

{ #category : #accessing }
LOTJStarMapMorph >> backgroundColor [
	^ Color black
]

{ #category : #private }
LOTJStarMapMorph >> calculateBounds [
	self extent: self regionRectangle extent * self sectorSize
]

{ #category : #accessing }
LOTJStarMapMorph >> centerMapOnPane: pane [
	| region origin corner |
	
	region := self starMap calculateRegion.
	origin := self sectorToPosition: region origin. 
	corner := self sectorToPosition: region corner.
	pane scrollToShow: (origin corner: corner)
	
]

{ #category : #private }
LOTJStarMapMorph >> centerPositionToSector: aPoint [
	| center point modY modX |
	
	point := aPoint / self sectorSize.
	center := self regionRectangle extent / 2.
	modX := point x < center x ifTrue: [ 1 ] ifFalse: [ 0 ].
	modY := point y < center y ifTrue: [ 1 ] ifFalse: [ 0 ]. 
	^ (point x + (center x + (LOTJStarMapMorph sectorSize / 2)) negated - modX) asInteger 
		@ (point y negated + (center y + LOTJStarMapMorph sectorSize / 2) + modY) asInteger
]

{ #category : #drawing }
LOTJStarMapMorph >> drawGridOn: aCanvas [
	| separation gridExtent expandedGridExtent current |
	
	separation := self sectorSize. 	
	gridExtent := self regionRectangle extent.
	expandedGridExtent := gridExtent * separation.
	
	"horizontal"
	current := self left.
	0 to: gridExtent x do: [ :index |
		aCanvas 
			line:  current @ self top
			to: current @ (self top + expandedGridExtent y)
			width: 1 
			color: self gridColor.
		current := current + separation ].
	
	"vertical"
	current := self top.
	0 to: gridExtent y do: [ :index |
		aCanvas 
			line:  self left @ current
			to: (self left + expandedGridExtent x) @ current
			width: 1 
			color: self gridColor.
		current := current + separation ]
]

{ #category : #drawing }
LOTJStarMapMorph >> drawLinesOn: aCanvas [
	self isShowMarkers ifFalse: [ ^ self ].
	self starMap lines ifNotNil: [ :lines |
		lines do: [ :each | 
			aCanvas 
				line: (self sectorToPositionCenter: each fromPoint sector)  
				to: (self sectorToPositionCenter: each toPoint sector) 
				color: each color ] ]
]

{ #category : #drawing }
LOTJStarMapMorph >> fullDrawOn: aCanvas [
	aCanvas drawMorph: self.
	self drawGridOn: aCanvas.
	self drawSubmorphsOn: aCanvas.
	self drawLinesOn: aCanvas
]

{ #category : #accessing }
LOTJStarMapMorph >> gridColor [
	^ Smalltalk ui theme backgroundColor muchDarker darker
]

{ #category : #'event handling' }
LOTJStarMapMorph >> handlesMouseDown: evt [
	^ true
]

{ #category : #'event handling' }
LOTJStarMapMorph >> handlesMouseOver: evt [
	^ true
]

{ #category : #initialization }
LOTJStarMapMorph >> initialize [
	super initialize.
	self color: self backgroundColor
]

{ #category : #private }
LOTJStarMapMorph >> internalSelect: aPoint [
	self selected: aPoint.
	self update.
	selectionBlock ifNotNil: [ selectionBlock value: aPoint ]
]

{ #category : #testing }
LOTJStarMapMorph >> isShowMarkers [
	^ showMarkers ifNil: [ true ]
]

{ #category : #testing }
LOTJStarMapMorph >> isShowNames [
	^ showNames ifNil: [ false ]
]

{ #category : #'event handling' }
LOTJStarMapMorph >> mouseDown: event [
	| sector point |
	super mouseDown: event.
	sector := self positionToSector: event position.
	point := self starMap 
		pointAtSector: sector 
		ifAbsent: [ LOTJStarMapSpacePoint sector: sector ].
	point ifNotNil: [
		self internalSelect: point ]
]

{ #category : #events }
LOTJStarMapMorph >> onSelect: aBlock [ 
	selectionBlock := aBlock
]

{ #category : #private }
LOTJStarMapMorph >> positionToSector: aPoint [
	| center point modY modX |
	
	point := aPoint / self sectorSize.
	center := self regionRectangle extent / 2.
	modX := point x < center x ifTrue: [ 1 ] ifFalse: [ 0 ].
	modY := point y < center y ifTrue: [ 1 ] ifFalse: [ 0 ]. 
	^ (point x + center x negated - modX) asInteger @ (point y negated + center y + modY) asInteger
]

{ #category : #refreshing }
LOTJStarMapMorph >> refresh [
	self addPoints
]

{ #category : #accessing }
LOTJStarMapMorph >> regionRectangle [
	^ -125@125 corner: 125@ -125  
	"regionRectangle ifNil: [ regionRectangle := self starMap calculateRegion ]"
]

{ #category : #accessing }
LOTJStarMapMorph >> sectorSize [
	^ sectorSize ifNil: [ sectorSize := self class sectorSize ]
]

{ #category : #accessing }
LOTJStarMapMorph >> sectorSize: anObject [
	sectorSize := anObject
]

{ #category : #private }
LOTJStarMapMorph >> sectorToPosition: aPoint [
	| center point |
	
	point := aPoint * self sectorSize.
	center := (self regionRectangle extent / 2) * self sectorSize.
	^ point x @ (point y negated) + center

]

{ #category : #private }
LOTJStarMapMorph >> sectorToPositionCenter: aPoint [
	| center point |
	
	point := aPoint * self sectorSize.
	center := (self regionRectangle extent / 2) * self sectorSize.
	^ point x @ (point y negated) + center + (self sectorSize / 2) asPoint
]

{ #category : #accessing }
LOTJStarMapMorph >> selected: aPoint [ 
	selected := aPoint
]

{ #category : #accessing }
LOTJStarMapMorph >> showMarkers: aBoolean [
	showMarkers := aBoolean.
	self changed
]

{ #category : #accessing }
LOTJStarMapMorph >> showNames: aBoolean [
	showNames := aBoolean.
	self changed
]

{ #category : #accessing }
LOTJStarMapMorph >> starMap [
	^ starMap
]

{ #category : #accessing }
LOTJStarMapMorph >> starMap: anObject [
	starMap := anObject.
	regionRectangle := nil.
	self calculateBounds.
	self addPoints
]

{ #category : #accessing }
LOTJStarMapMorph >> startLine [
	lines ifNil: [ lines := Set new ].
	lines add: LOTJStarMapLine new.
	self refresh
]

{ #category : #'events testing' }
LOTJStarMapMorph >> takesKeyboardFocus [
	^ self enabled
]
