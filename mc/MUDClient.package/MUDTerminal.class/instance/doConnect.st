actions
doConnect
	| newGame |
	newGame := MUDGameGenerator new go.
	newGame ifNil: [ ^ self ].
	self connectTo: newGame