Class {
	#name : #MUDScriptPipeTrigger,
	#superclass : #MUDScriptWaitTrigger,
	#instVars : [
		'pipeBlock',
		'outStream',
		'async',
		'lines',
		'matchedButNoExitYet',
		'pipeStrategy'
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

{ #category : #'private factory' }
MUDScriptPipeTrigger >> createPipeStrategy [
	^ MUDScriptPipeStrategy for: self
]

{ #category : #accessing }
MUDScriptPipeTrigger >> evaluateWith: aString ifMatches: aBlock [
	self pipeStrategy
		evaluateWith: aString 
		ifMatches: aBlock
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

{ #category : #testing }
MUDScriptPipeTrigger >> isLineCounting [
	^ self lines notNil
]

{ #category : #accessing }
MUDScriptPipeTrigger >> lines [
	^ lines
]

{ #category : #api }
MUDScriptPipeTrigger >> lines: aNumber [
	lines := aNumber
]

{ #category : #accessing }
MUDScriptPipeTrigger >> outStream [
	^ outStream
]

{ #category : #private }
MUDScriptPipeTrigger >> pipeStrategy [
	^ pipeStrategy ifNil: [ pipeStrategy := self createPipeStrategy ]
]

{ #category : #accessing }
MUDScriptPipeTrigger >> suspendProcess [
	async ifFalse: [ super suspendProcess ]
]

{ #category : #api }
MUDScriptPipeTrigger >> to: aBlock [
	pipeBlock := aBlock
]
