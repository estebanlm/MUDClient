"
I'm a global variable for MUD Client. 
I define a transformation of the input to be sent to the game server as real input. 
Variables are prefixed with a $ .

For example: 
$var1 = 123456

if I send this command: 
look in $var1

server will receive this: 
look in 12345
"
Class {
	#name : #MUDVariable,
	#superclass : #Object,
	#instVars : [
		'name',
		'value',
		'active'
	],
	#category : 'MUDClient-Plugin-Alias'
}

{ #category : #'instance creation' }
MUDVariable class >> name: aName value: aValue [
	^ self new 
		name: aName;
		value: aValue;
		yourself
]

{ #category : #accessing }
MUDVariable >> activate [
	self active: true
]

{ #category : #private }
MUDVariable >> active: aBoolean [
	active := aBoolean
]

{ #category : #accessing }
MUDVariable >> deactivate [
	self active: false
]

{ #category : #descriptions }
MUDVariable >> descriptionActive [
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 30;
		label: 'Active';
		accessor: (MAPluggableAccessor 
			read: [ :alias | alias isActive ]
			write: [ :alias :aValue | self active: aValue ]);
		yourself
]

{ #category : #descriptions }
MUDVariable >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: (MAPluggableAccessor 	
			read: [ :this | this name ifNotNil: [ :v | v allButFirst ] ]
			write: [ :this :aValue | this name: '$', aValue ]);
		beRequired;
		yourself
]

{ #category : #descriptions }
MUDVariable >> descriptionValue [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 20;
		label: 'Value';
		accessor: #value;
		beRequired;
		yourself
]

{ #category : #initialization }
MUDVariable >> initialize [ 
	super initialize.
	self activate
]

{ #category : #testing }
MUDVariable >> isActive [ 
	^ active
]

{ #category : #testing }
MUDVariable >> matches: aString [
	^ (aString endsWith: self name) 
		or: [ (aString includesSubstring: (self name copyWith: Character space) caseSensitive: false) 
		or: [ aString includesSubstring: (self name copyWith: Character cr) caseSensitive: false ] ]
]

{ #category : #accessing }
MUDVariable >> name [
	^ name
]

{ #category : #accessing }
MUDVariable >> name: anObject [
	name := anObject
]

{ #category : #printing }
MUDVariable >> printOn: stream [ 
	stream << self name << '=' << self value
]

{ #category : #accessing }
MUDVariable >> value [
	^ value
]

{ #category : #accessing }
MUDVariable >> value: anObject [
	value := anObject
]
