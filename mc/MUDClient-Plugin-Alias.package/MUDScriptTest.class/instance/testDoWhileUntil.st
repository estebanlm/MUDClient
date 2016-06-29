tests
testDoWhileUntil
	self script execute: [ :this |
		this 
			do: [ this send: 'test' ]
			while: 'pass'
			until: 'stop' ].
	
	self 
		assert: self session contents 
		equals: (
			'test', String crlf,
			'pass', String crlf, 
			'test', String crlf,
			'pass', String crlf, 
			'test', String crlf,
			'stop', String crlf )