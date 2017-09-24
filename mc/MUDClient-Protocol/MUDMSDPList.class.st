"
I'm a list instance of a MSDP variable.
"
Class {
	#name : #MUDMSDPList,
	#superclass : #MUDMSDPInstance,
	#instVars : [
		'list'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #accessing }
MUDMSDPList >> list [
	^ list
]

{ #category : #accessing }
MUDMSDPList >> list: anObject [
	list := anObject
]

{ #category : #accessing }
MUDMSDPList >> value [
	^ self list
]

{ #category : #accessing }
MUDMSDPList >> value: anObject [ 
	self list: anObject.
]

{ #category : #accessing }
MUDMSDPList >> valueAsCollection [ 
	^ self value
]
