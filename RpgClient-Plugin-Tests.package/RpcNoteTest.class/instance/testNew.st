tests
testNew
	| newNote |
	
	newNote := RpcNote new.
	self assert: newNote title equals: RpcNote defaultTitle.
	self assert: newNote contents isEmptyOrNil.
	self deny: newNote isGroup