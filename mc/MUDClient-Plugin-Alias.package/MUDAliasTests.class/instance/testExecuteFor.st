tests
testExecuteFor
	| alias console game session |
	
	game := MUDGameForTest new.
	console := MUDConsoleForTest new. 
	console connectTo: game.
	session := console session.
	alias := MUDAlias new
		whenReceive: 'alias' 
		send: 'trigger1
trigger2
trigger3'.
	alias executeOn: console.
	self 
		assert: session contents 
		equals: ('trigger1', String crlf,'trigger2', String crlf,'trigger3', String crlf)