private factory
createStarMapMorph
	^ LOTJStarMapMorph new
		starMap: self plugin;
		showNames: self initialShowNames;
		showMarkers: self initialShowMarkers;
		yourself