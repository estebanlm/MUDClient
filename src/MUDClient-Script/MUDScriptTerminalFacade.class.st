Class {
	#name : #MUDScriptTerminalFacade,
	#superclass : #Object,
	#instVars : [
		'terminal'
	],
	#category : #'MUDClient-Script'
}

{ #category : #'instance creation' }
MUDScriptTerminalFacade class >> for: aTerminal [
	^ self new terminal: aTerminal
]

{ #category : #'actions transmit' }
MUDScriptTerminalFacade >> send: aString [
	^ self terminal send: aString
]

{ #category : #accessing }
MUDScriptTerminalFacade >> terminal [
	^ terminal
]

{ #category : #accessing }
MUDScriptTerminalFacade >> terminal: anObject [
	terminal := anObject
]

{ #category : #'actions input' }
MUDScriptTerminalFacade >> waitUntil: aString [
	self waitUntilAnyOf: { aString }
]

{ #category : #'actions input' }
MUDScriptTerminalFacade >> waitUntilAnyOf: aCollection [
	MUDScriptWaitTrigger new 
		patterns: aCollection;
		activate
]

{ #category : #'actions input' }
MUDScriptTerminalFacade >> when: aString do: aBlock [
	self whenAnyOf: { aString } do: aBlock
]

{ #category : #'actions input' }
MUDScriptTerminalFacade >> whenAnyOf: aCollection do: aBlock [
	MUDScriptWaitTrigger new
		patterns: aCollection;
		action: aBlock;
		activate
]

{ #category : #'actions plugins' }
MUDScriptTerminalFacade >> withPlugin: aClass do: aBlock [
	self terminal game 
		pluginByClass: aClass 
		ifAbsent: [ nil ]
]