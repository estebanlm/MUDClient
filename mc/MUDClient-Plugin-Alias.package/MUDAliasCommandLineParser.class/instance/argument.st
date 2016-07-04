grammar
argument
	^	(number | ('all' asParser), whitespace plus) optional, (string | #word asParser plus flatten)
		==> [ :nodes | 
			MUDAliasCommandLineArgument new 
				value: nodes second;
				quantity: (nodes first ifNotNil:[ :n | n first ]);
				yourself ]