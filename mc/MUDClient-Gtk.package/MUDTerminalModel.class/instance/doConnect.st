actions
doConnect
	| newGame |
	newGame := MUDSelectGameModel new go.
	newGame ifNil: [ ^ self ].
	self connectTo: newGame