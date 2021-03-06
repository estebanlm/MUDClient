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

{ #category : #accessing }
MUDScript class >> activeEvaluators [
	^ MUDScriptEvaluator activeEvaluators
]

{ #category : #accessing }
MUDScript class >> activeScripts [
	^ self activeEvaluators collect: #script
]

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

{ #category : #accessing }
MUDScript >> destroyAllRunning [
	self class activeEvaluators copy 
		select: [ :each | each script = self ]
		thenDo: [ :each | 
			each destroy.
			each removeFromActiveList ]
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

{ #category : #execution }
MUDScript >> executeOn: aTerminal arguments: anArray [
	(self newEvaluatorOn: aTerminal) 
		arguments: anArray;
		execute
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

{ #category : #printing }
MUDScript >> printOn: stream [
	stream << self name ifNil: [ 'noname' ]
]

{ #category : #'api accessing' }
MUDScript >> varAt: aString [ 
	^ self varAt: aString ifAbsent: [ nil ]
]

{ #category : #'api accessing' }
MUDScript >> varAt: aString ifAbsent: aBlock [ 
	^ self variables 
		at: aString
		ifAbsent: aBlock
]

{ #category : #accessing }
MUDScript >> variables [
	^ variables ifNil: [ variables := Dictionary new ]
]
