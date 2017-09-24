Class {
	#name : #MUDScheduledAnnouncer,
	#superclass : #Announcer,
	#instVars : [
		'runner'
	],
	#category : 'MUDClient-Model-Telnet'
}

{ #category : #announce }
MUDScheduledAnnouncer >> announce: anAnnouncement [
	^ runner schedule: [ super announce: anAnnouncement ]
]

{ #category : #initialization }
MUDScheduledAnnouncer >> initialize [
	super initialize.
	runner := TKTLocalProcessTaskRunner new
]
