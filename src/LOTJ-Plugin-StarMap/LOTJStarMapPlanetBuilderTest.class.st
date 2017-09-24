Class {
	#name : #LOTJStarMapPlanetBuilderTest,
	#superclass : #TestCase,
	#category : 'LOTJ-Plugin-StarMap-Tests'
}

{ #category : #'as yet unclassified' }
LOTJStarMapPlanetBuilderTest class >> planetsForTest [
	^ 'Coruscant       Corusca Sector        Rebel Alliance            99.0
Corellia        Corellian System      Rebel Alliance            89.0
Dac             Calamari System       Rebel Alliance            100.0
Lorrd           Kanz System           Rebel Alliance            100.0
Ryloth          Gaulus Sector         Rebel Alliance            100.0
Tatooine        Arkanis Sector        Rebel Alliance            100.0
Bespin          Anoat Sector          Neutral Government        100.0
Nal Hutta       Y''toub System         Rebel Alliance            100.0
Kashyyyk        Mytaranor Sector      Rebel Alliance            100.0
Alderaan        Alderaan System       Rebel Alliance            100.0
Korriban        Horuset                                         2.0
Mandalore       Mandalore Sector      Neutral Government        100.0
Ithor           Ottega System         Rebel Alliance            100.0
Hoth-VI         Hoth System           Rebel Alliance            100.0
Rakata          Rakata System         Rebel Alliance            100.0
Tython          Tython Sector         Rebel Alliance            100.0'
]

{ #category : #'as yet unclassified' }
LOTJStarMapPlanetBuilderTest class >> systemsForTest [
	^ 'Corusca Sector           ( 0, 0 )
Corellian System         ( 15, -17 )
Calamari System          ( 24, 5 )
Kanz System              ( 16, 23 )
Gaulus Sector            ( 90, -73 )
Arkanis Sector           ( 69, -92 )
Anoat Sector             ( 90, -40 )
Y''toub System            ( 77, -65 )
Mytaranor Sector         ( 48, -48 )
Alderaan System          ( 40, -30 )
Horuset                  ( 103, 5 )
Mandalore Sector         ( 116, -43 )
Ottega System            ( 19, -58 )
Hoth System              ( 100, -110 )
Rakata System            ( -20, -88 )
Tython Sector            ( -20, 20)'
]

{ #category : #accessing }
LOTJStarMapPlanetBuilderTest >> pointsForTest [
	^ LOTJStarMapPlanetBuilder new
		planetsSource: self class planetsForTest;
		systemsSource: self class systemsForTest;
		build
]

{ #category : #tests }
LOTJStarMapPlanetBuilderTest >> testBuild [
	| points |
	
	points := self pointsForTest.
	self assert: points size equals: 16
	
]
