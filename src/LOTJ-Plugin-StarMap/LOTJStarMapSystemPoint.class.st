"
I represent a known point on space (a system/moon)
"
Class {
	#name : #LOTJStarMapSystemPoint,
	#superclass : #LOTJStarMapPoint,
	#instVars : [
		'system',
		'name'
	],
	#category : 'LOTJ-Plugin-StarMap-Model'
}

{ #category : #converting }
LOTJStarMapSystemPoint >> asMorph [ 
	^ LOTJStarMapSystemMorph point: self
]

{ #category : #descriptions }
LOTJStarMapSystemPoint >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 100;
		label: 'Name';
		accessor: #name;
		beReadonly;
		yourself

]

{ #category : #descriptions }
LOTJStarMapSystemPoint >> descriptionSystem [
	<magritteDescription>
	
	^ MAStringDescription new 
		priority: 110;
		label: 'System';
		accessor: #system;
		beReadonly;
		yourself

]

{ #category : #accessing }
LOTJStarMapSystemPoint >> name [
	^ name
]

{ #category : #accessing }
LOTJStarMapSystemPoint >> name: anObject [
	name := anObject
]

{ #category : #printing }
LOTJStarMapSystemPoint >> printOn: stream [
	stream << self name << ' - ' << (self system ifNil: [ 'Unknown' ]) << ' ' << self sector asString
]

{ #category : #accessing }
LOTJStarMapSystemPoint >> system [
	^ system
]

{ #category : #accessing }
LOTJStarMapSystemPoint >> system: anObject [
	system := anObject
]

{ #category : #accessing }
LOTJStarMapSystemPoint >> type [
	^ 'Place'
]
