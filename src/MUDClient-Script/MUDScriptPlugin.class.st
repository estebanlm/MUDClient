"
I define a scriptpad (a place where user can place scripts to the current game)

"
Class {
	#name : #MUDScriptPlugin,
	#superclass : #MUDPlugin,
	#instVars : [
		'scripts'
	],
	#classVars : [
		'TaskRunner'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #private }
MUDScriptPlugin class >> runner [
	^ TaskRunner ifNil: [ TaskRunner := TKTNewProcessTaskRunner new ]
]

{ #category : #accessing }
MUDScriptPlugin >> addScript: aScript [
	self scripts add: aScript
]

{ #category : #private }
MUDScriptPlugin >> cleanLine: aString [
		| parsed |
	parsed := (MUDANSIParser default 
		parse: aString  
		onError: [ {MUDANSIText new text: aString } ]).
	^ MUDANSITextCleaner visitAll: parsed	
]

{ #category : #private }
MUDScriptPlugin >> evaluateTriggersWith: aString [
	| activeTriggers lines |
	
	activeTriggers := MUDScriptTrigger activeTriggers copy.
	activeTriggers ifEmpty: [ ^ self ].

	lines := aString withSqueakLineEndings lines 
		select: #notEmpty
		thenCollect: [ :each | self cleanLine: each ].
	
	"iterate because new triggers can be added"
	[ activeTriggers notEmpty and: [ lines notEmpty ] ]
	whileTrue: [
		activeTriggers do: [ :each | each evaluateWithAll: lines  ].
		"obtain new triggers and eat first line to allow new triggers to be run"
		activeTriggers := MUDScriptTrigger activeTriggers \ activeTriggers.
		lines := lines allButFirst ].
]

{ #category : #filtering }
MUDScriptPlugin >> filterOn: aTerminal input: aString [
	self flag: #todo. "Find a better way of ignore input (an exception, maybe?). Answer nil is 
	not a solid mechanism."
	(aString notEmpty and: [ aString first = $. ]) ifTrue: [ 
		self runScript: aString allButFirst trimBoth on:aTerminal.
		^ "this will be ignored" nil ].
	^ aString
]

{ #category : #filtering }
MUDScriptPlugin >> filterOn: aTerminal output: aString [
	self class runner 
		schedule: [ self evaluateTriggersWith: aString ].
	^ super filterOn: aTerminal input: aString
]

{ #category : #accessing }
MUDScriptPlugin >> removeScript: aScript [
	self scripts 
		remove: aScript
		ifAbsent: [ "no nothing" ]
]

{ #category : #private }
MUDScriptPlugin >> runScript: aString on: aTerminal [
	| scriptName arguments |
	scriptName := aString copyUpTo: Character space.
	arguments := (aString copyAfter: Character space) substrings: ','.
	(self scriptNamed: scriptName)
		ifNotNil: [ :script | script executeOn: aTerminal arguments: arguments ]
		ifNil: [ 
			MUDAlertDesktop current 
				alertTitle: 'Error!' 
				message: ('Script "{1}" not found.' format: {aString}) ]
]

{ #category : #accessing }
MUDScriptPlugin >> scriptNamed: aString [
	^ self scripts
		detect: [ :each | each name = aString ]
		ifNone: [ nil ]
]

{ #category : #accessing }
MUDScriptPlugin >> scripts [
	^ scripts
]
