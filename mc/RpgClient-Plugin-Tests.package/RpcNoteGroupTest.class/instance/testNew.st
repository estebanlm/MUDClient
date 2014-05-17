tests
testNew 
	| newGroup |
	
	newGroup := RpcNoteGroup new. 
	self assert: newGroup title equals: RpcNoteGroup defaultTitle.
	self deny: newGroup hasChildren.
	self assert: newGroup isGroup