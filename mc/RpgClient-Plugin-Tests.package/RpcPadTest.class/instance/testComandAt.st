tests
testComandAt
	| pad |
	
	pad := RpcPad new.
	pad commandAt: 1 text: 'test 1'.
	pad commandAt: 2 text: 'test 2'.
	
	self assert: (pad commandAt: 1) text equals: 'test 1'.
	self assert: (pad commandAt: 2) text equals: 'test 2'.
	3 to: 10 do: [ :index | 
		self assert: (pad commandAt: index) text isNil ]
	