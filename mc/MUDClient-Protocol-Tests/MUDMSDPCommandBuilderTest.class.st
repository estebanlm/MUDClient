Class {
	#name : #MUDMSDPCommandBuilderTest,
	#superclass : #TestCase,
	#instVars : [
		'parser'
	],
	#category : 'MUDClient-Protocol-Tests'
}

{ #category : #accessing }
MUDMSDPCommandBuilderTest >> parser [ 
	^ parser ifNil: [ parser := MUDMSDPCreatorParser new ]
]

{ #category : #tests }
MUDMSDPCommandBuilderTest >> testNegotiation [
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
]

{ #category : #tests }
MUDMSDPCommandBuilderTest >> testSubcommand [
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
]

{ #category : #tests }
MUDMSDPCommandBuilderTest >> testSubcommandComplex [
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

]
