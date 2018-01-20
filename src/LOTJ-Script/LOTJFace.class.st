Class {
	#name : #LOTJFace,
	#superclass : #Object,
	#instVars : [
		'name',
		'days'
	],
	#category : #'LOTJ-Script'
}

{ #category : #'as yet unclassified' }
LOTJFace class >> name: aString days: aNumber [
	^ self new 
		name: aString;
		days: aNumber;
		yourself
]

{ #category : #accessing }
LOTJFace >> days [
	^ days
]

{ #category : #accessing }
LOTJFace >> days: anObject [
	days := anObject
]

{ #category : #descriptions }
LOTJFace >> descriptionDays [
	<magritteDescription>
	
	^ MANumberDescription new
		priority: 20;
		label: 'Days';
		accessor: #days;
		beReadonly;
		yourself
]

{ #category : #descriptions }
LOTJFace >> descriptionName [
	<magritteDescription>
	
	^ MAStringDescription new
		priority: 10;
		label: 'Name';
		accessor: #name;
		beReadonly;
		yourself
]

{ #category : #accessing }
LOTJFace >> name [
	^ name
]

{ #category : #accessing }
LOTJFace >> name: anObject [
	name := anObject
]

{ #category : #printing }
LOTJFace >> printOn: stream [ 
	stream << self name << ' (' << self days asString << ')'
]
