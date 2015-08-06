tests
testClosestGroup
	| group note |
	
	group := RpcNoteGroup new.
	note := RpcNote new.
	
	group add: note.
	
	self assert: note closestGroup equals: group