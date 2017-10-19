"
I define a filter for MUD output. 
Ideally, this will be used to filter out OOC .
"
Class {
	#name : #MUDFilter,
	#superclass : #Object,
	#instVars : [
		'name',
		'patterns',
		'active',
		'soundName'
	],
	#classVars : [
		'Sounds'
	],
	#category : 'MUDClient-Plugin-Filter-Model'
}

{ #category : #private }
MUDFilter class >> availableSoundsWithLabels [
	^ Sounds ifNil: [ Sounds := self loadSoundsWithLabels ]
]

{ #category : #private }
MUDFilter class >> bass1 [
	"self bass1 play"
	"(FMSound lowMajorScaleOn: FMSound bass1) play"

	| sound |
	sound := FMSound new modulation: 0 ratio: 0.
	sound addEnvelope: (VolumeEnvelope exponentialDecay: 0.95).
	^ sound setPitch: 220 duration: 0.1 loudness: 0.2

]

{ #category : #private }
MUDFilter class >> flute1 [
	"self flute1 play"
	"(FMSound majorScaleOn: FMSound flute1) play"

	| sound  |
	sound := FMSound new.
	sound addEnvelope: (VolumeEnvelope points: {0@0 . 20@1.0 . 100@1.0 . 120@0.0} loopStart: 2 loopEnd: 3).
	^ sound setPitch: 220.0 duration: 0.1 loudness: 0.2

]

{ #category : #private }
MUDFilter class >> flute2 [
	"self flute2 play"
	"(FMSound majorScaleOn: FMSound flute1) play"

	| sound  |
	sound := FMSound new.
	sound addEnvelope: (VolumeEnvelope points: {0@0 . 20@1.0 . 100@1.0 . 120@0.0} loopStart: 2 loopEnd: 3).
	^ sound setPitch: 330.0 duration: 0.1 loudness: 0.2

]

{ #category : #private }
MUDFilter class >> flute3 [
	"self flute3 play"
	"(FMSound majorScaleOn: FMSound flute1) play"

	| sound  |
	sound := FMSound new.
	sound addEnvelope: (VolumeEnvelope points: {0@0 . 20@1.0 . 100@1.0 . 120@0.0} loopStart: 2 loopEnd: 3).
	^ sound setPitch: 440.0 duration: 0.1 loudness: 0.2

]

{ #category : #accessing }
MUDFilter class >> label [
	^ self subclassResponsibility
]

{ #category : #private }
MUDFilter class >> loadSoundsWithLabels [
	^ OrderedDictionary newFromPairs: { 
		'Bass'. self bass1.
		'Flute 1'. self flute1.
		'Flute 2'. self flute2.
		'Flute 3'. self flute3 }
]

{ #category : #private }
MUDFilter class >> soundNamed: aString [
	^ self availableSoundsWithLabels at: aString
]

{ #category : #accessing }
MUDFilter >> activate [
	active := true
]

{ #category : #private }
MUDFilter >> active: aBoolean [
	active := aBoolean
]

{ #category : #accessing }
MUDFilter >> addPattern: aFilterPattern [ 
	aFilterPattern filter: self.
	self patterns add: aFilterPattern
]

{ #category : #private }
MUDFilter >> applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine in: aTerminal [  
	^ self subclassResponsibility
]

{ #category : #accessing }
MUDFilter >> deactivate [
	self active: false
]

{ #category : #descriptions }
MUDFilter >> descriptionActive [
	<magritteDescription>
	
	^ MABooleanDescription new 
		priority: 1000;
		label: 'Active';
		accessor: (MAPluggableAccessor 
			read: [ :filter | filter isActive ]
			write: [ :filter :value | filter active: value ]);
		yourself
]

{ #category : #descriptions }
MUDFilter >> descriptionContainer [
	^ super descriptionContainer
		tkAcceptIcon: #accept asMUDIcon;
		tkCancelIcon: #cancel asMUDIcon;
		yourself
]

{ #category : #descriptions }
MUDFilter >> descriptionName [
	<magritteDescription>

	^ MAStringDescription new 
		priority: 10;
		label: 'Name';
		accessor: #name;
		beRequired;
		yourself	
]

{ #category : #descriptions }
MUDFilter >> descriptionPatterns [
	<magritteDescription>
	
	^ MAToManyRelationDescription new
		priority: 20;
		label: 'Patterns';
		classes: { MUDFilterPattern };
		reference: MUDFilterPattern basicNew descriptionPattern asContainer;
		accessor: #patterns;
		display: [ :v | v pattern truncateWithElipsisTo: 28 ];
		default: OrderedCollection new;
		morphClass: TkOneToManyFastListMorph;
		tkRowsToShow: 5;
		tkAddIcon: #add asMUDIcon;
		tkEditIcon: #edit asMUDIcon;
		tkRemoveIcon: #delete asMUDIcon;
		yourself
]

{ #category : #descriptions }
MUDFilter >> descriptionSound [
	<magritteDescription>

	^ MASingleOptionDescription new
		priority: 900;
		label: 'Sound';
		accessor: #soundName;
		options: self class availableSoundsWithLabels keys;
		morphClass: MADropListMorph;
		yourself
]

{ #category : #testing }
MUDFilter >> hasSound [
	^ self soundName notNil
]

{ #category : #initialization }
MUDFilter >> initialize [ 
	super initialize.
	alert := false.
	alertColor := Color veryLightGray.
	patterns := OrderedCollection new.
	self activate
]

{ #category : #testing }
MUDFilter >> isActive [ 
	^ active and: [ self patterns notEmpty ]
]

{ #category : #testing }
MUDFilter >> isAlert [
	^ false
]

{ #category : #testing }
MUDFilter >> isRedirect [
	^ false
]

{ #category : #testing }
MUDFilter >> isTrigger [
	^ false
]

{ #category : #testing }
MUDFilter >> matches: aString [ 
	^ self patterns anySatisfy: [ :each | each matches: aString ]
]

{ #category : #accessing }
MUDFilter >> name [ 
	^ name
]

{ #category : #accessing }
MUDFilter >> name: aString [
	name := aString
]

{ #category : #accessing }
MUDFilter >> patternMatching: aString [
	^ self patternMatching: aString ifNone: [ nil ]
]

{ #category : #accessing }
MUDFilter >> patternMatching: aString ifNone: aBlock [
	^ self patterns 
		detect: [ :each | each matches: aString ]
		ifNone: aBlock
]

{ #category : #accessing }
MUDFilter >> patterns [
	^ patterns
]

{ #category : #private }
MUDFilter >> patterns: aCollection [ 
	patterns := aCollection.
	patterns do: [ :each | each filter: self ]
]

{ #category : #accessing }
MUDFilter >> playSound [
	self hasSound ifFalse: [ ^ self ].
	(self class soundNamed: self soundName) play
]

{ #category : #printing }
MUDFilter >> printOn: stream [ 
	super printOn: stream.
	stream << $( << (self name ifNil: [ 'Noname' ]) << $)
]

{ #category : #accessing }
MUDFilter >> send: aString toWindows: aCollection [ 
	aCollection do: [ :w | w send: aString ]
]

{ #category : #accessing }
MUDFilter >> soundName [
	^ soundName
]

{ #category : #accessing }
MUDFilter >> soundName: anObject [
	soundName := anObject
]
