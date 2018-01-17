Class {
	#name : #MUDScriptPipeWhenTrigger,
	#superclass : #MUDScriptPipeTrigger,
	#instVars : [
		'lines',
		'matched'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptPipeWhenTrigger >> evaluateWith: aString ifMatches: aBlock [
	matched ifTrue: [ 
		outStream << aString << String cr 
		outStream contents lines size >= self lines 
			ifTrue: [ self triggerMatchedThen: aBlock ] ].
	(self matches: aString) ifTrue: [ matched := true ].
	
	
]

{ #category : #initialization }
MUDScriptPipeWhenTrigger >> initialize [
	super initialize.
	matched := false
]

{ #category : #accessing }
MUDScriptPipeWhenTrigger >> lines [
	^ lines
]

{ #category : #accessing }
MUDScriptPipeWhenTrigger >> lines: anObject [
	lines := anObject
]
