"
I'm a base variable instance node for RpgMSDPParser.
"
Class {
	#name : #MUDMSDPInstance,
	#superclass : #Object,
	#instVars : [
		'variable'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #'instance creation' }
MUDMSDPInstance class >> name: aString value: anObject [ 
	^ self basicNew 
		initializeName: aString value: anObject;
		yourself
]

{ #category : #initialization }
MUDMSDPInstance >> initializeName: aString value: anObject [ 
	self initialize.
	self variable: (MUDMSDPVariable named: aString).
	self value: anObject.
]

{ #category : #printing }
MUDMSDPInstance >> printOn: aStream [ 
	aStream << self variable asString << $= << self value asString
]

{ #category : #accessing }
MUDMSDPInstance >> value [ 
	self subclassResponsibility
]

{ #category : #accessing }
MUDMSDPInstance >> value:  anObject [ 
	self subclassResponsibility
]

{ #category : #accessing }
MUDMSDPInstance >> valueAsCollection [
	self subclassResponsibility
]

{ #category : #accessing }
MUDMSDPInstance >> variable [
	^ variable
]

{ #category : #accessing }
MUDMSDPInstance >> variable: anObject [
	variable := anObject
]

{ #category : #accessing }
MUDMSDPInstance >> variableName [ 
	^ self variable name
]
