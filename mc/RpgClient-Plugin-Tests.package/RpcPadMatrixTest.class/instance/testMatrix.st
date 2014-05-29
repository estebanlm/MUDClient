tests
testMatrix
	| pad |
	
	pad := RpcPadMatrix matrix: 4@2.
	self assert: pad rows equals: 2.
	self assert: pad columns equals: 4