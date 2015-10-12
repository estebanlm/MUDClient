primitives
tableClose
	^ 'MSDP_TABLE_CLOSE' asParser 
		==> [ :nodes | MSDP_TABLE_CLOSE asByteArray ]