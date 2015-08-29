actions
doConnect
	| newGame |
	newGame := MUDGameGenerator generate.
	newGame ifNil: [ ^ self ].
	self connectTo: newGame