grammar
sentence
	^ keyword, (whitespace, argument) optional
		==> [ :nodes | 
			MUDAliasCommandLineKeyword new 
				value: nodes first;
				argument: (nodes second ifNotNil: [ :n | n second ]) ]