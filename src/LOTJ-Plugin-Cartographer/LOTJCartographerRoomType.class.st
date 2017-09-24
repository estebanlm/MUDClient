Class {
	#name : #LOTJCartographerRoomType,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #accessing }
LOTJCartographerRoomType class >> allTypes [
	^ self subclasses collect: #uniqueInstance
]

{ #category : #accessing }
LOTJCartographerRoomType class >> default [
	^ LOTJCartographerTypeNone uniqueInstance 
]

{ #category : #'instance creation' }
LOTJCartographerRoomType class >> fromSton: stonReader [
	^ self uniqueInstance
		fromSton: stonReader;
		yourself	
]

{ #category : #'instance creation' }
LOTJCartographerRoomType class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
LOTJCartographerRoomType class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #accessing }
LOTJCartographerRoomType >> asciiId [
	^ self subclassResponsibility
]

{ #category : #accessing }
LOTJCartographerRoomType >> color [
	^ Color white
]

{ #category : #descriptions }
LOTJCartographerRoomType >> descriptionLabel [
	<magritteDescription>

	^ MAStringDescription new 
		priority: 10;
		accessor: #label;
		beReadonly;
		yourself
]

{ #category : #hooks }
LOTJCartographerRoomType >> fuelAccept: aGeneralMapper [
	^ aGeneralMapper 
		visitGlobalSend: self 
		name: self className 
		selector: #uniqueInstance
]

{ #category : #testing }
LOTJCartographerRoomType >> isNone [
	^ false
]

{ #category : #testing }
LOTJCartographerRoomType >> isTerminal [
	"indicate wether the room is a 'terminal': map should end here."
	^ false
]

{ #category : #accessing }
LOTJCartographerRoomType >> label [
	^ self subclassResponsibility
]
