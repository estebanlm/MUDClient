tests
testNew
	| pad |
	
	pad := RpcPad new.
	self assert: pad name equals: 'Pad'.
	self assert: pad commands size equals: RpcPad padSize