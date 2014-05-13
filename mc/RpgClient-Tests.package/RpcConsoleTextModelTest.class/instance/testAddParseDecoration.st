tests
testAddParseDecoration
	| morph |
	
	morph := RpcConsoleTextModel new.
	self assert: morph parseDecoration notNil.
	self assert: morph parseDecoration class equals: RpcANSIDecoration.
	self assert: morph parseDecoration next isNil.
	
	morph addParseDecoration: RpcParseDecoration new.
	self deny: morph parseDecoration next isNil.
	self assert: morph parseDecoration class equals: RpcANSIDecoration.
	self assert: morph parseDecoration next class equals: RpcParseDecoration.
	
