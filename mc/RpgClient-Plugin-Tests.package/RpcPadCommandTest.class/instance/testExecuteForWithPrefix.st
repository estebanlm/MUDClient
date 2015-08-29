tests
testExecuteForWithPrefix
	| console game gamePad pad command session |
	
	console := RpcConsoleForTest new.
	game := RpcGameForTest new.
	console connectTo: game.
	session := console session.
	gamePad := RpcButtonPad new.
	pad := gamePad addNew.
	pad prefix: 'tune'.
	command := pad commandAt: 1.
	command text: 'test'.
	
	command executeFor: console.
	
	self assert: session contents equals: ('tune test', String crlf)