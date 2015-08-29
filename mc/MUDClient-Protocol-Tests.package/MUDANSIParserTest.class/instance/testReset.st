tests
testReset
	|  parsed |
	
	parsed := self 
		parse: Character escape asString, '[0m'
		rule: #reset.
		
	self assert: parsed class equals: MUDANSIReset