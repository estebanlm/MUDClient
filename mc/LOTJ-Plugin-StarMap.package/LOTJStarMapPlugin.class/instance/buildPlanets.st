private
buildPlanets
	^ LOTJStarMapPlanetBuilder new
		planetsSource: self planetsSource;
		systemsSource: self systemsSource;
		build