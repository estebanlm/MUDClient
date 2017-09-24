"
I'm an alias for MUD Client. 
I define a transformation of the input to be sent to the game server as real input. 
I accept wildcards... my input can be: 

myalias :* 
myalias :arg1 to :arg2

and it can be mapped to: 

real-command :*
or 
real-command1 :arg1
real-command2 :arg1 to: arg2
"
Class {
	#name : #MUDAlias,
	#superclass : #Object,
	#instVars : [
		'input',
		'output',
		'active',
		'command'
	],
	#classVars : [
		'CommandLineDefinitionParser',
		'CommandLineParser'
	],
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #accessing }
MUDAlias class >> commandLineDefinitionParser [ 
	^ CommandLineDefinitionParser ifNil: [ 
		CommandLineDefinitionParser := MUDAliasCommandLineDefinitionParser new ]
		
]

{ #category : #accessing }
MUDAlias class >> commandLineParser [ 
	^ CommandLineParser ifNil: [ CommandLineParser := MUDAliasCommandLineParser new ]
		
]

{ #category : #accessing }
MUDAlias class >> parseCommand: aString [ 
	^ self commandLineDefinitionParser 
		parse: aString 
		onError: [ :e | 
			e emitLogError.
			MUDAliasCommand keywords: { MUDAliasCommandKeyword value: aString } ]
]

{ #category : #accessing }
MUDAlias class >> stonAllInstVarNames [
	^ super stonAllInstVarNames copyWithout: #command
]

{ #category : #'instance creation' }
MUDAlias class >> whenCommand: inputString send: outputString [
	^ self new whenCommand: inputString send: outputString
]

{ #category : #accessing }
MUDAlias >> activate [
	self active: true
]

{ #category : #private }
MUDAlias >> active: aBoolean [
	active := aBoolean
]

{ #category : #private }
MUDAlias >> command [ 
	^ command ifNil: [ self class parseCommand: self input ]
]

{ #category : #accessing }
MUDAlias >> deactivate [
	self active: false
]

{ #category : #descriptions }
MUDAlias >> descriptionActive [
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 30;
		label: 'Active';
		accessor: (MAPluggableAccessor 
			read: [ :alias | alias isActive ]
			write: [ :alias :value | self active: value ]);
		yourself
]

{ #category : #descriptions }
MUDAlias >> descriptionInput [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Input';
		accessor: #input;
		beRequired;
		yourself
]

{ #category : #descriptions }
MUDAlias >> descriptionOutput [
	<magritteDescription>
	
	^ MAMemoDescription new 
		priority: 20;
		label: 'Output';
		accessor: #output;
		lineCount: 8;
		beRequired;
		yourself
]

{ #category : #initialization }
MUDAlias >> initialize [ 
	super initialize.
	self activate
]

{ #category : #accessing }
MUDAlias >> input [
	^ input
]

{ #category : #private }
MUDAlias >> input: anObject [
	input := anObject.
	command := nil
]

{ #category : #testing }
MUDAlias >> isActive [ 
	^ active
]

{ #category : #testing }
MUDAlias >> matches: aString [
	| stripString |
	stripString := aString trimBoth copyUpTo: Character space.
	^ (self input compare: stripString caseSensitive: false) = 2
]

{ #category : #accessing }
MUDAlias >> name [ 
	self input ifNil: [ ^ '<undefined alias>' ].
	^ self input copyUpTo: Character space
]

{ #category : #accessing }
MUDAlias >> output [
	^ output
]

{ #category : #private }
MUDAlias >> output: anObject [
	output := anObject
]

{ #category : #accessing }
MUDAlias >> whenCommand: inputString send: outputString [
	self input: inputString.
	self output: outputString
]
