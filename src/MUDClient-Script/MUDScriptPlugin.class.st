Class {
	#name : #MUDScriptPlugin,
	#superclass : #MUDPlugin,
	#category : #'MUDClient-Script'
}

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
	
	activeTriggers := MUDScriptTrigger activeTriggers.
	activeTriggers ifEmpty: [ ^ self ].
	
	lines := aString lines collect: [ :each | self cleanLine: each ].
	activeTriggers do: [ :each | 
		each evaluateWithAll: lines ]
	
]

{ #category : #filtering }
MUDScriptPlugin >> filterOn: aTerminal output: aString [
	self evaluateTriggersWith: aString.
	^ aString
]
