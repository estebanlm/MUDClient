tests
testNew
	| pad |
	
	pad := MUDPad new.
	self assert: pad name equals: 'Pad'.
	self assert: pad commands size equals: MUDPad padSize