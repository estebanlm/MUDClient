Class {
	#name : #MUDFilterBrowserSettings,
	#superclass : #MUDBrowserPluginSettings,
	#instVars : [
		'filter'
	],
	#category : #'MUDClient-Plugin-Filter-View'
}

{ #category : #accessing }
MUDFilterBrowserSettings class >> findByFilter: aFilter [
	^ self selectOne: [ :each | each filter = aFilter ]
]

{ #category : #accessing }
MUDFilterBrowserSettings >> filter [
	^ filter
]

{ #category : #accessing }
MUDFilterBrowserSettings >> filter: anObject [
	filter := anObject
]

{ #category : #'private factory' }
MUDFilterBrowserSettings >> newBrowser [
	^ self browserClass 
		game: self game 
		plugin: self plugin 
		filter: self filter
]

{ #category : #printing }
MUDFilterBrowserSettings >> printOn: stream [ 
	super printOn: stream.
	stream << $( << self filter name << $)
]
