"
I evaluate a block.
"
Class {
	#name : #MUDScriptActionEvaluator,
	#superclass : #MUDScriptEvaluator,
	#instVars : [
		'actionBlock'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptActionEvaluator >> action [
	^ actionBlock
]

{ #category : #accessing }
MUDScriptActionEvaluator >> action: anObject [
	actionBlock := anObject
]

{ #category : #private }
MUDScriptActionEvaluator >> actionWithArguments: anArray [
	^ self action
]
