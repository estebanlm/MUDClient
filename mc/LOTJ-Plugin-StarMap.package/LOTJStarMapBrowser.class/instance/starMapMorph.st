private accessing
starMapMorph
	^ starMapMorph ifNil: [ starMapMorph := self createStarMapMorph ]