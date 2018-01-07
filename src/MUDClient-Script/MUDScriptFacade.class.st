Class {
	#name : #MUDScriptFacade,
	#superclass : #Object,
	#instVars : [
		'terminal'
	],
	#category : #MUDClient-Script
}

{ #category : #'instance creation' }
MUDScriptFacade class >> for: aTerminal [
	^ self new terminal: aTerminal
]

{ #category : #actions }
MUDScriptFacade >> send: aString [
	^ self terminal send: aString
]

{ #category : #accessing }
MUDScriptFacade >> terminal [
	^ terminal
]

{ #category : #accessing }
MUDScriptFacade >> terminal: anObject [
	terminal := anObject
]

{ #category : #actions }
MUDScriptFacade >> waitUntil: aString [
	self waitUntilAnyOf: { aString }
]

{ #category : #actions }
MUDScriptFacade >> waitUntilAnyOf: aCollection [
	MUDScriptTrigger new 
		patterns: aCollection;
		activate.
	self activeProcess suspend
]
