tests
testExecuteFor
	| console game gamePad pad command session |
	
	game := MUDGameForTest new.
	console := MUDConsoleForTest new. 
	console connectTo: game.
	session := console session.
	gamePad := MUDButtonPad new.
	pad := gamePad addNew.
	command := pad commandAt: 1.
	command text: 'test'.
	
	command executeFor: console.
	
	self assert: session contents equals: ('test', String crlf)