building
build
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