primitives
string 
	^ ($" asParser , $" asParser negate star flatten, $" asParser)
		==> [ :nodes | nodes second asByteArray ]