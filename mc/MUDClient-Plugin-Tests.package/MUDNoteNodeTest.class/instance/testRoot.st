tests
testRoot 
	| root g1 g2 note |
	
	root := MUDNoteGroup new.
	g1 := MUDNoteGroup new.
	g2 := MUDNoteGroup new.
	note := MUDNote new.
	
	root add: g1.
	g1 add: g2.
	g2 add: note. 
	
	self assert: note root equals: root