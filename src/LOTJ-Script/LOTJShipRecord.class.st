Class {
	#name : #LOTJShipRecord,
	#superclass : #Object,
	#instVars : [
		'date',
		'owner',
		'planet',
		'dock'
	],
	#category : #'LOTJ-Script'
}

{ #category : #accessing }
LOTJShipRecord class >> empty [
	^ self new
		date: DateAndTime now;
		yourself
]

{ #category : #accessing }
LOTJShipRecord >> date [
	^ date
]

{ #category : #accessing }
LOTJShipRecord >> date: aDateAndTime [
	date := aDateAndTime
]

{ #category : #accessing }
LOTJShipRecord >> dateAsString [
	^ self date asLocalStringYMDHM
]

{ #category : #accessing }
LOTJShipRecord >> days [
	^ (DateAndTime now - self date) asDays rounded
]

{ #category : #descriptions }
LOTJShipRecord >> descriptionDate [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 1;
		label: 'Locate';
		accessor: #dateAsString;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShipRecord >> descriptionDays [
	<magritteDescription>
	
	^ MANumberDescription new
		priority: 5;
		label: 'Located (days)';
		accessor: #days;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShipRecord >> descriptionDock [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 50;
		label: 'Dock';
		accessor: #dock;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShipRecord >> descriptionOwner [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 30;
		label: 'Owner';
		accessor: #owner;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJShipRecord >> descriptionPlanet [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 40;
		label: 'Planet';
		accessor: #planet;
		beReadonly;
		yourself
]

{ #category : #accessing }
LOTJShipRecord >> dock [
	^ dock
]

{ #category : #accessing }
LOTJShipRecord >> dock: aString [
	dock := aString
]

{ #category : #testing }
LOTJShipRecord >> isSameAs: other [
	^ self owner = other owner 
	and: [ self planet = other planet 
	and: [ self dock = other dock ] ]
]

{ #category : #accessing }
LOTJShipRecord >> owner [
	^ owner
]

{ #category : #accessing }
LOTJShipRecord >> owner: aString [
	owner := aString
]

{ #category : #accessing }
LOTJShipRecord >> planet [ 
	^ planet
]

{ #category : #accessing }
LOTJShipRecord >> planet: aString [
	planet := aString
]
