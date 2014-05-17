actions
addFolderTo: aNode
	| title | 
	
	title := UIManager default request: 'New folder title'.
	title ifNil: [ ^ false ].
	self addNode: (RpcNoteGroup title: title) to: aNode.		
	^ true