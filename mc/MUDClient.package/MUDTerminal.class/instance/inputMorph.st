accessing morph
inputMorph 
	^ inputMorph ifNil: [ inputMorph := self buildInputMorph ]