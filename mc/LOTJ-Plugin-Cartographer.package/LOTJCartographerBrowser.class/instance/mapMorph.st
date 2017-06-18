private accessing
mapMorph
	^ mapMorph ifNil: [ mapMorph := self createMapMorph ]