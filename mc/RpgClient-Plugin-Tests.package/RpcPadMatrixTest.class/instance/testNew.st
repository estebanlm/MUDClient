tests
testNew
	| pad |
	
	pad := RpcPadMatrix new.
	self assert: pad rows equals: 1.
	self assert: pad columns equals: 12