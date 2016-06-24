tests
testCommandList 
	| result  |
	
	result := self parser parse: (self command: 'IAC SB MSDP MSDP_VAR "REPORTABLE_VARIABLES" MSDP_VAL MSDP_ARRAY_OPEN MSDP_VAL "HEALTH" MSDP_VAL "HEALTH_MAX" MSDP_VAL "MANA" MSDP_VAL "MANA_MAX" MSDP_ARRAY_CLOSE IAC SE').

	self assert: result class = MUDMSDPList.
	self assert: result variableName = 'REPORTABLE_VARIABLES'.
	self assert: result value notEmpty.
	self assert: result value sorted asArray = { 'HEALTH'. 'HEALTH_MAX'. 'MANA'. 'MANA_MAX' }.