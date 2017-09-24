"
I'm a star map builder.

In my first function I took planets/moons and system output and generate a list of points for them.
The other fucntion, I tool something like: 

calc '28 -50' 2519 25934 67000

and parse it as a location.
"
Class {
	#name : #LOTJStarMapPlanetBuilder,
	#superclass : #Object,
	#instVars : [
		'planetsSource',
		'moonsSource',
		'systemsSource'
	],
	#category : 'LOTJ-Plugin-StarMap-Model'
}

{ #category : #building }
LOTJStarMapPlanetBuilder >> build [
	| planetsCutPoints moonsCutPoints systemsCutPoints planetTuples moonTuples systemTuples |
	
	planetsCutPoints := #(16 38 64).
	moonsCutPoints := #(32 54 70).
	systemsCutPoints := #(25).
	
	planetTuples := (self planetsSource ifNil: [ '' ]) lines 
		collect: [ :each | self cut: each on: planetsCutPoints ].
	moonTuples := (self moonsSource ifNil: [ '' ]) lines 
		collect: [ :each | self cut: each on: moonsCutPoints ].
	systemTuples := (self systemsSource ifNil: [ '' ]) lines 
		collect: [ :each | self cut: each on: systemsCutPoints ].
	
	^ (planetTuples, moonTuples) collect: [ :eachPlanetTuple |
		LOTJStarMapSystemPoint new 
			name: eachPlanetTuple first;
			system: eachPlanetTuple second;
			sector: (self toPoint: (systemTuples detect: [ :each | each first = eachPlanetTuple second ]) second);
			origin: LOTJStarMapPoint internalOrigin;
			yourself ]
]

{ #category : #private }
LOTJStarMapPlanetBuilder >> cut: aString on: points [
	| previous strings |
	previous := 1.
	strings := Array new: points size + 1.
	"Extract chunks"
	points withIndexDo: [ :each :index | 
		strings 
			at: index 
			put: (aString copyFrom: previous to: each) trimBoth.
		previous := each + 1 ].
	"Add remaining"
	strings 
		at: (points size + 1) 
		put: (aString copyFrom: previous to: aString size) trimBoth.
	^ strings
]

{ #category : #descriptions }
LOTJStarMapPlanetBuilder >> descriptionMoons [
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 30;
		label: 'Moons';
		accessor: #moonsSource;
		lineCount: 8;
		yourself
]

{ #category : #descriptions }
LOTJStarMapPlanetBuilder >> descriptionPlanets [
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 20;
		label: 'Planets';
		accessor: #planetsSource;
		lineCount: 8;
		yourself
]

{ #category : #descriptions }
LOTJStarMapPlanetBuilder >> descriptionSystems [
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 10;
		label: 'Systems';
		accessor: #systemsSource;
		lineCount: 8;
		beRequired;
		yourself
]

{ #category : #accessing }
LOTJStarMapPlanetBuilder >> moonsSource [
	^ moonsSource
]

{ #category : #accessing }
LOTJStarMapPlanetBuilder >> moonsSource: anObject [
	moonsSource := anObject
]

{ #category : #accessing }
LOTJStarMapPlanetBuilder >> planetsSource [
	^ planetsSource
]

{ #category : #accessing }
LOTJStarMapPlanetBuilder >> planetsSource: anObject [
	planetsSource := anObject
]

{ #category : #accessing }
LOTJStarMapPlanetBuilder >> systemsSource [
	^ systemsSource
]

{ #category : #accessing }
LOTJStarMapPlanetBuilder >> systemsSource: anObject [
	systemsSource := anObject
]

{ #category : #private }
LOTJStarMapPlanetBuilder >> toPoint: aString [
	| pointParts |
	pointParts := (aString copyWithoutAll: '()') substrings: ','.
	^ pointParts first trimBoth asNumber @ pointParts second trimBoth asNumber
]
