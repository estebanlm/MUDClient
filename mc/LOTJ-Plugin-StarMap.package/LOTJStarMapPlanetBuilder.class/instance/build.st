building
build
	| planetsCutPoints systemsCutPoints planetTuples moonTuples systemTuples |
	
	planetsCutPoints := #(16 38 64).
	systemsCutPoints := #(25).
	
	planetTuples := (self planetsSource ifNil: [ '' ]) lines 
		collect: [ :each | self cut: each on: planetsCutPoints ].
	moonTuples := (self moonsSource ifNil: [ '' ]) lines 
		collect: [ :each | self cut: each on: planetsCutPoints ].
	systemTuples := (self systemsSource ifNil: [ '' ]) lines 
		collect: [ :each | self cut: each on: systemsCutPoints ].
	
	^ (planetTuples, moonTuples) collect: [ :eachPlanetTuple |
		LOTJStarMapSystemPoint new 
			name: eachPlanetTuple first;
			system: eachPlanetTuple second;
			sector: (self toPoint: (systemTuples detect: [ :each | each first = eachPlanetTuple second ]) second);
			origin: LOTJStarMapPoint internalOrigin;
			yourself ]