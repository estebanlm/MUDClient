tests
testExecuteForWithPrefix
	| client game gamePad pad command session |
	
	client := RpcClient basicNew initialize.
	game := RpcGameForTest new.
	client console connectTo: game.
	session := client console session.
	gamePad := RpcButtonPad game: game.
	pad := gamePad addNew.
	pad prefix: 'tune'.
	command := pad commandAt: 1.
	command text: 'test'.
	
	command executeFor: client.
	
	self assert: session contents equals: ('tune test', String crlf)