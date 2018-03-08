Class {
	#name : #LOTJCartographerRoomMarker,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classVars : [
		'Colors'
	],
	#pools : [
		'LOTJMSDPVariables'
	],
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #'as yet unclassified' }
LOTJCartographerRoomMarker class >> availableColors [
	^ Colors ifNil: [ Colors := Color redColors ]
]

{ #category : #descriptions }
LOTJCartographerRoomMarker >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #name;
		morphClass: TkTextMorph;
		yourself
]

{ #category : #accessing }
LOTJCartographerRoomMarker >> name [
	^ name
]

{ #category : #accessing }
LOTJCartographerRoomMarker >> name: anObject [
	name := anObject
]
