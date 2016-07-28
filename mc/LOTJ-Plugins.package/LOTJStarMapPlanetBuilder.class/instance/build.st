building
build
	| planetsCutPoints systemsCutPoints planetTuples systemTuples |
	planetsCutPoints := #(16 38 64).
	systemsCutPoints := #(25).
	
	planetTuples := self planetsSource lines collect: [ :each | self cut: each on: planetsCutPoints ].
	systemTuples := self systemsSource lines collect: [ :each | self cut: each on: systemsCutPoints ].
	
	^ planetTuples collect: [ :eachPlanetTuple |
		LOTJStarMapPoint new 
			name: eachPlanetTuple first;
			system: eachPlanetTuple second;
			point: (self toPoint: (systemTuples detect: [ :each | each first = eachPlanetTuple second ]) second);
			origin: LOTJStarMapPoint internalOrigin;
			yourself ]