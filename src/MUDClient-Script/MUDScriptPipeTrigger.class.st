Class {
	#name : #MUDScriptPipeTrigger,
	#superclass : #MUDScriptWaitTrigger,
	#instVars : [
		'actionBlock',
		'stream'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptPipeTrigger >> action [
	^ actionBlock
]

{ #category : #accessing }
MUDScriptPipeTrigger >> action: aBlock [
	actionBlock := aBlock
]

{ #category : #accessing }
MUDScriptPipeTrigger >> activate [
	stream := String new writeStream.
	super activate
]

{ #category : #accessing }
MUDScriptPipeTrigger >> evaluateWith: aString ifMatches: aBlock [
	(self matches: aString) 
		ifTrue: [ self triggerMatchedThen: aBlock]
		ifFalse: [ stream << aString << String cr ]
]

{ #category : #execute }
MUDScriptPipeTrigger >> execute [ 
	self action value: stream contents
]
