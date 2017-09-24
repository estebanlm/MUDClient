"
I'm the browser settings for the terminal.
It should be just one for repository.
"
Class {
	#name : #MUDTerminalBrowserSettings,
	#superclass : #MUDBrowserSettings,
	#instVars : [
		'lastActiveGame'
	],
	#category : 'MUDClient-View'
}

{ #category : #'instance creation' }
MUDTerminalBrowserSettings class >> browserClass: aClass [ 
	^ self browserClass: aClass game: nil
]

{ #category : #accessing }
MUDTerminalBrowserSettings >> lastActiveGame [
	^ lastActiveGame
]

{ #category : #accessing }
MUDTerminalBrowserSettings >> lastActiveGame: anObject [
	lastActiveGame := anObject
]
