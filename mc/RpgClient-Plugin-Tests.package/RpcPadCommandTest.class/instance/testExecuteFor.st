tests
testExecuteFor
	| console game gamePad pad command session |
	
	game := RpcGameForTest new.
	console := RpcConsole new. 
	console connectTo: game.
	session := console session.
	gamePad := RpcButtonPad game: game.
	pad := gamePad addNew.
	command := pad commandAt: 1.
	command text: 'test'.
	
	command executeFor: console.
	
	self assert: session contents equals: ('test', String crlf)