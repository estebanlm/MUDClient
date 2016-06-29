tests
testFilterInputCommandLine
	| alias terminal game session |
	
	game := MUDGameForTest new.
	alias := MUDAlias whenCommand: 'alias $arg1' send: 'trigger1 $arg1'.
	game addPlugin: ((MUDAliasPlugin game: game) 
		addAlias: alias;
		yourself).

	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
		
	self 
		assert: (terminal filterInput: 'alias TEST') 
		equals: 'trigger1 TEST'