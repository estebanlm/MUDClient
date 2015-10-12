grammar
table 
	^ tableOpen, whitespace plus, (variable, whitespace plus) plus, tableClose
		==> [ :nodes | 
			(nodes third 
				inject: nodes first
				into: [ :all :each | all, (each first) ]), 
				nodes fourth ]