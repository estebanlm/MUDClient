grammar
command
	^ sentence, (whitespace, sentence) star
		==> [ :nodes | 
			MUDAliasCommand new 
				keywords: { nodes first }, (nodes second collect: #second);
				yourself ]