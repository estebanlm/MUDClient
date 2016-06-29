tests
testDoUntilAnyOf
	self script execute: [ :this |
		this 
			do: [ this send: 'test' ]
			untilAnyOf: #('stop' 'alto') ].
	
	self 
		assert: self session contents 
		equals: (
			'test', String crlf,
			'test outside', String crlf, 
			'alto', String crlf )