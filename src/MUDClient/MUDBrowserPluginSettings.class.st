"
I'm the browser settings for a plugin. 

"
Class {
	#name : #MUDBrowserPluginSettings,
	#superclass : #MUDBrowserSettings,
	#instVars : [
		'plugin'
	],
	#category : 'MUDClient-View'
}

{ #category : #testing }
MUDBrowserPluginSettings >> isRemembered [
	^ self plugin spec settingsSpec isRemembered
]

{ #category : #'private factory' }
MUDBrowserPluginSettings >> newBrowser [
	^ self browserClass 
		game: self game 
		plugin: self plugin
]

{ #category : #accessing }
MUDBrowserPluginSettings >> plugin [
	^ plugin
]

{ #category : #accessing }
MUDBrowserPluginSettings >> plugin: anObject [
	plugin := anObject
]

{ #category : #showing }
MUDBrowserPluginSettings >> restoreOn: aTerminal [
	| browser |
	
	self isOpened ifFalse: [ ^ self ].
	
	browser := self newBrowser.
	browser openOn: aTerminal.
	self bounds ifNotNil: [ 
		browser window bounds: self bounds ] 
]
