tests
testClosestGroup
	| group note |
	
	group := MUDNoteGroup new.
	note := MUDNote new.
	
	group add: note.
	
	self assert: note closestGroup equals: group