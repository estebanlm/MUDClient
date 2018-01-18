Class {
	#name : #MUDScriptPipeTrigger,
	#superclass : #MUDScriptControlTrigger,
	#instVars : [
		'pipeBlock',
		'outStream',
		'async',
		'lines',
		'pipeStrategy',
		'finished'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptPipeTrigger >> activate [
	outStream := String new writeStream.
	super activate
	
]

{ #category : #api }
MUDScriptPipeTrigger >> async [
	async := true
]

{ #category : #evaluating }
MUDScriptPipeTrigger >> evaluateWith: aString ifMatches: aBlock [
	self pipeStrategy
		evaluateWith: aString 
		ifMatches: aBlock
]

{ #category : #evaluating }
MUDScriptPipeTrigger >> evaluateWithAll: aCollection [
	aCollection do: [ :each | 
		self evaluateWith: each ifMatches: [] ]
]

{ #category : #execute }
MUDScriptPipeTrigger >> execute [ 
	pipeBlock value: outStream contents.
	finished := true
]

{ #category : #initialization }
MUDScriptPipeTrigger >> initialize [
	super initialize.
	async := false.
	finished := false
]

{ #category : #testing }
MUDScriptPipeTrigger >> isFinished [
	^ finished
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
	^ pipeStrategy ifNil: [ pipeStrategy := MUDScriptPipeStrategy for: self ]
]

{ #category : #execute }
MUDScriptPipeTrigger >> resumeProcess [
	async ifFalse: [ super resumeProcess ]
]

{ #category : #execute }
MUDScriptPipeTrigger >> suspendProcess [
	async ifFalse: [ super suspendProcess ]
]

{ #category : #api }
MUDScriptPipeTrigger >> to: aBlock [
	pipeBlock := aBlock
]

{ #category : #api }
MUDScriptPipeTrigger >> waitUntilFinish [
	"I will transform me into a synchronic pipe if is not finish"
	finished ifTrue: [ ^ self ].
	async ifFalse: [ ^ self ].
	
	async := true.
	self suspendProcess
]
