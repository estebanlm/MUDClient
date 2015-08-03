tests
testRoot 
	| root g1 g2 note |
	
	root := RpcNoteGroup new.
	g1 := RpcNoteGroup new.
	g2 := RpcNoteGroup new.
	note := RpcNote new.
	
	root add: g1.
	g1 add: g2.
	g2 add: note. 
	
	self assert: note root equals: root