"
I define a pad presentation (a specific kind of action list)
"
Class {
	#name : #MUDPadActionListPresentation,
	#superclass : #GLMActionListPresentation,
	#instVars : [
		'horizontal'
	],
	#category : 'MUDClient-Plugin-Buttonpad-View'
}

{ #category : #'scripting actions' }
MUDPadActionListPresentation >> act: aBlock entitled: aStringOrBlock [
	self addAction: (MUDPadAction new 
		action: aBlock; 
		title: aStringOrBlock; 
		yourself)
]

{ #category : #'scripting actions' }
MUDPadActionListPresentation >> act: aBlock entitled: aStringOrBlock help: helpString [
	self addAction: (MUDPadAction new 
		action: aBlock; 
		title: aStringOrBlock; 
		help: helpString;
		yourself)
]

{ #category : #accessing }
MUDPadActionListPresentation >> horizontal: anObject [
	horizontal := anObject
]

{ #category : #initialization }
MUDPadActionListPresentation >> initialize [
	super initialize.
	self horizontal: true
]

{ #category : #accessing }
MUDPadActionListPresentation >> isHorizontal [
	^ horizontal
]

{ #category : #rendering }
MUDPadActionListPresentation >> renderGlamorouslyOn: aRenderer [
	self registerAnnouncements.
	^ aRenderer renderPadActionListPresentation: self
]
