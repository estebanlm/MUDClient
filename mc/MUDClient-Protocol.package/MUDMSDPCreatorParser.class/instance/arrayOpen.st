primitives
arrayOpen
	^ 'MSDP_ARRAY_OPEN' asParser 
		==> [ :nodes | MSDP_ARRAY_OPEN asByteArray ]