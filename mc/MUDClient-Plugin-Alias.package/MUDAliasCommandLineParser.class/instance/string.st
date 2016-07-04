primitives
string 
	^ ($" asParser, (PPPredicateObjectParser anyExceptAnyOf: '"') plus, $" asParser) flatten
	 | ($' asParser, (PPPredicateObjectParser anyExceptAnyOf: '''') plus, $' asParser) flatten