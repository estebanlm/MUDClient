Class {
	#name : #MUDScriptTrigger,
	#superclass : #Object,
	#instVars : [
		'script',
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
	self error: 'Use #on:'
]

{ #category : #'instance creation' }
MUDScriptTrigger class >> on: aScript [
	^ self basicNew 
		initializeScript: aScript;
		yourself
]

{ #category : #accessing }
MUDScriptTrigger class >> removeTrigger: aTrigger [
	self activeTriggers remove: aTrigger
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

{ #category : #accessing }
MUDScriptTrigger >> script: anObject [
	script := anObject
]

{ #category : #private }
MUDScriptTrigger >> triggerMatchedThen: aBlock [
	self execute.
	self deactivate.
	aBlock value 
]
