tests
testFilterInputCommandLine
	| variable terminal game session |
	
	game := MUDGameForTest new.
	variable := MUDVariable name: '$var1' value: 'trigger1'.
	game addPlugin: ((MUDAliasPlugin game: game) 
		addVariable: variable;
		yourself).

	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
		
	self 
		assert: (terminal filterInput: '$var1 TEST') 
		equals: 'trigger1 TEST'