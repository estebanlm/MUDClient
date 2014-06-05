tests
testAddNew 
	| gamePad pad |
	
	gamePad := RpcGamePad new.
	self assert: gamePad pads isEmpty.
	pad := gamePad addNew. 
	self deny: gamePad pads isEmpty.
	self assert: pad notNil.
	self assert: pad name equals: 'Unknown'.
	self assert: gamePad pads size equals: 1.
	self assert: gamePad pads anyOne equals: pad