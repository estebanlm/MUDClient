"
I'm a MSDP variable name.
"
Class {
	#name : #MUDMSDPVariable,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #'instance creation' }
MUDMSDPVariable class >> named: aString [ 
	^ self basicNew 
		initializeName: aString;
		yourself
]

{ #category : #'instance creation' }
MUDMSDPVariable class >> new [ 
	self error: 'Use #named:'
]

{ #category : #initialization }
MUDMSDPVariable >> initializeName: aString [ 
	name := aString. 
	self initialize.
	
]

{ #category : #accessing }
MUDMSDPVariable >> name [ 
	^ name
]

{ #category : #printing }
MUDMSDPVariable >> printOn: aStream [ 
	aStream nextPutAll: self name.
]
