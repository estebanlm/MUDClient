tests
testCalculateRegion
	| plugin region |
	
	plugin := LOTJStarMapPlugin new
		planetsSource: self class planetsForTest;
		systemsSource: self class systemsForTest;
		recalculatePlanets;
		yourself.
	region := plugin calculateRegion.
	self assert: region equals: ((10@33) corner: (126@ -120))