Class {
	#name : #LOTJCartographerRoomMark,
	#superclass : #Object,
	#instVars : [
		'note'
	],
	#pools : [
		'LOTJMSDPVariables'
	],
	#category : #'LOTJ-Plugin-Cartographer-Model'
}

{ #category : #descriptions }
LOTJCartographerRoomMark >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #note;
		morphClass: TkTextMorph;
		yourself
]

{ #category : #accessing }
LOTJCartographerRoomMark >> note [
	^ note
]

{ #category : #accessing }
LOTJCartographerRoomMark >> note: anObject [
	note := anObject
]
