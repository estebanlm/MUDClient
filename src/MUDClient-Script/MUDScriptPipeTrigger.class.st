Class {
	#name : #MUDScriptPipeTrigger,
	#superclass : #MUDScriptWaitTrigger,
	#instVars : [
		'actionBlock',
		'outStream'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptPipeTrigger >> activate [
	outStream := String new writeStream.
	super activate
]

{ #category : #accessing }
MUDScriptPipeTrigger >> evaluateWith: aString ifMatches: aBlock [
	(self matches: aString) 
		ifTrue: [ self triggerMatchedThen: aBlock]
		ifFalse: [ outStream << aString << String cr ]
]

{ #category : #execute }
MUDScriptPipeTrigger >> execute [ 
	actionBlock value: outStream contents
]

{ #category : #api }
MUDScriptPipeTrigger >> to: aBlock [
	actionBlock := aBlock
]
