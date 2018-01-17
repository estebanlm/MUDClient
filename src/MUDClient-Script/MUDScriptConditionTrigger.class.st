Class {
	#name : #MUDScriptConditionTrigger,
	#superclass : #MUDScriptTrigger,
	#instVars : [
		'actionBlock'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #api }
MUDScriptConditionTrigger >> do: aBlock [
	actionBlock := aBlock.
	self do
]

{ #category : #execute }
MUDScriptConditionTrigger >> execute [ 
	actionBlock value
]

{ #category : #api }
MUDScriptConditionTrigger >> when: aString [
	patterns add: aString
]
