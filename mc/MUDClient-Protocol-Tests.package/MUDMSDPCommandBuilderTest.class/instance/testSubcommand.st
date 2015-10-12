tests
testSubcommand
	self
		assert: (MUDMSDPCommandBuilder new 
			subcommand: [ :command | command at: 'SEND' put: 'HEALTH' ];
			contents)
		equals: (self parser parse: 'IAC SB MSDP MSDP_VAR "SEND" MSDP_VAL "HEALTH" IAC SE').
		
	self
		assert: (MUDMSDPCommandBuilder new 
			subcommand: [ :command | 
				command
					at: 'ROOM' 
					putMap: [
						command 
							at: 'VNUM' put: '6008';
							at: 'AREA' put: 'Nowhere' ] ];
			contents)
		equals: (self parser parse: 'IAC SB MSDP MSDP_VAR "ROOM" MSDP_VAL 
	MSDP_TABLE_OPEN 
		MSDP_VAR "VNUM" MSDP_VAL "6008" 
		MSDP_VAR "AREA" MSDP_VAL "Nowhere" 
	MSDP_TABLE_CLOSE IAC SE').
	
	self
		assert: (MUDMSDPCommandBuilder new 
			subcommand: [ :command | 
				command
					at: 'REPORTABLE_VARIABLES' 
					putList: [ 
						command 
							put: 'HEALTH';
							put: 'HEALTH_MAX'; 
							put: 'MANA';
							put: 'MANA_MAX' ] ];
			contents)
		equals: (self parser parse: 'IAC SB MSDP MSDP_VAR "REPORTABLE_VARIABLES" MSDP_VAL 
	MSDP_ARRAY_OPEN 
		MSDP_VAL "HEALTH" 
		MSDP_VAL "HEALTH_MAX" 
		MSDP_VAL "MANA" 
		MSDP_VAL "MANA_MAX" 
	MSDP_ARRAY_CLOSE IAC SE').