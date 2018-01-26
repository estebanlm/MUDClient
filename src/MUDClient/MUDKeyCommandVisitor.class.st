Class {
	#name : #MUDKeyCommandVisitor,
	#superclass : #Object,
	#instVars : [
		'terminal'
	],
	#category : #'MUDClient-View'
}

{ #category : #'instance creation' }
MUDKeyCommandVisitor class >> new [
	self error: 'Use #on:'
]

{ #category : #'instance creation' }
MUDKeyCommandVisitor class >> on: aTerminal [
	^ self basicNew 
		initializeTerminal: aTerminal;
		yourself
]

{ #category : #initialization }
MUDKeyCommandVisitor >> initializeTerminal: aTerminal [
	terminal := aTerminal.
	self initialize
]

{ #category : #accessing }
MUDKeyCommandVisitor >> terminal [
	^ terminal
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visit: anAnnouncement [
	anAnnouncement acceptVisitor: self
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitDown: anAnnouncement [
	self terminal send: 'd'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitEast: anAnnouncement [
	self terminal send: 'e'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitNorth: anAnnouncement [
	self terminal send: 'n'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitNortheast: anAnnouncement [
	self terminal send: 'ne'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitNorthwest: anAnnouncement [
	self terminal send: 'nw'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitSouth: anAnnouncement [
	self terminal send: 's'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitSoutheast: anAnnouncement [
	self terminal send: 'se'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitSouthwest: anAnnouncement [
	self terminal send: 'sw'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitUp: anAnnouncement [
	self terminal send: 'u'
]

{ #category : #visiting }
MUDKeyCommandVisitor >> visitWest: anAnnouncement [
	self terminal send: 'w'
]
