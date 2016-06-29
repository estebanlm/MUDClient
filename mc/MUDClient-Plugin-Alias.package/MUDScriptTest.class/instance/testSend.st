tests
testSend
	self script execute: [ :this |
		this send: 'test' ].
	
	self 
		assert: self session contents 
		equals: ('test', String crlf)