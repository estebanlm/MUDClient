Class {
	#name : #LOTJShip,
	#superclass : #Object,
	#instVars : [
		'shipClass',
		'name',
		'owner',
		'planet',
		'dock',
		'dateLocated',
		'notes',
		'records'
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

{ #category : #actions }
LOTJShip >> actionNote [
	<selectionAction: 'Notes'>
	
	(TkMagritteEditor 
		object: self 
		description: self noteDescription asContainer
		title: 'Note')
		go
]

{ #category : #actions }
LOTJShip >> actionRecordHistory [
	<selectionAction: 'Records'>
	
	self records reversed showTitle: self fullName
]

{ #category : #accessing }
LOTJShip >> date [
	^ self lastRecord date
]

{ #category : #accessing }
LOTJShip >> days [
	^ self lastRecord days
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
LOTJShip >> descriptionNumRecords [
	<magritteDescription>
	
	^ MANumberDescription new
		priority: 110;
		label: 'Records';
		accessor: #numRecords;
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
	^ self lastRecord dock
]

{ #category : #accessing }
LOTJShip >> fullName [
	^ String streamContents: [ :stream |
		stream << shipClass << ' ''' << self name << '''' ]
]

{ #category : #testing }
LOTJShip >> hasRecords [
	^ self records notEmpty
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

{ #category : #accessing }
LOTJShip >> lastRecord [
	^ self records last
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

{ #category : #descriptions }
LOTJShip >> noteDescription [
	"<magritteDescription>"
	
	^ MAMemoDescription new
		label: 'Notes';
		accessor: #notes;
		lineCount: 8;
		yourself
]

{ #category : #accessing }
LOTJShip >> notes [
	^ notes
]

{ #category : #accessing }
LOTJShip >> notes: anObject [
	notes := anObject
]

{ #category : #accessing }
LOTJShip >> numRecords [
	^ self records size
]

{ #category : #accessing }
LOTJShip >> owner [
	^ self lastRecord owner
]

{ #category : #parsing }
LOTJShip >> parseLocate: aString [
	| lines record |
	
	lines := aString lines.
	record := LOTJShipRecord new
		date: DateAndTime now;
		owner: (lines second copyAfter: $:) trimBoth;
		planet: (lines fifth copyAfter: $:) trimBoth;
		dock: (lines fourth copyAfter: $:) trimBoth;
		yourself.
	(self hasRecords and: [ self lastRecord isSameAs: record ]) 
		ifFalse: [ self records add: record ]
]

{ #category : #accessing }
LOTJShip >> planet [
	^ self lastRecord planet
]

{ #category : #printing }
LOTJShip >> printOn: stream [ 
	stream << self fullName
]

{ #category : #accessing }
LOTJShip >> records [
	^ records ifNil: [ records := OrderedCollection new ]
]

{ #category : #accessing }
LOTJShip >> shipClass [
	^ shipClass
]

{ #category : #accessing }
LOTJShip >> shipClass: anObject [
	shipClass := anObject
]
