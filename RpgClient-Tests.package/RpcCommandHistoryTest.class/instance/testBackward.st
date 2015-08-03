tests
testBackward
	history add: 'test 1'.
	history add: 'test 2'.
	history add: 'test 3'.
	
	self assert: history current equals: 'test 3'.
	self assert: history backward equals: 'test 2'.
	self assert: history backward equals: 'test 1'.
	self assert: history backward equals: 'test 1'	