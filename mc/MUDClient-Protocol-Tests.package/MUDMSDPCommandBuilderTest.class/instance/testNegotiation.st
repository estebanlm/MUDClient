tests
testNegotiation
	self 
		assert: MUDMSDPCommandBuilder new will contents 
		equals: (self parser parse: 'IAC WILL MSDP').

	self 
		assert: MUDMSDPCommandBuilder new wont contents
		equals: (self parser parse: 'IAC WONT MSDP').

	self 
		assert: MUDMSDPCommandBuilder new do contents 
		equals: (self parser parse: 'IAC DO MSDP').

	self 
		assert: MUDMSDPCommandBuilder new dont contents 
		equals: (self parser parse: 'IAC DONT MSDP').