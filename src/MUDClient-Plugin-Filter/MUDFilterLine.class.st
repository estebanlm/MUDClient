"
I represent a single line to be process in the filter.
Lines can be treated differently for each filter applied and sometimes this function overlaps to others. 
We add cetain stat (eg ""echoed"") to know if this has been done.
"
Class {
	#name : #MUDFilterLine,
	#superclass : #Object,
	#instVars : [
		'line',
		'echoed',
		'lineWithoutLineEnding',
		'cleanLine'
	],
	#category : #'MUDClient-Plugin-Filter-Model'
}

{ #category : #'instance creation' }
MUDFilterLine class >> for: aString [
	^ self basicNew initializeLine: aString
]

{ #category : #'instance creation' }
MUDFilterLine class >> new [ 
	self error: 'Use #for:'
]

{ #category : #accessing }
MUDFilterLine >> cleanLine [
	^ cleanLine ifNil: [ cleanLine := self parseCleanLine ]

]

{ #category : #accessing }
MUDFilterLine >> echoed [
	echoed := true.
]

{ #category : #initialization }
MUDFilterLine >> initialize [
	super initialize.
	echoed := false.
]

{ #category : #initialization }
MUDFilterLine >> initializeLine: aString [
	line := aString.
	self initialize
]

{ #category : #testing }
MUDFilterLine >> isEchoed [
	"Answer if line has already been sent to main stream"
	^ echoed
]

{ #category : #accessing }
MUDFilterLine >> line [
	^ line
]

{ #category : #accessing }
MUDFilterLine >> lineWithDecoration [
	^ DateAndTime now asStringYMDHM, ': ', self lineWithoutLineEnding 
]

{ #category : #accessing }
MUDFilterLine >> lineWithoutLineEnding [
	^ lineWithoutLineEnding ifNil: [ lineWithoutLineEnding := self line trimRight ]
]

{ #category : #private }
MUDFilterLine >> parseCleanLine [
	| parsed |
	parsed := (MUDANSIParser default 
		parse: self lineWithoutLineEnding  
		onError: [ {MUDANSIText new text: self lineWithoutLineEnding } ]).
	^ MUDANSITextCleaner visitAll: parsed
]
