"
I'm a map (table) instance of a MSDP variable.
"
Class {
	#name : #MUDMSDPMap,
	#superclass : #MUDMSDPInstance,
	#instVars : [
		'map'
	],
	#category : 'MUDClient-Protocol-MSDP'
}

{ #category : #accessing }
MUDMSDPMap >> map [ 
	^ map
]

{ #category : #accessing }
MUDMSDPMap >> map: aCollection [ 
	map := aCollection
]

{ #category : #accessing }
MUDMSDPMap >> value [
	^ self map
]

{ #category : #accessing }
MUDMSDPMap >> value: anObject [ 
	self map: anObject.
]

{ #category : #accessing }
MUDMSDPMap >> valueAsCollection [ 
	^ self map associations
]

{ #category : #accessing }
MUDMSDPMap >> valueAt: aString [ 
	^ (self map 
		detect: [ :each | each variableName = aString ])
		value
]
