building
buildOn: browser
	browser
		row: #area;
		row: #input size: 40.

	browser transmit 
		to: #area; 
		andShow: [ :a | a morph morph: [ areaMorph ifNil: [ areaMorph := self buildAreaMorph ]]].
	browser transmit 
		to: #input; 
		andShow: [ :a | a morph morph: [ inputMorph ifNil: [ inputMorph := self buildInputMorph ]]].
