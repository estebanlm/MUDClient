private
addNode: aNode to: parentNode		
	parentNode ifNotNil: [ parentNode add: aNode ].
	aNode save