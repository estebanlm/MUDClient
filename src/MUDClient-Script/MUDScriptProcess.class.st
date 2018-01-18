Class {
	#name : #MUDScriptProcess,
	#superclass : #Object,
	#instVars : [
		'process',
		'count'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptProcess >> continue [
	count := count - 1.
	count = 0 ifTrue: [ process resume ]
	
]

{ #category : #initialization }
MUDScriptProcess >> initialize [
	super initialize.
	process := Processor activeProcess.
	count := 0
]

{ #category : #accessing }
MUDScriptProcess >> stop [ 
	count := count + 1.
	process suspend
	
]

{ #category : #'as yet unclassified' }
MUDScriptProcess >> terminate [
	process terminate
]
