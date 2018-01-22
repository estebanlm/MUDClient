"
I'm a script.

I can be executed. 
I can also be used to execute chunks of source.
"
Class {
	#name : #MUDScript,
	#superclass : #Object,
	#instVars : [
		'name',
		'contents',
		'variables'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #'instance creation' }
MUDScript class >> named: aString [
	^ self new name: aString
]

{ #category : #initialization }
MUDScript class >> reset [
	<script>
	MUDScriptEvaluator reset
]

{ #category : #accessing }
MUDScript >> contents [
	^ contents ifNil: [ contents := '' ]
]

{ #category : #accessing }
MUDScript >> contents: anObject [
	contents := anObject
]

{ #category : #execution }
MUDScript >> execute: aBlock on: aTerminal [
	(self newActionEvaluatorOn: aTerminal)
		action: aBlock;
		execute
]

{ #category : #execution }
MUDScript >> executeOn: aTerminal [
	^ (self newEvaluatorOn: aTerminal) execute
]

{ #category : #initialization }
MUDScript >> initialize [
	super initialize
]

{ #category : #accessing }
MUDScript >> name [
	^ name
]

{ #category : #accessing }
MUDScript >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MUDScript >> newActionEvaluatorOn: aTerminal [
	^ MUDScriptActionEvaluator script: self terminal: aTerminal
]

{ #category : #accessing }
MUDScript >> newEvaluatorOn: aTerminal [
	^ MUDScriptSourceEvaluator script: self terminal: aTerminal
]

{ #category : #accessing }
MUDScript >> variables [
	^ variables ifNil: [ variables := Dictionary new ]
]
