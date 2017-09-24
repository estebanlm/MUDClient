"
I'm a plugin to handle aliases. 
I can translate a defined input into a sequeance of commands. I accept also variables definitons.

Some examples of I what I can do:

alias1 -> trigger1 
alias2 -> trigger1 trigger2 trigger3

$var1=something
alias3 -> trigger1 $var

At the moment I cannot handle parameters, but that will change soon :)
"
Class {
	#name : #MUDAliasPlugin,
	#superclass : #MUDPlugin,
	#instVars : [
		'aliases',
		'variables'
	],
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #accessing }
MUDAliasPlugin >> activeAliases [
	^ self aliases select: #isActive
]

{ #category : #accessing }
MUDAliasPlugin >> activeVariables [
	^ self variables select: #isActive
]

{ #category : #accessing }
MUDAliasPlugin >> addAlias: anAlias [
	self aliases add: anAlias
]

{ #category : #accessing }
MUDAliasPlugin >> addVariable: aVariable [
	self variables add: aVariable
]

{ #category : #accessing }
MUDAliasPlugin >> aliases [ 
	^ aliases
]

{ #category : #private }
MUDAliasPlugin >> filterAliases: aString [
	^ self activeAliases
		detect: [ :each | each matches: aString ] 
		ifFound: [ :each | each output ]
		ifNone: [ aString ]
]

{ #category : #filtering }
MUDAliasPlugin >> filterOn: aTerminal input: aString [
	| filteredString |
	
	"First we filter variables (in case there are), then we go for complex aliases"
	filteredString := self filterVariables: aString.
	"Then filter aliases to obtain expanded command"
	filteredString := self filterAliases: filteredString.
	"And re-pass variables in case I put some in the alias."
	filteredString := self filterVariables: filteredString.
		
	^ filteredString
]

{ #category : #private }
MUDAliasPlugin >> filterVariables: aString [
	| activeVariables |
	
	(aString includes: $$) ifFalse: [ ^ aString ]. 
	(activeVariables := self activeVariables) ifEmpty: [ ^ aString ].
	^ activeVariables
		detect: [ :each | each matches: aString ] 
		ifFound: [ :each | aString copyReplaceAll: each name with: each value ]
		ifNone: [ aString ]
]

{ #category : #testing }
MUDAliasPlugin >> hasAliases [
	^ self aliases notEmpty
]

{ #category : #initialization }
MUDAliasPlugin >> initialize [ 
	super initialize.
	aliases := Set new.
	variables := Set new.
]

{ #category : #testing }
MUDAliasPlugin >> isActiveOn: aTerminal [ 
	"Process alias just have sense is there are active alias"
	^ self activeAliases notEmpty or: [ self activeVariables notEmpty ]
]

{ #category : #accessing }
MUDAliasPlugin >> removeAlias: anAlias [
	self aliases remove: anAlias
]

{ #category : #accessing }
MUDAliasPlugin >> removeVariable: aVariable [
	self variables remove: aVariable
]

{ #category : #accessing }
MUDAliasPlugin >> variables [
	^ variables
]
