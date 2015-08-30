tests
testComandAtText
	| pad |
	
	pad := MUDPad new.
	pad commandAt: 1 text: 'test'.
	self assert: (pad commandAt: 1) text equals: 'test'