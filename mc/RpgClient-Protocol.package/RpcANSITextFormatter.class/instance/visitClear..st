visitor
visitClear: aNode
	aNode value = 2 
		ifTrue: [ 
			self text 
				replaceFrom: 1 
				to: self text size 
				with: '' asText ]