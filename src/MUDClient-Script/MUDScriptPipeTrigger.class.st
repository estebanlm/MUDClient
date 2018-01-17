Class {
	#name : #MUDScriptPipeTrigger,
	#superclass : #MUDScriptWaitTrigger,
	#instVars : [
		'pipeBlock',
		'outStream',
		'async',
		'lines',
		'matchedButNoExitYet'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptPipeTrigger >> activate [
	outStream := String new writeStream.
	super activate
	
]

{ #category : #accessing }
MUDScriptPipeTrigger >> async [
	async := true
]

{ #category : #accessing }
MUDScriptPipeTrigger >> evaluateWith: aString ifMatches: aBlock [
	(self matches: aString) 
		ifTrue: [ self triggerMatched: aString then: aBlock]
		ifFalse: [ self triggerNotMatched: aString ].
	self postEvaluateThen: aBlock
]

{ #category : #execute }
MUDScriptPipeTrigger >> execute [ 
	pipeBlock value: outStream contents
]

{ #category : #initialization }
MUDScriptPipeTrigger >> initialize [
	super initialize.
	matchedButNoExitYet := false
]

{ #category : #accessing }
MUDScriptPipeTrigger >> lines [
	^ lines
]

{ #category : #api }
MUDScriptPipeTrigger >> lines: aNumber [
	lines := aNumber
]

{ #category : #private }
MUDScriptPipeTrigger >> postEvaluateThen: aBlock [
	self lines ifNotNil: [ self postEvaluateWithLineCountThen: aBlock ]
]

{ #category : #private }
MUDScriptPipeTrigger >> postEvaluateWithLineCountThen: aBlock [
	outStream contents lines size >= self lines 
		ifTrue: [ super triggerMatchedThen: aBlock ]
]

{ #category : #accessing }
MUDScriptPipeTrigger >> suspendProcess [
	async ifFalse: [ super suspendProcess ]
]

{ #category : #api }
MUDScriptPipeTrigger >> to: aBlock [
	pipeBlock := aBlock
]

{ #category : #private }
MUDScriptPipeTrigger >> triggerMatched: aString then: aBlock [
	self triggerMatchedThen: aBlock
]

{ #category : #private }
MUDScriptPipeTrigger >> triggerMatchedThen: aBlock [
	self lines ifNotNil: [ ^ self triggerMatchedWithLineCount ].
	super triggerMatchedThen: aBlock
]

{ #category : #private }
MUDScriptPipeTrigger >> triggerMatchedWithLineCount [
	"enter this is I want to exit on lines (not until)"
	matchedButNoExitYet := true
	
]

{ #category : #private }
MUDScriptPipeTrigger >> triggerNotMatched: aString [
	outStream << aString << String cr
]
