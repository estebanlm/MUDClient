tests
testExecuteForWithPrefix
	| terminal game gamePad pad command session |
	
	terminal := MUDTerminalForTest new.
	game := MUDGameForTest new.
	terminal connectTo: game.
	session := terminal session.
	gamePad := MUDPadPlugin game: game.
	pad := gamePad addNew.
	pad prefix: 'tune'.
	command := pad commandAt: 1.
	command text: 'test'.
	
	command executeOn: terminal.
	
	self assert: session contents equals: ('tune test', String crlf)