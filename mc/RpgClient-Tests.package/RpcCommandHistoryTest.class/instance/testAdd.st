tests
testAdd
	self assert: history current isNil.
	history add: 'test 1'.
	self assert: history current equals: 'test 1'.
	history add: 'test 2'.
	self assert: history current equals: 'test 2'.
	