private
buildPlanets
	^ (LOTJStarMapPlanetBuilder 
		planetsSource: self planetsSource 
		systemsSource: self systemsSource)
		build