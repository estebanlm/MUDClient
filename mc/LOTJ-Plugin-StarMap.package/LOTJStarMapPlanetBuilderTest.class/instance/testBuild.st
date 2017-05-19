tests
testBuild
	| points |
	
	points := LOTJStarMapPlanetBuilder new
		planetsSource: self class planetsForTest;
		systemsSource: self class systemsForTest;
		build.
	self assert: points size equals: 16
	