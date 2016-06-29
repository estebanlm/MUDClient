tests
testDoWhileAnyOfUntilAnyOf
	self script execute: [ :this |
		this 
			do: [ this send: 'test' ]
			whileAnyOf: #('pass' 'cont')
			untilAnyOf: #('stop' 'alto') ].
	
	self 
		assert: self session contents 
		equals: (
			'test', String crlf,
			'pass', String crlf, 
			'test', String crlf,
			'cont', String crlf, 
			'test', String crlf,
			'alto', String crlf )