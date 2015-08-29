grammar
text 
	^ (PPPredicateObjectParser anyExceptAnyOf: Character escape asString) plus flatten
		==> [ :nodes | 
			MUDANSIText new 
				text: nodes;
				yourself ]