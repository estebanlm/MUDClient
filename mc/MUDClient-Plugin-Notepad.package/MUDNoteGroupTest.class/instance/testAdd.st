tests
testAdd
	self deny: group hasChildren.
	group add: MUDNote new.
	self assert: group hasChildren	