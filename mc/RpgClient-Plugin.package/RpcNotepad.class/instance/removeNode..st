actions
removeNode: aNode
	(UIManager default confirm: ('Are you sure you want to remove {1}' format: { aNode title }))
		ifFalse: [ ^ false ].
	aNode remove.	
	^ true