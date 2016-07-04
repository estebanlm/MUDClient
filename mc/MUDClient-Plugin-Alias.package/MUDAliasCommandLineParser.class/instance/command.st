grammar
command
	^ sentence, (whitespace, sentence) star
		==> [ :nodes | 
			nodes second 
				ifNotNil: [ { nodes first }, (nodes second collect: #second) ]
				ifNil: [ { nodes first } ] ]