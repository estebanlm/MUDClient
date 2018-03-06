Class {
	#name : #LOTJCartographerMapArea,
	#superclass : #Object,
	#instVars : [
		'name',
		'startRoom'
	],
	#pools : [
		'LOTJMSDPVariables'
	],
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #descriptions }
LOTJCartographerMapArea >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #name;
		morphClass: TkTextMorph;
		beRequired;
		yourself
]

{ #category : #descriptions }
LOTJCartographerMapArea >> descriptionStartRoom [
	<magritteDescription>
	<presenters: #(inspect view)>
	
	^ MAStringDescription new 
		priority: 20;
		label: 'Start room';
		accessor: #startRoom;
		beReadonly;
		yourself
]

{ #category : #accessing }
LOTJCartographerMapArea >> name [
	^ name
]

{ #category : #accessing }
LOTJCartographerMapArea >> name: anObject [
	name := anObject
]

{ #category : #accessing }
LOTJCartographerMapArea >> rooms [
	| rooms |
	rooms := OrderedCollection new.
	self startRoom withAllLevelRoomsDo: [ :each |
		rooms add: each ].
	^ rooms
]

{ #category : #accessing }
LOTJCartographerMapArea >> startRoom [
	^ startRoom
]

{ #category : #accessing }
LOTJCartographerMapArea >> startRoom: anObject [
	startRoom := anObject
]
