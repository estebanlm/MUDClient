tests
testForward
	history add: 'test 1'.
	history add: 'test 2'.
	history add: 'test 3'.
	history first.
	
	self assert: history current equals: 'test 1'.
	self assert: history forward equals: 'test 2'.
	self assert: history forward equals: 'test 3'.
	self assert: history forward equals: 'test 3'

	