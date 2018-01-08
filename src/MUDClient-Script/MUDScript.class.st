Class {
	#name : #MUDScript,
	#superclass : #Object,
	#instVars : [
		'actionBlock',
		'terminal',
		'id'
	],
	#category : #'MUDClient-Script'
}

{ #category : #'as yet unclassified' }
MUDScript class >> terminal: aTerminal action: aBlock [
	^ self new 
		terminal: aTerminal;
		action: aBlock;
		yourself
]

{ #category : #accessing }
MUDScript >> action [
	^ actionBlock
]

{ #category : #accessing }
MUDScript >> action: aBlock [
	actionBlock := aBlock
]

{ #category : #execution }
MUDScript >> execute [ 
	"Scripts needs to be executed inside a process to allow 'waits', etc."
	[ self action 
		cull: (MUDScriptTerminalFacade for: self terminal)
		cull: (MUDScriptUIFacade for: self terminal) ] 
	forkNamed: ('MUDScript: ', self id asString)
]

{ #category : #accessing }
MUDScript >> id [
	^ id ifNil: [ id := UUID new ]
]

{ #category : #accessing }
MUDScript >> terminal [
	^ terminal
]

{ #category : #accessing }
MUDScript >> terminal: aTerminal [
	terminal := aTerminal
]
