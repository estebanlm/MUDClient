tests
testNew 
	| newGroup |
	
	newGroup := MUDNoteGroup new. 
	self assert: newGroup title equals: MUDNoteGroup defaultTitle.
	self deny: newGroup hasChildren.
	self assert: newGroup isGroup