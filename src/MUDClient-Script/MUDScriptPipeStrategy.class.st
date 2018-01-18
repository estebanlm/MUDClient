Class {
	#name : #MUDScriptPipeStrategy,
	#superclass : #Object,
	#instVars : [
		'trigger'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #private }
MUDScriptPipeStrategy class >> classFor: aTrigger [
	^ self allSubclasses 
		detect: [ :each | each isAvailableFor: aTrigger ]
		ifNone: [ MUDScriptPipeDefaultStrategy ]
]

{ #category : #'instance creation' }
MUDScriptPipeStrategy class >> for: aTrigger [
	^ (self classFor: aTrigger) new
		trigger: aTrigger;
		yourself
]

{ #category : #testing }
MUDScriptPipeStrategy class >> isAvailableFor: aTrigger [
	^ false
]

{ #category : #accessing }
MUDScriptPipeStrategy >> evaluateWith: aString ifMatches: aBlock [
	self subclassResponsibility
]

{ #category : #testing }
MUDScriptPipeStrategy >> matches: aString [
	^ self trigger matches: aString
]

{ #category : #accessing }
MUDScriptPipeStrategy >> outStream [
	^ self trigger outStream
]

{ #category : #accessing }
MUDScriptPipeStrategy >> trigger [
	^ trigger
]

{ #category : #accessing }
MUDScriptPipeStrategy >> trigger: anObject [
	trigger := anObject
]
