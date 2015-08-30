actions
addNoteTo: aNode
	| title newNote |
	title := UIManager default request: 'New note title'.
	title ifNil: [ ^ nil ].
	newNote := MUDNote title: title.
	self addNode: newNote to: aNode.
	^ newNote