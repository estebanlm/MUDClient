Class {
	#name : #MUDScriptTrigger,
	#superclass : #Object,
	#instVars : [
		'regexpPatterns',
		'patterns'
	],
	#classVars : [
		'ActiveTriggers'
	],
	#category : #'MUDClient-Script'
}

{ #category : #'as yet unclassified' }
MUDScriptTrigger class >> activeTriggers [
	^ ActiveTriggers ifNil: [ ActiveTriggers := OrderedCollection new ]
]

{ #category : #accessing }
MUDScriptTrigger >> activate [
	self class activeTriggers add: self
]

{ #category : #accessing }
MUDScriptTrigger >> deactivate [
	self class activeTriggers remove: self

]

{ #category : #accessing }
MUDScriptTrigger >> evaluateWith: aString [
	(self matches: aString) 
		ifTrue: [ 
			self execute.
			self deactivate ]
]

{ #category : #execute }
MUDScriptTrigger >> execute [
	self subclassResponsibility
]

{ #category : #testing }
MUDScriptTrigger >> matches: aString [
	^ self regexpPatterns anySatisfy: [ :each | each matches: aString ]
]

{ #category : #accessing }
MUDScriptTrigger >> patterns [
	^ patterns
]

{ #category : #accessing }
MUDScriptTrigger >> patterns: aString [
	patterns := aString
]

{ #category : #accessing }
MUDScriptTrigger >> regexpPatterns [
	^ regexpPatterns ifNil: [ 
		regexpPatterns := self patterns collect: [ :each | each asRegexIgnoringCase ] ]

]
