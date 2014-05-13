grammar
text 
	^ (PPPredicateObjectParser anyExceptAnyOf: Character escape asString) plus flatten
		==> [ :nodes | 
			RpcANSIText new 
				text: nodes;
				yourself ]