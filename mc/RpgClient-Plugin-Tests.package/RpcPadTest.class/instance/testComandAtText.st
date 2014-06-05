tests
testComandAtText
	| pad |
	
	pad := RpcPad new.
	pad commandAt: 1 text: 'test'.
	self assert: (pad commandAt: 1) text equals: 'test'