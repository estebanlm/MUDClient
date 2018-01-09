Class {
	#name : #LOTJStarMapPluginTest,
	#superclass : #TestCase,
	#category : #'LOTJ-Plugin-StarMap-Tests'
}

{ #category : #tests }
LOTJStarMapPluginTest >> testCalculateRegion [
	| plugin region |
	
	plugin := LOTJStarMapPlugin new.
	plugin newInternalSystems: (LOTJStarMapPlanetBuilder new
		planetsSource: LOTJStarMapPlanetBuilderTest planetsForTest;
		systemsSource: LOTJStarMapPlanetBuilderTest systemsForTest;
		build).
	region := plugin calculateRegion.
	self assert: region equals: ((10@33) corner: (126@ -120))
]
