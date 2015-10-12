grammar
subcommand 
	^ iac, whitespace plus, sb, whitespace plus, msdp, whitespace plus, variable, whitespace plus, iac, whitespace plus, se
		==> [ :nodes | 
			nodes first, 
			nodes third, 
			nodes fifth, 
			nodes seventh, 
			nodes ninth, 
			(nodes at: 11) ]