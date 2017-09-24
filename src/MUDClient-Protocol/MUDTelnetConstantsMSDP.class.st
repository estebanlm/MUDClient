Class {
	#name : #MUDTelnetConstantsMSDP,
	#superclass : #SharedPool,
	#classVars : [
		'MSDP',
		'MSDP_ARRAY_CLOSE',
		'MSDP_ARRAY_OPEN',
		'MSDP_TABLE_CLOSE',
		'MSDP_TABLE_OPEN',
		'MSDP_VAL',
		'MSDP_VAR'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #'class initialization' }
MUDTelnetConstantsMSDP class >> initialize [
	"self initialize"

	MSDP := 69.
	MSDP_VAR := 1.
	MSDP_VAL := 2.
	MSDP_TABLE_OPEN := 3.
	MSDP_TABLE_CLOSE := 4.
	MSDP_ARRAY_OPEN := 5.
	MSDP_ARRAY_CLOSE := 6.
]
