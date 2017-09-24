"
I'm an abstract command to server for MSDP protocol. 
I define the proper protocol and build the command. 
Since I'm for querying variables to server, I also override #waitForAnswer.

My children implement the concrete commands to send, by overriding #commandName.
"
Class {
	#name : #MUDServerMSDPQueryCommand,
	#superclass : #MUDServerMSDPCommand,
	#instVars : [
		'variables'
	],
	#category : 'MUDClient-Model-ServerCommand'
}

{ #category : #testing }
MUDServerMSDPQueryCommand >> acceptsProcotolCommand: aCommand [ 
	^ self variables includes: aCommand variable variableName
]

{ #category : #'private protocol' }
MUDServerMSDPQueryCommand >> buildCommand [
	^ MUDMSDPCommandBuilder subcommand: [ :command | 
		command var: self commandName.
		self variables do: [ :each | command put: each ] ]

]

{ #category : #'private protocol' }
MUDServerMSDPQueryCommand >> commandName [
	^ self subclassResponsibility
]

{ #category : #testing }
MUDServerMSDPQueryCommand >> isCompleted [
	^ self value keys includesAll: self variables
]

{ #category : #'private protocol' }
MUDServerMSDPQueryCommand >> processCommand: aCommand [
	self 
		valueAt: aCommand variable variableName 
		put: aCommand variable value.
	self isCompleted ifFalse: [ ^ self ].
	self terminal removeServerCommandReceiver: self.
	answerBlock ifNotNil: [ 
		answerBlock cull: value ]
]

{ #category : #accessing }
MUDServerMSDPQueryCommand >> value: aDictionary [
	value := aDictionary
]

{ #category : #accessing }
MUDServerMSDPQueryCommand >> valueAt: aName put: aValue [
	value ifNil: [ value := SmallDictionary new ].
	value at: aName put: aValue

]

{ #category : #accessing }
MUDServerMSDPQueryCommand >> variables [
	^ variables
]

{ #category : #accessing }
MUDServerMSDPQueryCommand >> variables: anArrayOrString [
	variables := anArrayOrString isString
		ifTrue: [ { anArrayOrString } ]
		ifFalse: [ anArrayOrString ]
]
