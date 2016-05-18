tests
testExecuteFor
	| terminal game gamePad pad command session |
	
	game := MUDGameForTest new.
	terminal := MUDTerminalForTest new. 
	terminal connectTo: game.
	session := terminal session.
	gamePad := MUDPadPlugin game: game.
	pad := gamePad addNew.
	command := pad commandAt: 1.
	command text: 'test'.
	
	command executeOn: terminal.
	
	self assert: session contents equals: ('test', String crlf)