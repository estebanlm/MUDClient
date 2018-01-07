Class {
	#name : #MUDScript,
	#superclass : #Object,
	#instVars : [
		'actionBlock',
		'terminal'
	],
	#category : #MUDClient-Script
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
		cull: (MUDScriptFacade for: self terminal)
		cull: (MUDScriptUIFacade for: self terminal) ] fork
]

{ #category : #accessing }
MUDScript >> terminal [
	^ terminal
]

{ #category : #accessing }
MUDScript >> terminal: aTerminal [
	terminal := aTerminal
]
