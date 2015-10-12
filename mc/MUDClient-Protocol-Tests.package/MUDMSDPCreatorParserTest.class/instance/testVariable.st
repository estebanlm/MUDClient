tests
testVariable 
	self 
		parse: 'MSDP_VAR "SEND" MSDP_VAL "HEALTH"'
		rule: #variable	.
	
	self 
		parse: 'MSDP_VAR "ROOM" MSDP_VAL 
	MSDP_TABLE_OPEN 
		MSDP_VAR "VNUM" MSDP_VAL "6008" 
	MSDP_TABLE_CLOSE'
		rule: #variable.
		
	self parse: 'MSDP_VAR "REPORTABLE_VARIABLES" MSDP_VAL 
	MSDP_ARRAY_OPEN 
		MSDP_VAL "HEALTH" 
		MSDP_VAL "HEALTH_MAX" 
		MSDP_VAL "MANA" 
		MSDP_VAL "MANA_MAX" 
	MSDP_ARRAY_CLOSE'
		rule: #variable.