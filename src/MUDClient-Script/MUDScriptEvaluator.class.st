"
I'm a generic evaluator for scripts. 

I will start a process to handle an evaluation. 

Since a script can be source code or a chunk of code, my children will manage specific accessing ways. 
"
Class {
	#name : #MUDScriptEvaluator,
	#superclass : #Object,
	#instVars : [
		'id',
		'process',
		'terminal',
		'script',
		'bindingsForExecution',
		'arguments'
	],
	#classVars : [
		'ActiveScripts'
	],
	#classInstVars : [
		'announcer'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScriptEvaluator class >> activeScripts [
	^ ActiveScripts ifNil: [ ActiveScripts := Set new ]
]

{ #category : #accessing }
MUDScriptEvaluator class >> addScript: aScript [
	self activeScripts add: aScript.
	MUDScriptEvaluator announcer announce: MUDScriptAdded
]

{ #category : #accessing }
MUDScriptEvaluator class >> announcer [
	 ^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #'instance creation' }
MUDScriptEvaluator class >> new [
	self error: 'Use #for:'
]

{ #category : #accessing }
MUDScriptEvaluator class >> removeScript: aScript [
	MUDScriptTrigger removeTriggersForScript: aScript.
	self activeScripts remove: aScript ifAbsent: [].
	MUDScriptEvaluator announcer announce: MUDScriptRemoved
]

{ #category : #accessing }
MUDScriptEvaluator class >> reset [
	self activeScripts copy 
		do: [ :each | 
			each destroy.
			self removeScript: each ]
]

{ #category : #'instance creation' }
MUDScriptEvaluator class >> script: aScript terminal: aTerminal [
	^ self basicNew 
		initializeScript: aScript terminal: aTerminal;
		yourself
]

{ #category : #private }
MUDScriptEvaluator >> actionWithArguments: anArray [
	self subclassResponsibility
]

{ #category : #accessing }
MUDScriptEvaluator >> arguments [
	^ arguments ifNil: [ #() ]
]

{ #category : #execution }
MUDScriptEvaluator >> arguments: anArray [
	arguments := anArray
]

{ #category : #execution }
MUDScriptEvaluator >> basicExecute [
	| bindings |
	self class addScript: self.
	[ 
		bindings := self bindingsForExecution.
		(self actionWithArguments: (bindings collect: #key)) valueWithEnoughArguments: (bindings collect: #value) ]
	ensure: [ 
		self class removeScript: self ]
]

{ #category : #accessing }
MUDScriptEvaluator >> bindingsForExecution [
	^ bindingsForExecution ifNil: [ 
		bindingsForExecution := self createBindingsForExecution ]
]

{ #category : #'process operations' }
MUDScriptEvaluator >> continue [
	process continue
]

{ #category : #private }
MUDScriptEvaluator >> createBindingsForExecution [
	^ { 
	#terminal -> (MUDScriptTerminalFacade script: self terminal evaluator: self).
	#ui -> (MUDScriptUIFacade script: self terminal evaluator: self).
	#vars -> self script variables.
	#args -> self arguments }
]

{ #category : #accessing }
MUDScriptEvaluator >> destroy [
	process ifNotNil: #terminate
]

{ #category : #execution }
MUDScriptEvaluator >> execute [
	"Scripts needs to be executed inside a process to allow 'waits', etc."
	[ 
		process := MUDScriptProcess new.
		self basicExecute ] 
	forkNamed: ('MUDScript: ', self id asString)
]

{ #category : #accessing }
MUDScriptEvaluator >> id [
	^ id ifNil: [ id := UUID new ]
]

{ #category : #initialization }
MUDScriptEvaluator >> initializeScript: aScript terminal: aTerminal [
	script := aScript.
	terminal := aTerminal.
	self initialize
]

{ #category : #accessing }
MUDScriptEvaluator >> script [
	^ script
]

{ #category : #accessing }
MUDScriptEvaluator >> scriptName [
	^ self script name
]

{ #category : #'process operations' }
MUDScriptEvaluator >> stop [
	process stop
]

{ #category : #accessing }
MUDScriptEvaluator >> terminal [
	^ terminal
]
