tests
testNegotiation
	self 
		parse: 'IAC WILL MSDP'
		rule: #negotiation.

	self 
		parse: 'IAC WONT MSDP'
		rule: #negotiation.

	self 
		parse: 'IAC DO MSDP'
		rule: #negotiation.

	self 
		parse: 'IAC DONT MSDP'
		rule: #negotiation.