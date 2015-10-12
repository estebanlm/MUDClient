grammar
variable 
	^ var, whitespace plus, string, whitespace plus, value
		==> [ :nodes | 
			nodes first, 
			nodes third, 
			nodes fifth ]