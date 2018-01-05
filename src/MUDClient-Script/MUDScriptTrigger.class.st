Class {
	#name : #MUDScriptTrigger,
	#superclass : #Object,
	#instVars : [
		'process',
		'regexpPatterns',
		'patterns'
	],
	#classVars : [
		'ActiveTriggers'
	],
	#category : #MUDClient-Script
}

{ #category : #'as yet unclassified' }
MUDScriptTrigger class >> activeTriggers [
	^ ActiveTriggers ifNil: [ ActiveTriggers := OrderedCollection new ]
]

{ #category : #accessing }
MUDScriptTrigger >> activate [
	self class activeTriggers add: self.
	process := Processor activeProcess.
	process suspend.
]

{ #category : #accessing }
MUDScriptTrigger >> deactivate [
	self class activeTriggers remove: self.
	process resume

]

{ #category : #testing }
MUDScriptTrigger >> evaluateWith: aString [
	(self matches: aString) ifTrue: [ 
		self deactivate ]
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
