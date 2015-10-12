accessing
table 
	^ tableOpen, variable plus, tableClose 
		==> [ :nodes | nodes second ]