building
buildOn: browser 
	"browser row: #pad.
	browser transmit to: #pad; andShow: [ :a | 
		a morph display: [ self buildMorph ] ]"
	self plugin pads withIndexDo: [ :each :index |
		self 
			buildPad: each 
			port: ('row', index asString) asSymbol
			on: browser ]