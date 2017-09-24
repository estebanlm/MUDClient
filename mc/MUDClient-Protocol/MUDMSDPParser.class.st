"
I'm a parser that extends ANSI telnet to understand the MSDP protocols. 
Details can be read here: 

http://tintin.sourceforge.net/msdp/
"
Class {
	#name : #MUDMSDPParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'iac',
		'sb',
		'msdp',
		'var',
		'varName',
		'val',
		'varValue',
		'se',
		'string',
		'array',
		'arrayOpen',
		'arrayClose',
		'table',
		'tableOpen',
		'tableClose',
		'nul',
		'variable',
		'command',
		'variableString',
		'variableTable',
		'variableList'
	],
	#pools : [
		'MUDTelnetConstantsMSDP',
		'TelnetConstantsRFC854'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #accessing }
MUDMSDPParser >> array [
	^ arrayOpen, (val, string) star, arrayClose
		==> [ :nodes | nodes second collect: #second ]
]

{ #category : #primitives }
MUDMSDPParser >> arrayClose [ 
	^ (Character value: MSDP_ARRAY_CLOSE) asParser
]

{ #category : #primitives }
MUDMSDPParser >> arrayOpen [ 
	^ (Character value: MSDP_ARRAY_OPEN) asParser
]

{ #category : #accessing }
MUDMSDPParser >> command [ 
	^ iac, sb, msdp, variable, iac, se
		==> [ :nodes | nodes fourth ]
]

{ #category : #primitives }
MUDMSDPParser >> iac [ 
	^ (Character value: IAC) asParser
]

{ #category : #primitives }
MUDMSDPParser >> msdp [ 
	^ (Character value: MSDP) asParser
]

{ #category : #primitives }
MUDMSDPParser >> nul [ 
	^ (Character value: 0) asParser
]

{ #category : #primitives }
MUDMSDPParser >> sb [ 
	^ (Character value: SB) asParser
]

{ #category : #primitives }
MUDMSDPParser >> se [
	^ (Character value: SE) asParser
]

{ #category : #accessing }
MUDMSDPParser >> start [ 
	^ command end
]

{ #category : #accessing }
MUDMSDPParser >> string [ 
	^ (nul / var / val / tableOpen / tableClose / arrayOpen / arrayClose / iac) negate star flatten
]

{ #category : #accessing }
MUDMSDPParser >> table [ 
	^ tableOpen, variable plus, tableClose 
		==> [ :nodes | nodes second ]
]

{ #category : #primitives }
MUDMSDPParser >> tableClose [ 
	^ (Character value: MSDP_TABLE_CLOSE) asParser
]

{ #category : #primitives }
MUDMSDPParser >> tableOpen [
	^ (Character value: MSDP_TABLE_OPEN) asParser
]

{ #category : #primitives }
MUDMSDPParser >> val [
	^ (Character value: MSDP_VAL) asParser
]

{ #category : #primitives }
MUDMSDPParser >> var [  
	^ (Character value: MSDP_VAR) asParser
]

{ #category : #accessing }
MUDMSDPParser >> varName [ 
	^ string
		==> [ :v | MUDMSDPVariable named: v ]
]

{ #category : #accessing }
MUDMSDPParser >> varValue [  
	^ string 
		/ table
		/ array
]

{ #category : #accessing }
MUDMSDPParser >> variable [
	^ variableTable 
		/ variableList
		/ variableString  

]

{ #category : #accessing }
MUDMSDPParser >> variableList [ 
	^ var, varName, val, array 
		==> [ :nodes |
			MUDMSDPList new 
				variable: nodes second; 
				list: nodes fourth;
				yourself ]
]

{ #category : #accessing }
MUDMSDPParser >> variableString [
	^ var, varName, val, string 
		==> [ :nodes |
			MUDMSDPValue new 
				variable: nodes second; 
				value: nodes fourth;
				yourself ]
]

{ #category : #accessing }
MUDMSDPParser >> variableTable [
	^ var, varName, val, table 
		==> [ :nodes |
			MUDMSDPMap new 
				variable: nodes second; 
				map: nodes fourth;
				yourself ]
]
