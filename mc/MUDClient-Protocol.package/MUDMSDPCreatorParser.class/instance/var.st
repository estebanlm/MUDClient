primitives
var
	^ 'MSDP_VAR' asParser 
		==> [ :nodes | MSDP_VAR asByteArray ]