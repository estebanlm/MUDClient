"
I'm a Star Map plugin. 
I receive information of commands planets and starsystems to create a grid of systems. 
I'm also can take user-defined points, to add interesting places that do not appear with the commands (Sarlacc Station and hiden places).

I can keep also ""explored areas""
"
Class {
	#name : #LOTJStarMapPlugin,
	#superclass : #MUDPlugin,
	#instVars : [
		'points',
		'region',
		'lines'
	],
	#category : 'LOTJ-Plugin-StarMap-Model'
}

{ #category : #accessing }
LOTJStarMapPlugin class >> expandedRegionSize [
	^ 10
]

{ #category : #accessing }
LOTJStarMapPlugin >> addLine: aLine [
	lines ifNil: [ lines := Set new ].
	lines add: aLine
]

{ #category : #accessing }
LOTJStarMapPlugin >> addLineFrom: fromPoint to: toPoint [
	self addLine: (LOTJStarMapLine new 
		fromPoint: fromPoint;
		toPoint: toPoint;
		yourself)
]

{ #category : #accessing }
LOTJStarMapPlugin >> addLineFromPlaceNamed: place1 to: place2 [ 
	self 
		addLineFrom: (self pointNamed: place1) 
		to: (self pointNamed: place2)
]

{ #category : #accessing }
LOTJStarMapPlugin >> addPoint: aPoint [
	(self hasPoint: aPoint) ifTrue: [ ^ self ]. 
	^ points add: aPoint
]

{ #category : #accessing }
LOTJStarMapPlugin >> calculateRegion [
	| left top right bottom point |
	
	point := self points anyOne sector. 
	left := right := point x.
	top := bottom := point y.
	self points do: [ :each |
		left > each sector x ifTrue: [ left := each sector x ].
		right < each sector x ifTrue: [ right := each sector x ].
		top > each sector y ifTrue: [ top := each sector y ].
		bottom < each sector y ifTrue: [ bottom := each sector y ] ].
	
	^ (left@top corner: right@bottom) expandBy: self class expandedRegionSize
]

{ #category : #testing }
LOTJStarMapPlugin >> hasPoint: aPoint [
	^ self points includes: aPoint
]

{ #category : #initialization }
LOTJStarMapPlugin >> initialize [ 
	super initialize.
	points := Set new
]

{ #category : #accessing }
LOTJStarMapPlugin >> lines [
	^ lines
]

{ #category : #accessing }
LOTJStarMapPlugin >> newInternalSystems: aCollection [
	self removeAllOrigin: LOTJStarMapPoint internalOrigin.
	aCollection do: [ :each | 
		each origin: LOTJStarMapPoint internalOrigin.
		self addPoint: each ].
	^ points 
]

{ #category : #accessing }
LOTJStarMapPlugin >> pointAtSector: aPoint ifAbsent: aBlock [ 
	^ self points 
		detect: [ :each | each sector = aPoint ]
		ifNone: aBlock
]

{ #category : #accessing }
LOTJStarMapPlugin >> pointAtSector: aPoint ifAbsentPut: aBlock [ 
	^ self points 
		detect: [ :each | each sector = aPoint ]
		ifNone: [ self addPoint: aBlock value ]
]

{ #category : #accessing }
LOTJStarMapPlugin >> pointLike: aString [ 
	^ self points 
		detect: [ :each | 
			each type = 'Place' 
			and: [each name beginsWith: aString ] ]
]

{ #category : #accessing }
LOTJStarMapPlugin >> pointNamed: aString [ 
	^ self points detect: [ :each | 
		each type = 'Place' 
		and: [each name = aString ] ]
]

{ #category : #accessing }
LOTJStarMapPlugin >> points [
	^ points
]

{ #category : #accessing }
LOTJStarMapPlugin >> region [
	^ region
]

{ #category : #private }
LOTJStarMapPlugin >> removeAllOrigin: aSymbol [
	self points removeAll: (self points select: [ :each | each origin = aSymbol ])
]

{ #category : #accessing }
LOTJStarMapPlugin >> removePointAtSector: aPoint [
	| point |
	
	point := self pointAtSector: aPoint ifAbsent: [ ^ self ].
	points remove: point.
]
