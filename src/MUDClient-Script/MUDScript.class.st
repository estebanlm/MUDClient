Class {
	#name : #MUDScript,
	#superclass : #Object,
	#instVars : [
		'id',
		'actionBlock',
		'terminal',
		'pipeTermination'
	],
	#classVars : [
		'ActiveScripts'
	],
	#category : #'MUDClient-Script-Model'
}

{ #category : #'as yet unclassified' }
MUDScript class >> activeScripts [
	^ ActiveScripts ifNil: [ ActiveScripts := Set new ]
]

{ #category : #accessing }
MUDScript class >> addScript: aScript [
	self activeScripts add: aScript
]

{ #category : #accessing }
MUDScript class >> removeScript: aScript [
	self activeScripts remove: aScript
]

{ #category : #initialization }
MUDScript class >> reset [
	MUDScriptTrigger reset.
	MUDScript reset.
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
MUDScript >> do: aBlock [ 
	self action: aBlock.
	self execute
]

{ #category : #execution }
MUDScript >> execute [ 
	"Scripts needs to be executed inside a process to allow 'waits', etc."
	self class addScript: self.
	[ [ self action 
			cull: self
			cull: (MUDScriptUIFacade for: self terminal) ]
			ensure: [ self class removeScript: self ] ] 
	forkNamed: ('MUDScript: ', self id asString)
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
	^ MUDScriptConditionTrigger new
]

{ #category : #'api piping' }
MUDScript >> newPipe [
	^ MUDScriptPipeTrigger new
]

{ #category : #'api input' }
MUDScript >> newWait [
	^ MUDScriptWaitTrigger new 

]

{ #category : #'api input' }
MUDScript >> newWait: aString [
	^ MUDScriptWaitTrigger new 
		until: aString;
		yourself
]

{ #category : #'api piping' }
MUDScript >> pipe: aBlock to: pipeBlock [
	aBlock value.
	MUDScriptPipeTrigger new
		patterns: { self pipeTermination };
		action: pipeBlock;
		activate.	
]

{ #category : #'api piping' }
MUDScript >> pipeSend: aString to: pipeBlock [
	^ self 
		pipe: [ self send: aString ] 
		to: pipeBlock
]

{ #category : #accessing }
MUDScript >> pipeTermination [
	^ pipeTermination
]

{ #category : #accessing }
MUDScript >> pipeTermination: anObject [
	pipeTermination := anObject
]

{ #category : #'api piping' }
MUDScript >> pipeWhen: aString lines: aNumber to: pripeBlock [
	^ self 
		pipeWhenAnyOf: { aString } 
		lines: aNumber 
		to: pripeBlock
]

{ #category : #'api piping' }
MUDScript >> pipeWhenAnyOf: aCollection lines: aNumber to: pipeBlock [
	MUDScriptPipeWhenTrigger new
		patterns: aCollection;
		lines: aNumber;
		action: pipeBlock;
		activate.	
]

{ #category : #'api piping' }
MUDScript >> repeat: aBlock while: whileBlock waiting: aDuration [
	| finish process |
	
	finish := false.
	[ finish ] whileFalse: [  
		aBlock value.
		self 
			pipe: aBlock
			to: [ :out | 
				finish := whileBlock value: out.
				process signal ].
			(process := Processor activeProcess) suspend ]
]

{ #category : #'api piping' }
MUDScript >> repeatSend: aString while: whileBlock waiting: aDuration [
	self 
		repeat: [ self send: aString ] 
		while: whileBlock 
		waiting: aDuration
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

{ #category : #'api input' }
MUDScript >> when: aString do: aBlock [
	self whenAnyOf: { aString } do: aBlock
]

{ #category : #'api input' }
MUDScript >> whenAnyOf: aCollection do: aBlock [
	MUDScriptWaitTrigger new
		patterns: aCollection;
		action: aBlock;
		activate
]

{ #category : #'api plugins' }
MUDScript >> withPlugin: aClass do: aBlock [
	aBlock value: (self terminal game 
		pluginByClass: aClass 
		ifAbsent: [ nil ])
]
