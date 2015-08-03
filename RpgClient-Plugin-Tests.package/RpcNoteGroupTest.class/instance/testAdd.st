tests
testAdd
	self deny: group hasChildren.
	group add: RpcNote new.
	self assert: group hasChildren	