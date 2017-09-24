"
I'm a parser to create valid MSDP commands. 
Using me, you can write commands like this: 

ESC IAC SB MSDP MSDP_VAR ""SEND"" MSDP_VAL ""HEALTH"" IAC SE

and obtain the corresponding ByteArray representation. 

You can see

 http://tintin.sourceforge.net/msdp/ 

for more details about the MSDP protocol.
"
Class {
	#name : #MUDMSDPCreatorParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'esc',
		'iac',
		'msdp',
		'sb',
		'se',
		'val',
		'var',
		'string',
		'whitespace',
		'tableOpen',
		'tableClose',
		'arrayOpen',
		'arrayClose',
		'will',
		'wont',
		'do',
		'dont',
		'variable',
		'table',
		'value',
		'array',
		'subcommand',
		'negotiation',
		'command'
	],
	#pools : [
		'MUDTelnetConstantsMSDP',
		'TelnetConstantsRFC854'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #grammar }
MUDMSDPCreatorParser >> array [
	^ arrayOpen, whitespace plus, (value, whitespace plus) plus, arrayClose
		==> [ :nodes | 
			(nodes third 
				inject: nodes first
				into: [ :all :each | all, (each first) ]), 
				nodes fourth ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> arrayClose [
	^ 'MSDP_ARRAY_CLOSE' asParser 
		==> [ :nodes | MSDP_ARRAY_CLOSE asByteArray ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> arrayOpen [
	^ 'MSDP_ARRAY_OPEN' asParser 
		==> [ :nodes | MSDP_ARRAY_OPEN asByteArray ]
]

{ #category : #grammar }
MUDMSDPCreatorParser >> command [ 
	^ negotiation / subcommand
]

{ #category : #primitives }
MUDMSDPCreatorParser >> do [
	^ 'DO' asParser 
		==> [ :nodes | DO asByteArray ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> dont [
	^ 'DONT' asParser 
		==> [ :nodes | DONT asByteArray ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> esc [
	^ 'ESC' asParser 
		==> [ :nodes | #[27] ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> iac [  
	^ 'IAC' asParser 
		==> [ :nodes | IAC asByteArray ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> msdp [ 
	^ 'MSDP' asParser 
		==> [ :nodes | MSDP asByteArray ]
]

{ #category : #grammar }
MUDMSDPCreatorParser >> negotiation [
	^ iac, whitespace plus, (will / wont / dont / do), whitespace plus, msdp
		==> [ :nodes | nodes first, nodes third, nodes fifth ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> sb [
	^ 'SB' asParser 
		==> [ :nodes | SB asByteArray ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> se [
	^ 'SE' asParser 
		==> [ :nodes | SE asByteArray ]
]

{ #category : #accessing }
MUDMSDPCreatorParser >> start [ 
	^ command end
]

{ #category : #primitives }
MUDMSDPCreatorParser >> string [ 
	^ ($" asParser , $" asParser negate star flatten, $" asParser)
		==> [ :nodes | nodes second asByteArray ]
]

{ #category : #grammar }
MUDMSDPCreatorParser >> subcommand [ 
	^ iac, whitespace plus, sb, whitespace plus, msdp, whitespace plus, variable, whitespace plus, iac, whitespace plus, se
		==> [ :nodes | 
			nodes first, 
			nodes third, 
			nodes fifth, 
			nodes seventh, 
			nodes ninth, 
			(nodes at: 11) ]
]

{ #category : #grammar }
MUDMSDPCreatorParser >> table [ 
	^ tableOpen, whitespace plus, (variable, whitespace plus) plus, tableClose
		==> [ :nodes | 
			(nodes third 
				inject: nodes first
				into: [ :all :each | all, (each first) ]), 
				nodes fourth ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> tableClose [
	^ 'MSDP_TABLE_CLOSE' asParser 
		==> [ :nodes | MSDP_TABLE_CLOSE asByteArray ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> tableOpen [
	^ 'MSDP_TABLE_OPEN' asParser 
		==> [ :nodes | MSDP_TABLE_OPEN asByteArray ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> val [
	^ 'MSDP_VAL' asParser 
		==> [ :nodes | MSDP_VAL asByteArray ]
]

{ #category : #grammar }
MUDMSDPCreatorParser >> value [ 
	^ val, whitespace plus, (string / table / array)
		==> [ :nodes | nodes first, nodes third ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> var [
	^ 'MSDP_VAR' asParser 
		==> [ :nodes | MSDP_VAR asByteArray ]
]

{ #category : #grammar }
MUDMSDPCreatorParser >> variable [ 
	^ var, whitespace plus, string, whitespace plus, value
		==> [ :nodes | 
			nodes first, 
			nodes third, 
			nodes fifth ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> whitespace [
	^ #space asParser
]

{ #category : #primitives }
MUDMSDPCreatorParser >> will [
	^ 'WILL' asParser 
		==> [ :nodes | WILL asByteArray ]
]

{ #category : #primitives }
MUDMSDPCreatorParser >> wont [
	^ 'WONT' asParser 
		==> [ :nodes | WONT asByteArray ]
]
