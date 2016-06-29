tests
testDoUntil
	self script execute: [ :this |
		this 
			do: [ this send: 'test' ]
			until: 'stop' ].
	
	self terminal 
		receive: 'test outside';
		receive: 'stop'.
	
	self 
		assert: self session contents 
		equals: (
			'test', String crlf,
			'test outside', String crlf, 
			'stop', String crlf )