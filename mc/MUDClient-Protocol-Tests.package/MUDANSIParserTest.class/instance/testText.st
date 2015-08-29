tests
testText
	|  parsed |
	
	parsed := self parse: '[2]'rule: #text.
	self assert: parsed class equals: MUDANSIText.
	self assert: parsed text equals: '[2]'.
	
	parsed := self parse: 'anything not escape'rule: #text.
	self assert: parsed class equals: MUDANSIText.
	self assert: parsed text equals: 'anything not escape'	