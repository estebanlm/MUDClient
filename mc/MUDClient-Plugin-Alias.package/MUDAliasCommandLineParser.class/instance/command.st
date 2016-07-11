grammar
command
	^ sentence, (whitespace, sentence) star
		==> [ :nodes |
			MUDAliasCommandLine new 
				keywords: ( nodes second 
					ifNotNil: [ { nodes first }, (nodes second collect: #second) ]
					ifNil: [ { nodes first } ]);
				yourself ]