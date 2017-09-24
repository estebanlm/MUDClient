"
I'm an alert manager to show growl messages in terminal.
"
Class {
	#name : #MUDAlertManager,
	#superclass : #Object,
	#instVars : [
		'owner',
		'ansiParser'
	],
	#category : 'MUDClient-View'
}

{ #category : #'instance creation' }
MUDAlertManager class >> for: aMorph [
	^ self new owner: aMorph
]

{ #category : #alerting }
MUDAlertManager >> alertTitle: titleString contents: aString color: aColor [
	^ self 
		alertTitle: titleString 
		contents: aString 
		position: nil 
		color: aColor
]

{ #category : #alerting }
MUDAlertManager >> alertTitle: titleString contents: aString position: aPosition color: aColor [
	| parsed cleanString color bgColor |
	parsed := (self ansiParser parse: aString onError: [ {MUDANSIText new text: aString} ]).
	color := parsed detect: [ :each | each class = MUDANSIColor ] ifNone: [ nil ]. 
	cleanString := MUDANSITextCleaner visitAll: parsed.
	bgColor := aColor ifNil: [ Color veryDarkGray ].
	
	MUDGrowlMorph 
		openWithLabel: titleString
		contents: cleanString 
		position: aPosition
		backgroundColor: bgColor
		labelColor: (color ifNotNil: [ color foregroundColor ] ifNil: [ bgColor contrastingColor ])
		in: self owner
]

{ #category : #private }
MUDAlertManager >> ansiParser [
	^ ansiParser ifNil: [ ansiParser := MUDANSIParser new ]
]

{ #category : #accessing }
MUDAlertManager >> owner [
	^ owner
]

{ #category : #accessing }
MUDAlertManager >> owner: anObject [
	owner := anObject
]
