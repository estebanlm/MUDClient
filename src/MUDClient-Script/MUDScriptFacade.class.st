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

{ #category : #api }
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

{ #category : #api }
MUDScriptFacade >> waitUntil: aString [
	self waitUntilAnyOf: { aString }
]

{ #category : #api }
MUDScriptFacade >> waitUntilAnyOf: aCollection [
	MUDScriptTrigger new 
		patterns: aCollection;
		activate.
	self activeProcess suspend
]
