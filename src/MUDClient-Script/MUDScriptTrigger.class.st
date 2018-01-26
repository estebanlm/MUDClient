"
I'm a generic ""trigger"" control for the scripting DSL.

a trigger is a control that manages the flow of that that comes from server and does something (""triggers"" something). There are many possible kinds of it and my children will implement them. 
"
Class {
	#name : #MUDScriptTrigger,
	#superclass : #Object,
	#instVars : [
		'script',
		'evaluator',
		'regexpPatterns',
		'patterns'
	],
	#classVars : [
		'ActiveTriggers'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptTrigger class >> activeTriggers [
	^ ActiveTriggers ifNil: [ ActiveTriggers := OrderedCollection new ]
]

{ #category : #accessing }
MUDScriptTrigger class >> addTrigger: aTrigger [
	self activeTriggers add: aTrigger
]

{ #category : #'instance creation' }
MUDScriptTrigger class >> new [
	self error: 'Use #script:evaluator:'
]

{ #category : #accessing }
MUDScriptTrigger class >> removeTrigger: aTrigger [
	self activeTriggers remove: aTrigger ifAbsent: []
]

{ #category : #accessing }
MUDScriptTrigger class >> removeTriggersForScript: aScript [
	(self activeTriggers 
		select: [ :each | each script = aScript ])
		do: [ :each | self removeTrigger: each ]
	
]

{ #category : #initialization }
MUDScriptTrigger class >> reset [
	<script>
	ActiveTriggers := nil
]

{ #category : #'instance creation' }
MUDScriptTrigger class >> script: aScript evaluator: anEvaluator [
	^ self basicNew 
		initializeScript: aScript evaluator: anEvaluator;
		yourself
]

{ #category : #accessing }
MUDScriptTrigger >> activate [
	self class addTrigger: self
]

{ #category : #accessing }
MUDScriptTrigger >> deactivate [
	self class removeTrigger: self
]

{ #category : #api }
MUDScriptTrigger >> do [
	"I'm an synonym for activate"
	self activate
]

{ #category : #evaluating }
MUDScriptTrigger >> evaluateWith: aString [
	self evaluateWith: aString ifMatches: [ ]
]

{ #category : #evaluating }
MUDScriptTrigger >> evaluateWith: aString ifMatches: aBlock [
	(self matches: aString) 
		ifTrue: [ self triggerMatchedThen: aBlock ]
]

{ #category : #evaluating }
MUDScriptTrigger >> evaluateWithAll: aCollection [
	aCollection do: [ :each | 
		self evaluateWith: each ifMatches: [ ^ self ] ]
]

{ #category : #accessing }
MUDScriptTrigger >> evaluator [
	^ evaluator
]

{ #category : #execute }
MUDScriptTrigger >> execute [
	self subclassResponsibility
]

{ #category : #initialization }
MUDScriptTrigger >> initialize [
	super initialize.
	patterns := Set new
]

{ #category : #initialization }
MUDScriptTrigger >> initializeScript: aScript [
	script := aScript.
	self initialize
]

{ #category : #initialization }
MUDScriptTrigger >> initializeScript: aScript evaluator: anEvaluator [
	script := aScript.
	evaluator := anEvaluator.
	self initialize
]

{ #category : #testing }
MUDScriptTrigger >> matches: aString [
	^ self regexpPatterns anySatisfy: [ :each | each matches: aString ]
]

{ #category : #'private accessing' }
MUDScriptTrigger >> patterns [
	^ patterns
]

{ #category : #'private accessing' }
MUDScriptTrigger >> regexpPatterns [
	^ regexpPatterns ifNil: [ 
		regexpPatterns := self patterns collect: [ :each | each asRegexIgnoringCase ] ]

]

{ #category : #accessing }
MUDScriptTrigger >> script [
	^ script
]

{ #category : #private }
MUDScriptTrigger >> triggerMatchedThen: aBlock [
	self execute.
	self deactivate.
	aBlock value 
]
