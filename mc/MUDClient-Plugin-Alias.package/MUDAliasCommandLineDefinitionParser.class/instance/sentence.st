grammar
sentence
	^ #word asParser plus flatten, (whitespace, argument) optional
		==> [ :nodes | 
			MUDAliasCommandKeyword new
				value: nodes first;
				argument: (nodes second ifNotNil: [ :n | n second ]);
				yourself  ]