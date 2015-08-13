actions
doConnect
	| newGame |
	newGame := RpcGameGenerator generate.
	newGame ifNil: [ ^ self ].
	self connectTo: newGame