primitives
tableOpen
	^ 'MSDP_TABLE_OPEN' asParser 
		==> [ :nodes | MSDP_TABLE_OPEN asByteArray ]