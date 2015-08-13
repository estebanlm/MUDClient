building
buildOn: browser 
	browser row: #pad.
	browser transmit to: #pad; andShow: [ :a | 
		a morph display: [ self buildMorph ] ]