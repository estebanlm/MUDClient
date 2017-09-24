"
I'm a value (string) instance of a MSDP variable.
"
Class {
	#name : #MUDMSDPValue,
	#superclass : #MUDMSDPInstance,
	#instVars : [
		'value'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #accessing }
MUDMSDPValue >> value [ 
	^ value
]

{ #category : #accessing }
MUDMSDPValue >> value: aString [  
	value := aString
]

{ #category : #accessing }
MUDMSDPValue >> valueAsCollection [ 
	^ { self value }
]
