primitives
esc
	^ 'ESC' asParser 
		==> [ :nodes | #[27] ]