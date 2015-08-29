tests
testClear
	|  parsed |
	
	parsed := self 
		parse: Character escape asString, '[2J'
		rule: #clear.
		
	self assert: parsed class equals: MUDANSIClear.
	self assert: parsed value equals: 2