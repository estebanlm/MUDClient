building
inputMorph 
	^ inputMorph ifNil: [ inputMorph := self buildInputMorph ]