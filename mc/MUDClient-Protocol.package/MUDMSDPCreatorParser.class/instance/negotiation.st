grammar
negotiation
	^ iac, whitespace plus, (will / wont / dont / do), whitespace plus, msdp
		==> [ :nodes | nodes first, nodes third, nodes fifth ]