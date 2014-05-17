actions
addNoteTo: aNode
	| title | 
	
	title := UIManager default request: 'New note title'.
	title ifNil: [ ^ false ].
	self addNode: (RpcNote title: title) to: aNode.		
	^ true