"
I'm a matrix definition.
"
Class {
	#name : #MUDPad,
	#superclass : #Object,
	#instVars : [
		'owner',
		'name',
		'modifier',
		'commands',
		'prefix'
	],
	#category : 'MUDClient-Plugin-Buttonpad-Model'
}

{ #category : #accessing }
MUDPad class >> characterBindingAt: index [
	^ self characterBindings at: index
]

{ #category : #accessing }
MUDPad class >> characterBindings [
	^ #($1 $2 $3 $4 $5 $6 $7 $8 $9 $0)
]

{ #category : #defaults }
MUDPad class >> defaultName [
	^ 'Pad'
]

{ #category : #accessing }
MUDPad class >> padSize [
	"commands in a pad"
	^ 10
]

{ #category : #descriptions }
MUDPad >> availableModifiers [
	| mods |
	mods := self owner freeAvailableModifiers.
	^ self hasModifier 	
		ifTrue: [ mods copyWithFirst: self modifier ]
		ifFalse: [ mods ]
]

{ #category : #accessing }
MUDPad >> commandAt: aNumber [
	^ self commands at: aNumber
]

{ #category : #accessing }
MUDPad >> commandAt: aNumber text: aString [ 
	(self commandAt: aNumber) text: aString
]

{ #category : #accessing }
MUDPad >> commands [ 
	^ commands
]

{ #category : #descriptions }
MUDPad >> descriptionContainer [
	^ super descriptionContainer
		tkAcceptIcon: #accept asMUDIcon;
		tkCancelIcon: #cancel asMUDIcon;
		yourself
]

{ #category : #descriptions }
MUDPad >> descriptionModifier [
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 20;
		label: 'Modifier';
		accessor: #modifier;
		reference: (MAStringDescription new 
			accessor: #asString;
			asContainer);
		options: self availableModifiers;
		morphClass: MADropListMorph;
		yourself
]

{ #category : #descriptions }
MUDPad >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #name;
		beRequired;
		yourself
]

{ #category : #descriptions }
MUDPad >> descriptionPrefix [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 30;
		label: 'Prefix';
		accessor: #prefix;
		yourself	
]

{ #category : #testing }
MUDPad >> hasModifier [
	^ self modifier notNil
]

{ #category : #initialization }
MUDPad >> initialize [
	super initialize.
	name := self class defaultName.
	self initializeCommands
]

{ #category : #initialization }
MUDPad >> initializeCommands [
	commands := Array new: self class padSize.
	1 to: self class padSize do: [ :index | 
		commands at: index put: (MUDPadCommand pad: self) ].
	self resetCommandBindings
]

{ #category : #'as yet unclassified' }
MUDPad >> installKeyBindingsOn: category [
	self hasModifier ifFalse: [ ^ self ].
	self commands 
		select: #isDefined
		thenDo: [ :each | 
			category addKeymapEntry: (KMKeymap 
				shortcut: each keyBinding 
				action: [ each executeOn: category owner ] ) ]
]

{ #category : #private }
MUDPad >> keyBindingFor: index [
	^ self modifier 
		ifNotNil: [ self modifier + (self class characterBindingAt: index) ]
]

{ #category : #accessing }
MUDPad >> modifier [ 
	^ modifier
]

{ #category : #accessing }
MUDPad >> modifier: aModifier [ 
	modifier := aModifier.
	self resetCommandBindings
]

{ #category : #accessing }
MUDPad >> name [
	^ name
]

{ #category : #accessing }
MUDPad >> name: anObject [
	name := anObject
]

{ #category : #accessing }
MUDPad >> owner [
	^ owner
]

{ #category : #accessing }
MUDPad >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
MUDPad >> prefix [
	^ prefix
]

{ #category : #accessing }
MUDPad >> prefix: anObject [
	prefix := anObject
]

{ #category : #printing }
MUDPad >> printOn: stream [ 
	stream << self className << $( << self name << $)
]

{ #category : #accessing }
MUDPad >> removeFromOwner [
	self owner remove: self
]

{ #category : #private }
MUDPad >> resetCommandBindings [
	commands withIndexDo: [ :each :index | each keyBinding: (self keyBindingFor: index) ]
]
