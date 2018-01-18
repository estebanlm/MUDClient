Class {
	#name : #MUDScriptPlugin,
	#superclass : #MUDPlugin,
	#category : #'MUDClient-Script-Model'
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

	lines := aString withSqueakLineEndings lines 
		select: #notEmpty
		thenCollect: [ :each | self cleanLine: each ].
	
	"iterate because new triggers can be added"
	[ activeTriggers isEmpty ]
	whileFalse: [ 
		activeTriggers do: [ :each | each evaluateWithAll: lines  ].
		activeTriggers := MUDScriptTrigger activeTriggers \ activeTriggers ].
]

{ #category : #filtering }
MUDScriptPlugin >> filterOn: aTerminal output: aString [
	self evaluateTriggersWith: aString.
	^ aString
]
