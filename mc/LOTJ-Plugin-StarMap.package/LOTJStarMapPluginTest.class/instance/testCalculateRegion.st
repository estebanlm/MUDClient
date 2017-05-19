tests
testCalculateRegion
	| plugin region |
	
	plugin := LOTJStarMapPlugin new.
	plugin newInternalSystems: (LOTJStarMapPlanetBuilder new
		planetsSource: LOTJStarMapPlanetBuilderTest planetsForTest;
		systemsSource: LOTJStarMapPlanetBuilderTest systemsForTest;
		build).
	region := plugin calculateRegion.
	self assert: region equals: ((10@33) corner: (126@ -120))