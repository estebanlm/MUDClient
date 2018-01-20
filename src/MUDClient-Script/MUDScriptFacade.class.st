"
I'm an abstract façade for access to MUD stuff.
"
Class {
	#name : #MUDScriptFacade,
	#superclass : #Object,
	#instVars : [
		'script',
		'evaluator'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #'instance creation' }
MUDScriptFacade class >> new [
	self error: 'Use #terminal:script:'
]

{ #category : #'instance creation' }
MUDScriptFacade class >> script: aScript evaluator: anEvaluator [ 
	^ self basicNew
		initializeScript: aScript evaluator: anEvaluator;
		yourself
]

{ #category : #accessing }
MUDScriptFacade >> evaluator [
	^ evaluator
]

{ #category : #accessing }
MUDScriptFacade >> evaluator: anObject [
	evaluator := anObject
]

{ #category : #initialization }
MUDScriptFacade >> initializeScript: aScript evaluator: anEvaluator [
	script := aScript.
	evaluator := anEvaluator.
	self initialize
]

{ #category : #accessing }
MUDScriptFacade >> script [
	^ script
]

{ #category : #accessing }
MUDScriptFacade >> terminal [
	^ self evaluator terminal
]
