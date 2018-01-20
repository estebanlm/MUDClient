"
I'm a generic browser for plugins. 
"
Class {
	#name : #MUDPluginBrowser,
	#superclass : #MUDBrowser,
	#instVars : [
		'plugin',
		'owner'
	],
	#category : #'MUDClient-View'
}

{ #category : #'instance creation' }
MUDPluginBrowser class >> game: aGame plugin: aPlugin [
	^ self basicNew 
		initializeGame: aGame plugin: aPlugin;
		yourself
]

{ #category : #'instance creation' }
MUDPluginBrowser class >> new [ 
	self error: 'Use #game:plugin:'
]

{ #category : #'private settings' }
MUDPluginBrowser >> createSettings [
	^ (MUDBrowserPluginSettings browserClass: self class game: self game)
		plugin: self plugin;
		yourself
]

{ #category : #initialization }
MUDPluginBrowser >> initializeGame: aGame plugin: aPlugin [
	self game: aGame.
	plugin := aPlugin.
	self initialize
]

{ #category : #testing }
MUDPluginBrowser >> isMiniWindow [
	"Subclasses needs to override this to mark a class as 'MiniWindow'"
	^ false
]

{ #category : #testing }
MUDPluginBrowser >> isPluginBrowser [
	^ true
]

{ #category : #showing }
MUDPluginBrowser >> open [
	self error: 'You have to use #openOn:'
]

{ #category : #showing }
MUDPluginBrowser >> openMiniWindow [
	self error: 'You have to use #openOn:'
]

{ #category : #showing }
MUDPluginBrowser >> openOn: aTerminal [
	self owner: aTerminal.
	aTerminal addDependentWindow: self.
	self isMiniWindow 
		ifTrue: [ super openMiniWindow ]
		ifFalse: [ super open ]
]

{ #category : #accessing }
MUDPluginBrowser >> owner [
	^ owner
]

{ #category : #accessing }
MUDPluginBrowser >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
MUDPluginBrowser >> plugin [
	^ plugin
]

{ #category : #private }
MUDPluginBrowser >> windowClosed: ann [
	super windowClosed: ann.
	self owner removeDependentWindow: self.
	self owner announce: MUDRefreshKeyBindingsAnnouncement new
]

{ #category : #private }
MUDPluginBrowser >> windowOpened: ann [
	super windowOpened: ann.
	self owner announce: MUDRefreshKeyBindingsAnnouncement new
]
