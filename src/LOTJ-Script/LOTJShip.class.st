Class {
	#name : #LOTJShip,
	#superclass : #Object,
	#instVars : [
		'shipClass',
		'name',
		'owner',
		'planet',
		'dock',
		'dateLocated'
	],
	#category : #'LOTJ-Script'
}

{ #category : #'instance creation' }
LOTJShip class >> shipClass: aShipClass name: aName [
	^ self new 
		shipClass: aShipClass; 
		name: aName;
		yourself
]

{ #category : #comparing }
LOTJShip >> = other [
	^ self species = other species 
		and: [ self shipClass = other shipClass 
		and: [ self name = other name ] ]
]

{ #category : #accessing }
LOTJShip >> dateLocated [
	^ dateLocated
]

{ #category : #accessing }
LOTJShip >> dateLocated: anObject [
	dateLocated := anObject
]

{ #category : #accessing }
LOTJShip >> days [
	^ (DateAndTime now - self dateLocated) asDays rounded
]

{ #category : #descriptions }
LOTJShip >> descriptionDays [
	<magritteDescription>
	
	^ MANumberDescription new
		priority: 100;
		label: 'Located (days)';
		accessor: #days;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShip >> descriptionDock [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 50;
		label: 'Dock';
		accessor: #dock;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShip >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 20;
		label: 'Name';
		accessor: #name;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShip >> descriptionOwner [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 30;
		label: 'Owner';
		accessor: #owner;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShip >> descriptionPlanet [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 40;
		label: 'Planet';
		accessor: #planet;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShip >> descriptionShipClass [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 10;
		label: 'Class';
		accessor: #shipClass;
		beReadonly;
		yourself
]

{ #category : #accessing }
LOTJShip >> dock [
	^ dock
]

{ #category : #accessing }
LOTJShip >> dock: anObject [
	dock := anObject
]

{ #category : #accessing }
LOTJShip >> fullName [
	^ String streamContents: [ :stream |
		stream << shipClass << ' ''' << self name << '''' ]
]

{ #category : #comparing }
LOTJShip >> hash [
	^ (self className hash 
		bitXor: self shipClass hash)
		bitXor: self name hash
]

{ #category : #testing }
LOTJShip >> isHopper [ 
	^ self shipClass = 'XT-3 Public Transport'
]

{ #category : #testing }
LOTJShip >> matches: aString [
	| regex |
	regex := aString asRegexIgnoringCase.
	^ { 
		self name. 
		self shipClass. 
		self owner.
		self planet. 
		self dock } 
		anySatisfy: [ :each | 
			[ regex matches: each ] 
			on: Error do: [ false ] ]
]

{ #category : #accessing }
LOTJShip >> name [
	^ name
]

{ #category : #accessing }
LOTJShip >> name: anObject [
	name := anObject
]

{ #category : #accessing }
LOTJShip >> owner [
	^ owner
]

{ #category : #accessing }
LOTJShip >> owner: anObject [
	owner := anObject
]

{ #category : #parsing }
LOTJShip >> parseLocate: aString [
	| lines |
	
	lines := aString lines.
	self dateLocated: DateAndTime now.
	self owner: (lines second copyAfter: $:) trimBoth.
	self planet: (lines fifth copyAfter: $:) trimBoth.
	self dock: (lines fourth copyAfter: $:) trimBoth
]

{ #category : #accessing }
LOTJShip >> planet [
	^ planet
]

{ #category : #accessing }
LOTJShip >> planet: anObject [
	planet := anObject
]

{ #category : #printing }
LOTJShip >> printOn: stream [ 
	stream << self fullName
]

{ #category : #accessing }
LOTJShip >> shipClass [
	^ shipClass
]

{ #category : #accessing }
LOTJShip >> shipClass: anObject [
	shipClass := anObject
]
