Class {
	#name : #LOTJShip,
	#superclass : #Object,
	#instVars : [
		'shipClass',
		'name',
		'owner',
		'planet',
		'dock'
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

{ #category : #testing }
LOTJShip >> isHopper [ 
	^ self shipClass = 'XT-3 Public Transport'
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
