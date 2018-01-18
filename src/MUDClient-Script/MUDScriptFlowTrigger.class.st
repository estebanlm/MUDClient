Class {
	#name : #MUDScriptFlowTrigger,
	#superclass : #MUDScriptStopTrigger,
	#instVars : [
		'flowConditions'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #api }
MUDScriptFlowTrigger >> continue [
	self deactivate
]

{ #category : #evaluating }
MUDScriptFlowTrigger >> evaluateWith: aString ifMatches: aBlock [
	flowConditions keysAndValuesDo: [ :regexp :block |
		(regexp matches: aString) 
			ifTrue: [ block cull: self ]  ]
]

{ #category : #initialization }
MUDScriptFlowTrigger >> initialize [
	super initialize.
	flowConditions := OrderedDictionary new
]

{ #category : #api }
MUDScriptFlowTrigger >> when: aString do: aBlock [
	flowConditions at: aString asRegexIgnoringCase put: aBlock
]
