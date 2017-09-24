"
I'm a session logger. 
I write to disk everything I receive in the terminal. 
"
Class {
	#name : #MUDSessionLog,
	#superclass : #Object,
	#instVars : [
		'game',
		'logReference'
	],
	#category : 'MUDClient-Utils'
}

{ #category : #accessing }
MUDSessionLog class >> baseDirectory [
	^ 'log' asFileReference
]

{ #category : #'instance creation' }
MUDSessionLog class >> game: aGame [
	^ self basicNew 
		initializeGame: aGame;
		yourself
]

{ #category : #'instance creation' }
MUDSessionLog class >> new [ 
	self error: 'Use #game:'
]

{ #category : #private }
MUDSessionLog >> createFileName [
	| date |
	date := DateAndTime now.
	^ 'log-{1}-{2}-{3}.txt' format: { date year. date month. date dayOfMonth } 
]

{ #category : #private }
MUDSessionLog >> directory [
	^ (self class baseDirectory / self game name) ensureCreateDirectory
]

{ #category : #accessing }
MUDSessionLog >> game [
	^ game
]

{ #category : #initialization }
MUDSessionLog >> initialize [
	super initialize.
	logReference := self directory / self createFileName
]

{ #category : #initialization }
MUDSessionLog >> initializeGame: aGame [
	game := aGame.
	self initialize.
]

{ #category : #accessing }
MUDSessionLog >> log [ 
	^ logReference
]

{ #category : #accessing }
MUDSessionLog >> record: aString [
	self log writeStreamDo: [ :stream | 
		stream setToEnd.
		stream << aString ]
]
