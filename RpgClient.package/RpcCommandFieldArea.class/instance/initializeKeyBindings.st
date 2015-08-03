initialize
initializeKeyBindings
	self 
		bindKeyCombination: Character arrowUp asKeyCombination 
		toAction: [ self announce: RpcKeyUpEntered new ].
	self
		bindKeyCombination: Character arrowDown asKeyCombination 
		toAction: [ self announce: RpcKeyDownEntered new ]