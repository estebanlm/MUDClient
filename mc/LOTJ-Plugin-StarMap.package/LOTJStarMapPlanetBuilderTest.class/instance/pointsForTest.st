accessing
pointsForTest
	^ LOTJStarMapPlanetBuilder new
		planetsSource: self class planetsForTest;
		systemsSource: self class systemsForTest;
		build