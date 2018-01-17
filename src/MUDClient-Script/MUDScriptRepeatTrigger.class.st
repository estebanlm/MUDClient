Class {
	#name : #MUDScriptRepeatTrigger,
	#superclass : #MUDScriptWaitTrigger,
	#instVars : [
		'outStream',
		'repeatBlock',
		'whileBlock',
		'wait'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptRepeatTrigger >> activate [
	outStream := String new writeStream.
	self repeat value.	
	super activate
]

{ #category : #accessing }
MUDScriptRepeatTrigger >> evaluateWith: aString ifMatches: aBlock [
	(self matches: aString) 
		ifTrue: [ self triggerMatchedThen: aBlock]
		ifFalse: [ outStream << aString << String cr ]
]

{ #category : #execute }
MUDScriptRepeatTrigger >> execute [ 
	self action value: outStream contents
]

{ #category : #accessing }
MUDScriptRepeatTrigger >> repeat [
	^ repeatBlock
]

{ #category : #accessing }
MUDScriptRepeatTrigger >> repeat: anObject [
	repeatBlock := anObject
]

{ #category : #accessing }
MUDScriptRepeatTrigger >> wait [
	^ wait
]

{ #category : #accessing }
MUDScriptRepeatTrigger >> wait: aDuration [
	wait := aDuration
]

{ #category : #accessing }
MUDScriptRepeatTrigger >> while [
	^ whileBlock
]

{ #category : #accessing }
MUDScriptRepeatTrigger >> while: anObject [
	whileBlock := anObject
]
