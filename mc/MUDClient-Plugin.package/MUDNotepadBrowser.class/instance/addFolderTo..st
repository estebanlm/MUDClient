actions
addFolderTo: aNode
	| title newFolder |
	title := UIManager default request: 'New folder title'.
	title ifNil: [ ^ false ].
	newFolder := MUDNoteGroup title: title.
	self addNode: newFolder to: aNode.
	^ newFolder