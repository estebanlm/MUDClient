Class {
	#name : #MUDMSDPCreatorParserTest,
	#superclass : #PPCompositeParserTest,
	#category : 'MUDClient-Protocol-Tests'
}

{ #category : #accessing }
MUDMSDPCreatorParserTest >> parserClass [ 
	^ MUDMSDPCreatorParser
]

{ #category : #tests }
MUDMSDPCreatorParserTest >> testArray [
	self 
		parse: 'MSDP_ARRAY_OPEN MSDP_VAL "HEALTH" MSDP_VAL "HEALTH_MAX" MSDP_VAL "MANA" MSDP_VAL "MANA_MAX" MSDP_ARRAY_CLOSE'
		rule: #array
]

{ #category : #tests }
MUDMSDPCreatorParserTest >> testCommand [
	self 
		parse: 'IAC WILL MSDP'
		rule: #command.
	
	self 
		parse: 'IAC SB MSDP 
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
IAC SE'
	rule: #command
]

{ #category : #tests }
MUDMSDPCreatorParserTest >> testNegotiation [
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
]

{ #category : #tests }
MUDMSDPCreatorParserTest >> testSubcommand [
	self 
		parse: 'IAC SB MSDP 
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
IAC SE'
	rule: #subcommand
]

{ #category : #tests }
MUDMSDPCreatorParserTest >> testTable [
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
]

{ #category : #tests }
MUDMSDPCreatorParserTest >> testVariable [ 
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
]
