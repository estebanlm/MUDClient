tests
testNew
	| newNote |
	
	newNote := MUDNote new.
	self assert: newNote title equals: MUDNote defaultTitle.
	self assert: newNote contents isEmptyOrNil.
	self deny: newNote isGroup