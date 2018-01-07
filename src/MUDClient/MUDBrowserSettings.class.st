"
I keep browser settings, according the browser class and the game. 
Assuming they will accomplish certain conditions: one window for class/game. 
But I can have children who redefine this conditions.
"
Class {
	#name : #MUDBrowserSettings,
	#superclass : #Object,
	#instVars : [
		'browserClass',
		'game',
		'bounds',
		'opened'
	],
	#category : #'MUDClient-View'
}

{ #category : #'instance creation' }
MUDBrowserSettings class >> browserClass: aClass game: aGame [
	^ self basicNew
		initializeBrowserClass: aClass game: aGame;
		yourself
]

{ #category : #accessing }
MUDBrowserSettings class >> findAll [
	^ self selectAll
]

{ #category : #accessing }
MUDBrowserSettings class >> findByGame: aGame [
	^ self selectMany: [ :each | each game = aGame ]
]

{ #category : #accessing }
MUDBrowserSettings class >> findMatchCreateIfNoneFor: aBrowser [
	^ self 
		findMatchFor: aBrowser 
		ifNone: [ aBrowser createSettings save ]
]

{ #category : #accessing }
MUDBrowserSettings class >> findMatchFor: aBrowser ifNone: aBlock [
	^ (self selectOne: [ :each | aBrowser isSettingsMatching: each ])
		ifNil: aBlock
]

{ #category : #testing }
MUDBrowserSettings class >> isVoyageRoot [ 
	^ true
]

{ #category : #'instance creation' }
MUDBrowserSettings class >> new [ 
	^ self error: 'Use #browserClass:game:'
]

{ #category : #accessing }
MUDBrowserSettings >> bounds [
	^ bounds
]

{ #category : #accessing }
MUDBrowserSettings >> bounds: aRectangle [
	bounds := aRectangle
]

{ #category : #accessing }
MUDBrowserSettings >> browserClass [
	^ browserClass
]

{ #category : #accessing }
MUDBrowserSettings >> closed [
	opened := false
]

{ #category : #accessing }
MUDBrowserSettings >> game [
	^ game
]

{ #category : #initialization }
MUDBrowserSettings >> initialize [ 
	super initialize.
	opened := false
	
]

{ #category : #initialization }
MUDBrowserSettings >> initializeBrowserClass: aClass game: aGame [
	browserClass := aClass.
	game := aGame.
	self initialize 
]

{ #category : #testing }
MUDBrowserSettings >> isOpened [
	^ opened
]

{ #category : #testing }
MUDBrowserSettings >> isRemembered [
	^ false
]

{ #category : #accessing }
MUDBrowserSettings >> opened [
	opened := true
]

{ #category : #printing }
MUDBrowserSettings >> printOn: stream [ 
	super printOn: stream.
	stream << $( << self game name << ', ' << self browserClass name << $)
]

{ #category : #showing }
MUDBrowserSettings >> restoreOn: aTerminal [
	
]
