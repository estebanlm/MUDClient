tests
testBuildPlanets
	| plugin points |
	
	plugin := LOTJStarMapPlugin new
		planetsSource: self class planetsForTest;
		systemsSource: self class systemsForTest;
		yourself.
	points := plugin buildPlanets.
	self assert: points size equals: 12
	