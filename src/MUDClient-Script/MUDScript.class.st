Class {
	#name : #MUDScript,
	#superclass : #Object,
	#instVars : [
		'id',
		'actionBlock',
		'terminal',
		'pipeTermination',
		'process'
	],
	#classVars : [
		'ActiveScripts'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #accessing }
MUDScript class >> activeScripts [
	^ ActiveScripts ifNil: [ ActiveScripts := Set new ]
]

{ #category : #accessing }
MUDScript class >> addScript: aScript [
	self activeScripts add: aScript
]

{ #category : #accessing }
MUDScript class >> removeScript: aScript [
	MUDScriptTrigger removeTriggersForScript: aScript.
	self activeScripts remove: aScript ifAbsent: []
]

{ #category : #initialization }
MUDScript class >> reset [
	<script>
	self activeScripts copy 
		do: [ :each | 
			each destroy.
			self removeScript: each ].
	
	
]

{ #category : #'instance creation' }
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
MUDScript >> basicExecute [
	[ 
		self action 
			cull: self
			cull: (MUDScriptUIFacade for: self terminal) ]
	ensure: [ 
		self class removeScript: self ]
]

{ #category : #accessing }
MUDScript >> destroy [
	process ifNotNil: #terminate
]

{ #category : #execution }
MUDScript >> do: aBlock [ 
	self action: aBlock.
	self execute
]

{ #category : #execution }
MUDScript >> execute [ 
	"Scripts needs to be executed inside a process to allow 'waits', etc."
	self class addScript: self.
	process := [ self basicExecute ] forkNamed: ('MUDScript: ', self id asString)
]

{ #category : #accessing }
MUDScript >> id [
	^ id ifNil: [ id := UUID new ]
]

{ #category : #accessing }
MUDScript >> id: anObject [
	id := anObject
]

{ #category : #'api input' }
MUDScript >> newCondition [
	^ MUDScriptConditionTrigger on: self
]

{ #category : #'api piping' }
MUDScript >> newPipe [
	^ MUDScriptPipeTrigger on: self
]

{ #category : #'api input' }
MUDScript >> newWait [
	^ MUDScriptWaitTrigger on: self
]

{ #category : #'api input' }
MUDScript >> newWait: aString [
	^ self newWait
		until: aString;
		yourself
]

{ #category : #accessing }
MUDScript >> pipeTermination [
	^ pipeTermination
]

{ #category : #accessing }
MUDScript >> pipeTermination: anObject [
	pipeTermination := anObject
]

{ #category : #'private accessing' }
MUDScript >> process [
	^ process
]

{ #category : #'api transmit' }
MUDScript >> send: aString [
	^ self terminal sendFilteringInput: aString
]

{ #category : #accessing }
MUDScript >> terminal [
	^ terminal
]

{ #category : #accessing }
MUDScript >> terminal: aTerminal [
	terminal := aTerminal
]

{ #category : #'api plugins' }
MUDScript >> withPlugin: aClass do: aBlock [
	aBlock value: (self terminal game 
		pluginByClass: aClass 
		ifAbsent: [ nil ])
]
