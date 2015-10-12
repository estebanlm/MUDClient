grammar
array
	^ arrayOpen, whitespace plus, (value, whitespace plus) plus, arrayClose
		==> [ :nodes | 
			(nodes third 
				inject: nodes first
				into: [ :all :each | all, (each first) ]), 
				nodes fourth ]