"
I execute a task when a condition (or any condition of a list) is satisfied. 

terminal newCondition 	
	when: 'You are.*';
	do: [ ... ]
"
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
