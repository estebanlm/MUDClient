tests
testNew
	| pad |
	
	pad := RpcPad new.
	self assert: pad name isNil.
	self assert: pad commands size equals: 12