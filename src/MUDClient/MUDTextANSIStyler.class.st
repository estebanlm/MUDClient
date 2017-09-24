Class {
	#name : #MUDTextANSIStyler,
	#superclass : #MUDTextStyler,
	#instVars : [
		'parser'
	],
	#category : 'MUDClient-View-Text'
}

{ #category : #accessing }
MUDTextANSIStyler >> applyStyle: aString [
	| formatter |
	formatter := self createFormatter.
	aString linesDo: [ :each |
		each ifNotEmpty: [  
			formatter visitAll: (parser 
				parse: each 
				onError: [ :message | self error: message ]) ].
		text endPosition insert: String cr ]
]

{ #category : #factory }
MUDTextANSIStyler >> createFormatter [
	^ MUDTextANSIFormatter new text: text
]

{ #category : #initialization }
MUDTextANSIStyler >> initialize [
	super initialize.
	parser := MUDANSIParser new.
]
