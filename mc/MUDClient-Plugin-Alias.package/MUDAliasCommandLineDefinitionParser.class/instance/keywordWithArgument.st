grammar
keywordWithArgument
	^ keywordToken, whitespace, argument
		==> [ :nodes | 
			MUDAliasCommandKeyword
				value: nodes first
				argument: nodes third ]