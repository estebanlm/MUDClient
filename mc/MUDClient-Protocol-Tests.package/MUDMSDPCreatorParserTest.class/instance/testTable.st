tests
testTable
	self 
		parse: 'MSDP_TABLE_OPEN 
		MSDP_VAR "VNUM" MSDP_VAL "6008" 
		MSDP_VAR "AREA" MSDP_VAL "Unknown"
	MSDP_TABLE_CLOSE'
		rule: #table.
		
	self 
		parse: 'MSDP_TABLE_OPEN 
		MSDP_VAR "EXITS" MSDP_VAL MSDP_TABLE_OPEN 
			MSDP_VAR "north" MSDP_VAL "1" 
			MSDP_VAR "south" MSDP_VAL "2" 
			MSDP_VAR "east" MSDP_VAL "3" 
		MSDP_TABLE_CLOSE
	MSDP_TABLE_CLOSE'
		rule: #table.
		
	self 
		parse: 'MSDP_TABLE_OPEN 
		MSDP_VAR "ITEMS" MSDP_VAL MSDP_ARRAY_OPEN 
				MSDP_VAL "a" 
				MSDP_VAL "b"
				MSDP_VAL "c"
			MSDP_ARRAY_CLOSE
	MSDP_TABLE_CLOSE'
		rule: #table	