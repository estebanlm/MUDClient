grammar
value 
	^ val, whitespace plus, (string / table / array)
		==> [ :nodes | nodes first, nodes third ]