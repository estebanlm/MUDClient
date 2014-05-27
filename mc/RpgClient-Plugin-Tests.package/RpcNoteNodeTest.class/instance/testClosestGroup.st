tests
testClosestGroup
	| group1 group2 |
	
	group1 := RpcNoteGroup new.
	group2 := RpcNoteGroup new.
	
	group1 add: group2.
	
	self assert: group2 closestGroup equals: group2