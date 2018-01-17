Class {
	#name : #LOTJShip,
	#superclass : #Object,
	#instVars : [
		'shipClass',
		'name'
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
