tests
testExecuteFor
	| alias terminal game session |
	
	game := MUDGameForTest new.
	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
	alias := MUDAlias whenCommand: 'alias' send: 'trigger1
trigger2
trigger3'.
	alias executeOn: terminal.
	self 
		assert: session contents 
		equals: ('trigger1', String crlf,'trigger2', String crlf,'trigger3', String crlf)