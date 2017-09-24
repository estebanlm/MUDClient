"
I'm a MSDP telnet command builder. 
I create commands to be send to telnet terminals. 

I'm better than a parser because I'm more aligned with pharo :)

"
Class {
	#name : #MUDMSDPCommandBuilder,
	#superclass : #Object,
	#instVars : [
		'stream'
	],
	#pools : [
		'MUDTelnetConstantsMSDP',
		'TelnetConstantsRFC854'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #building }
MUDMSDPCommandBuilder class >> subcommand: aBlock [ 
	^ self new 
		subcommand: aBlock;
		contents
]

{ #category : #commands }
MUDMSDPCommandBuilder >> at: aString put: anObject [ 
	self var: aString.
	self put: anObject.
]

{ #category : #commands }
MUDMSDPCommandBuilder >> at: aString putList: aCollectionOrBlock [ 
	self 
		at: aString 
		put: [ self list: aCollectionOrBlock ]
]

{ #category : #commands }
MUDMSDPCommandBuilder >> at: aString putMap: aDictionaryOrBlock [ 
	self 
		at: aString 
		put: [ self map: aDictionaryOrBlock ]
]

{ #category : #accessing }
MUDMSDPCommandBuilder >> contents [ 
	^ stream contents
]

{ #category : #commands }
MUDMSDPCommandBuilder >> do [
	stream << IAC << DO << MSDP
]

{ #category : #commands }
MUDMSDPCommandBuilder >> dont [
	stream << IAC << DONT << MSDP
		
]

{ #category : #initialization }
MUDMSDPCommandBuilder >> initialize [ 
	super initialize.
	stream := (ByteArray new: 200) writeStream.
]

{ #category : #commands }
MUDMSDPCommandBuilder >> list: aCollectionOrBlock [ 
	stream << MSDP_ARRAY_OPEN.
	aCollectionOrBlock acceptCommand: self.	
	stream << MSDP_ARRAY_CLOSE.		
]

{ #category : #commands }
MUDMSDPCommandBuilder >> map: aDictionaryOrBlock [ 
	stream << MSDP_TABLE_OPEN.
	aDictionaryOrBlock acceptCommand: self.	
	stream << MSDP_TABLE_CLOSE.	
]

{ #category : #commands }
MUDMSDPCommandBuilder >> put: anObject [ 
	stream << MSDP_VAL.
	anObject acceptCommand: self.
]

{ #category : #commands }
MUDMSDPCommandBuilder >> subcommand: aBlock [ 
	stream << IAC << SB << MSDP.
	aBlock cull: self.
	stream << IAC << SE

]

{ #category : #commands }
MUDMSDPCommandBuilder >> var: aString [
	stream 
		<< MSDP_VAR;
		<< aString asByteArray.
]

{ #category : #visitor }
MUDMSDPCommandBuilder >> visitBlockClosure: aBlock [ 
	aBlock cull: self.
]

{ #category : #visitor }
MUDMSDPCommandBuilder >> visitCollection: aCollection [ 
	aCollection do: [ :each | self put: each ]
]

{ #category : #visitor }
MUDMSDPCommandBuilder >> visitDictionary: aDictionary [
	aDictionary keysAndValuesDo: [ :var :val | 
		self at: var put: val ].

]

{ #category : #visitor }
MUDMSDPCommandBuilder >> visitString: aString [ 
	stream nextPutAll: aString asByteArray
]

{ #category : #commands }
MUDMSDPCommandBuilder >> will [ 
	stream << IAC << WILL << MSDP
]

{ #category : #commands }
MUDMSDPCommandBuilder >> wont [ 
	stream << IAC << WONT << MSDP
		
]
