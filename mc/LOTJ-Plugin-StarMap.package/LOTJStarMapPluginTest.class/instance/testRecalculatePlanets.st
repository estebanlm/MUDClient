tests
testRecalculatePlanets
	| plugin |
	
	plugin := LOTJStarMapPlugin new
		planetsSource: self class planetsForTest;
		systemsSource: self class systemsForTest;
		recalculatePlanets;
		yourself.
	self assert: plugin points size equals: 14
	