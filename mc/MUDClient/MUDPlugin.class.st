"
I'm a basic plugin implementation. 
All plugins need to be children of me in order to work properly. 
"
Class {
	#name : #MUDPlugin,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : 'MUDClient-Model-Plugin'
}

{ #category : #'instance creation' }
MUDPlugin class >> game: aGame [
	^ self new game: aGame
]

{ #category : #accessing }
MUDPlugin class >> spec [ 
	self = MUDPlugin ifTrue: [ ^ self subclassResponsibility ].
	^ (MUDPluginSpec allSubclasses collect: #uniqueInstance)
		detect: [ :each | each pluginClass = self ]
		ifNone: [ nil ]
]

{ #category : #testing }
MUDPlugin >> acceptsProcotolCommand: aCommand [ 
	^ false
]

{ #category : #filtering }
MUDPlugin >> filterOn: aTerminal input: aString [
	"If plugin is filtering input, process aString. 
	 By default do nothing"
	^ aString
]

{ #category : #filtering }
MUDPlugin >> filterOn: aTerminal output: aString [
	"If plugin is filtering output, process aString. 
	 By default do nothing"
	^ aString
]

{ #category : #accessing }
MUDPlugin >> game [
	^ game
]

{ #category : #accessing }
MUDPlugin >> game: aGame [ 
	game := aGame
]

{ #category : #testing }
MUDPlugin >> isActiveOn: aTerminal [
	"Check for plugin active in current environment. 
	 Children can override this to process or not"
	^ true
]

{ #category : #testing }
MUDPlugin >> isProcessingProtocol: protocolId [
	^ false
]

{ #category : #'command processing' }
MUDPlugin >> processOn: aTerminal command: aCommand [
	"Do nothing"
]

{ #category : #accessing }
MUDPlugin >> spec [ 
	^ self class spec
]
