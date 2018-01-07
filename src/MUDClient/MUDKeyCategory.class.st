"
I'm a special key binding category that keeps the bindings for MUD commands.
"
Class {
	#name : #MUDKeyCategory,
	#superclass : #KMCategory,
	#instVars : [
		'owner'
	],
	#category : #'MUDClient-View'
}

{ #category : #testing }
MUDKeyCategory class >> isGlobalCategory [
	^ false
]

{ #category : #accessing }
MUDKeyCategory >> owner [
	^ owner
]

{ #category : #accessing }
MUDKeyCategory >> owner: anObject [
	owner := anObject
]
