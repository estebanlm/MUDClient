grammar
complexCommand
	^ keywordWithArgument, (whitespace, keywordWithArgument) star
		==> [ :nodes | { nodes first }, (nodes second collect: #second) ]