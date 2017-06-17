accessing morph
areaMorph 
	^ areaMorph ifNil: [ areaMorph := self buildAreaMorph ]