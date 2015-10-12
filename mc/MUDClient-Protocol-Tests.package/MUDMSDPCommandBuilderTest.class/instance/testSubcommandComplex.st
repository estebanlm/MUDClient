tests
testSubcommandComplex
	self
		assert: (MUDMSDPCommandBuilder subcommand: [ :command | 
			command 
				at: 'ROOM' putMap: [
					command 
						at: 'VNUM' put: 42;
						at: 'NAME' put: 'TEST';
						at: 'AREA' put: '';
						at: 'TERRAIN' put: '';
						at: 'COORDS' putMap: [ 
							command 
								at: 'x' put: 42;
								at: 'y' put: 0;
								at: 'z' put: 0 ];
						at: 'EXITS' putMap: [  
							command 
								at: 'north' put: 43;
								at: 'south' put: '44' ] ] ])
		equals: (self parser parse: 'IAC SB MSDP 
MSDP_VAR "ROOM" MSDP_VAL MSDP_TABLE_OPEN 
	MSDP_VAR "VNUM" MSDP_VAL "42" 
	MSDP_VAR "NAME" MSDP_VAL "TEST" 
	MSDP_VAR "AREA" MSDP_VAL "" 
	MSDP_VAR "TERRAIN" MSDP_VAL "" 
	MSDP_VAR "COORDS" MSDP_VAL MSDP_TABLE_OPEN 
		MSDP_VAR "x" MSDP_VAL "42" 
		MSDP_VAR "y" MSDP_VAL "0" 
		MSDP_VAR "z" MSDP_VAL "0" 
	MSDP_TABLE_CLOSE 
	MSDP_VAR "EXITS" MSDP_VAL MSDP_TABLE_OPEN 
		MSDP_VAR "north" MSDP_VAL "43" 
		MSDP_VAR "south" MSDP_VAL "44"
	MSDP_TABLE_CLOSE 
MSDP_TABLE_CLOSE 
IAC SE').
