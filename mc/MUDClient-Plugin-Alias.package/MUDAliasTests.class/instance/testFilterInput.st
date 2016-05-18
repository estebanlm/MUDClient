tests
testFilterInput
	| alias terminal game session |
	
	game := MUDGameForTest new.
	alias := MUDAlias whenCommand: 'alias' send: 'trigger1
trigger2
trigger3'.
	game addPlugin: ((MUDAliasPlugin game: game) 
		addAlias: alias;
		yourself).

	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
		
	self 
		assert: (terminal filterInput: 'alias') 
		equals: ('trigger1', String cr,'trigger2', String cr,'trigger3')