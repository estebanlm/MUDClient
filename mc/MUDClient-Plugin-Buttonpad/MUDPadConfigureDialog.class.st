"
I'm a configuration dialog for the button pad.
"
Class {
	#name : #MUDPadConfigureDialog,
	#superclass : #TkGlamourSelectingEditor,
	#instVars : [
		'buttonPad'
	],
	#category : 'MUDClient-Plugin-Buttonpad-View'
}

{ #category : #'instance creation' }
MUDPadConfigureDialog class >> buttonPad: aButtonPad [
	^ self basicNew 
		initializeButtonPad: aButtonPad;
		yourself
]

{ #category : #accessing }
MUDPadConfigureDialog class >> preferredExtent [ 
	^ 600@350
]

{ #category : #accessing }
MUDPadConfigureDialog class >> title [
	^ 'Button Pad Configuration'
]

{ #category : #actions }
MUDPadConfigureDialog >> addObjectThen: aBlock [
	aBlock cull: self buttonPad addNew
]

{ #category : #building }
MUDPadConfigureDialog >> addObjectsMenuOn: aList [ 
	aList
		act: [ :presenter |
				self addObjectThen: [ :newObject |
					presenter update.
					presenter selection: newObject]]
			icon: #add asMUDIcon
			entitled: 'Add new';
		selectionAct: [ :presenter | 
				(self removeObject: presenter selection)
					ifTrue: [ presenter update ] ]
			entitled: 'Remove'

]

{ #category : #actions }
MUDPadConfigureDialog >> basicRemoveObject: aPad [ 
	aPad removeFromOwner
]

{ #category : #building }
MUDPadConfigureDialog >> buildBrowser [
	| browser |
	
	browser := GLMTabulator new 
		title: self class title;
		initialExtent: self class preferredExtent;
		column: #objects;
		column: #currentObject;
		yourself.
		
	browser transmit 
		to: #objects;
		andShow: [ :a | self buildObjectsOn: a ].
		
	browser transmit
		from: #objects;
		to: #currentObject;
		andShow: [ :a | self buildCurrentObjectOn: a ].
		
	^ browser
]

{ #category : #accessing }
MUDPadConfigureDialog >> buttonPad [
	^ buttonPad
]

{ #category : #private }
MUDPadConfigureDialog >> descriptionFor: anObject [
	^ anObject name
]

{ #category : #initialization }
MUDPadConfigureDialog >> initializeButtonPad: aButtonPad [
	buttonPad := aButtonPad.
	self initialize
	
]

{ #category : #accessing }
MUDPadConfigureDialog >> list [ 
	^ self objects
]

{ #category : #accessing }
MUDPadConfigureDialog >> listTitle [
	^ 'Pads'
]

{ #category : #accessing }
MUDPadConfigureDialog >> objects [
	^ self buttonPad pads
]

{ #category : #actions }
MUDPadConfigureDialog >> removeObject: aPad [
	self buttonPad remove: aPad.
	^ true
]

{ #category : #actions }
MUDPadConfigureDialog >> removeObject: anObject then: aBlock [
	(self confirm: ('Are you sure you want to remove "{1}"?' format: { anObject name }))
		ifFalse: [ ^ false ].
	self basicRemoveObject: anObject.
	aBlock value
]
