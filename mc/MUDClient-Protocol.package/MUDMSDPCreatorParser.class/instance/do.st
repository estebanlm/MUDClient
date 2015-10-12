primitives
do
	^ 'DO' asParser 
		==> [ :nodes | DO asByteArray ]