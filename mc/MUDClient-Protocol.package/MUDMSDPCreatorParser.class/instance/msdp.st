primitives
msdp 
	^ 'MSDP' asParser 
		==> [ :nodes | MSDP asByteArray ]