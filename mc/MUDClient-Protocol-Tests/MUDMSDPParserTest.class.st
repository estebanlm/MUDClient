Class {
	#name : #MUDMSDPParserTest,
	#superclass : #TestCase,
	#category : 'MUDClient-Protocol-Tests'
}

{ #category : #accessing }
MUDMSDPParserTest >> command: aString [ 
	^ (MUDMSDPCreatorParser parse: aString) asString.
]

{ #category : #accessing }
MUDMSDPParserTest >> parser [ 
	^ MUDMSDPParser new
]

{ #category : #tests }
MUDMSDPParserTest >> testCommandList [ 
	| result  |
	
	result := self parser parse: (self command: 'IAC SB MSDP MSDP_VAR "REPORTABLE_VARIABLES" MSDP_VAL MSDP_ARRAY_OPEN MSDP_VAL "HEALTH" MSDP_VAL "HEALTH_MAX" MSDP_VAL "MANA" MSDP_VAL "MANA_MAX" MSDP_ARRAY_CLOSE IAC SE').

	self assert: result class = MUDMSDPList.
	self assert: result variableName = 'REPORTABLE_VARIABLES'.
	self assert: result value notEmpty.
	self assert: result value sorted asArray = { 'HEALTH'. 'HEALTH_MAX'. 'MANA'. 'MANA_MAX' }.
]

{ #category : #tests }
MUDMSDPParserTest >> testCommandString [ 
	| result |
	
	result := self parser parse: (self command: 'IAC SB MSDP MSDP_VAR "SEND" MSDP_VAL "HEALTH" IAC SE').
	
	self assert: result class = MUDMSDPValue.
	self assert: result variableName = 'SEND'.
	self assert: result value = 'HEALTH'.
]

{ #category : #tests }
MUDMSDPParserTest >> testCommandTable [
	| results exits |
	
	results := self parser parse: (self command: 'IAC SB MSDP MSDP_VAR "ROOM" MSDP_VAL MSDP_TABLE_OPEN MSDP_VAR "VNUM" MSDP_VAL "6008" MSDP_VAR "NAME" MSDP_VAL "The forest clearing" MSDP_VAR "AREA" MSDP_VAL "Haon Dor" MSDP_VAR "TERRAIN" MSDP_VAL "forest" MSDP_VAR "EXITS" MSDP_VAL MSDP_TABLE_OPEN MSDP_VAR "n" MSDP_VAL "6011" MSDP_VAR "e" MSDP_VAL "6007" MSDP_TABLE_CLOSE MSDP_TABLE_CLOSE IAC SE').

	self assert: results class = MUDMSDPMap.

	self assert: results variableName = 'ROOM'.
	self assert: results value notEmpty.
	
	self shouldnt: [ self assert: (results valueAt: 'VNUM') = '6008' ] raise: Error.
	self shouldnt: [ self assert: (results valueAt: 'NAME') = 'The forest clearing' ] raise: Error.
	self shouldnt: [ self assert: (results valueAt: 'AREA') = 'Haon Dor' ] raise: Error.
	self shouldnt: [ self assert: (results valueAt: 'TERRAIN') = 'forest' ] raise: Error.
	
	self shouldnt: [ exits := (results valueAt: 'EXITS') ] raise: Error.
	self 
		shouldnt: [ self assert: (exits detect: [ :each | each variableName =  'n']) value = '6011' ] 
		raise: Error.
	self 
		shouldnt: [ self assert: (exits detect: [ :each | each variableName =  'e']) value = '6007' ] 
		raise: Error.
]
