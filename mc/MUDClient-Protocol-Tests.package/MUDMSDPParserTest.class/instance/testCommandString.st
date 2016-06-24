tests
testCommandString 
	| result |
	
	result := self parser parse: (self command: 'IAC SB MSDP MSDP_VAR "SEND" MSDP_VAL "HEALTH" IAC SE').
	
	self assert: result class = MUDMSDPValue.
	self assert: result variableName = 'SEND'.
	self assert: result value = 'HEALTH'.