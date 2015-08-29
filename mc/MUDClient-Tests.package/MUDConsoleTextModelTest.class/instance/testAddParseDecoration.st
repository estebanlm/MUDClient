tests
testAddParseDecoration
	| morph |
	
	morph := MUDConsoleTextModel new.
	self assert: morph parseDecoration notNil.
	self assert: morph parseDecoration class equals: MUDANSIDecoration.
	self assert: morph parseDecoration next isNil.
	
	morph addParseDecoration: MUDParseDecoration new.
	self deny: morph parseDecoration next isNil.
	self assert: morph parseDecoration class equals: MUDANSIDecoration.
	self assert: morph parseDecoration next class equals: MUDParseDecoration.
	
