primitives
arrayClose
	^ 'MSDP_ARRAY_CLOSE' asParser 
		==> [ :nodes | MSDP_ARRAY_CLOSE asByteArray ]