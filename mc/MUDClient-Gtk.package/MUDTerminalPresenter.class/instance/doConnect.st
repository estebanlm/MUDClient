actions
doConnect
	| newGame |
	newGame := MUDSelectGamePresenter new go.
	newGame ifNil: [ ^ self ].
	self connectTo: newGame