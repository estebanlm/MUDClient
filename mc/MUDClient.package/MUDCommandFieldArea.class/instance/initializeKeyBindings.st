initialize
initializeKeyBindings
	self 
		bindKeyCombination: Character arrowUp asKeyCombination 
		toAction: [ self announce: MUDKeyUpEntered new ].
	self
		bindKeyCombination: Character arrowDown asKeyCombination 
		toAction: [ self announce: MUDKeyDownEntered new ]