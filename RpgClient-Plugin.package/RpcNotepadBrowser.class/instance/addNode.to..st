private
addNode: aNode to: parentNode		
	(parentNode ifNil: [ self notepad root ]) add: aNode	