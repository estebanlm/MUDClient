actions
renameNode: aNode
	| title | 
	
	title := (UIManager default 
		request: 'New title'
		initialAnswer: aNode title)
		trimBoth.
	(title isEmpty or: [ title = aNode title ]) ifTrue: [ ^ false ].
	aNode 
		title: title;
		save.
	^ true