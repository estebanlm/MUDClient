actions
doConnect
	| newGame |
	newGame := MUDGameEditor new go.
	newGame ifNil: [ ^ self ].
	self connectTo: newGame