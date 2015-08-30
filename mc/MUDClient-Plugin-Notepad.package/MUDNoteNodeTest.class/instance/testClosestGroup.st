tests
testClosestGroup
	| group1 group2 |
	
	group1 := MUDNoteGroup new.
	group2 := MUDNoteGroup new.
	
	group1 add: group2.
	
	self assert: group2 closestGroup equals: group2