Class {
	#name : #MUDScriptWhenTrigger,
	#superclass : #MUDScriptTrigger,
	#instVars : [
		'actionBlock'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptWhenTrigger >> action [
	^ actionBlock
]

{ #category : #accessing }
MUDScriptWhenTrigger >> action: aBlock [
	actionBlock := aBlock
]

{ #category : #execute }
MUDScriptWhenTrigger >> execute [ 
	self action value
]
