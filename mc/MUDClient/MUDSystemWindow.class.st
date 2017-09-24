"
I'm a specific kind of window (prepared to work with the client)
"
Class {
	#name : #MUDSystemWindow,
	#superclass : #GLMSystemWindow,
	#instVars : [
		'toolbarMorph',
		'contentMorph'
	],
	#category : 'MUDClient-View-Glamour'
}

{ #category : #accessing }
MUDSystemWindow >> contentMorph [
	^ contentMorph
]

{ #category : #accessing }
MUDSystemWindow >> contentMorph: anObject [
	contentMorph := anObject
]

{ #category : #open/close }
MUDSystemWindow >> delete [
	self isDisplayed ifFalse: [ ^ self ].
	super delete
]

{ #category : #accessing }
MUDSystemWindow >> disable [ 
	"Adds a 'disabling' morph on top"
	self isEnabled ifFalse: [ ^ self ].
	
	self releaseFocusIfContained.
	self contentMorph addMorphFront: (Morph new
		color: (self theme backgroundColor alpha: 0.9);
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		setProperty: #disabledArea toValue: true;
		beSticky;
		yourself)
]

{ #category : #accessing }
MUDSystemWindow >> enable [ 
	"Assumes that frst morph is a disabling morph and removes it"
	self isEnabled ifTrue: [ ^ self ].
	self contentMorph submorphs first delete

]

{ #category : #open/close }
MUDSystemWindow >> ensureShown [
	| currentPosition |
	self isDisplayed ifTrue: [ ^ self ].
	currentPosition := self position.
	self tkOpen.
	self position: currentPosition. "Restore position to ensure is displayed correctly"
	self announce: (WindowOpened new window: self)
]

{ #category : #initialization }
MUDSystemWindow >> initialize [
	super initialize.
	"self removeBoxes"
]

{ #category : #testing }
MUDSystemWindow >> isEnabled [
	^ self contentMorph submorphs isEmpty 
		or: [ ((self contentMorph submorphs first valueOfProperty: #disabledArea) = true) not ]
]

{ #category : #open/close }
MUDSystemWindow >> open [
	super open.
	self announce: (WindowOpened new window: self)	
]

{ #category : #initialization }
MUDSystemWindow >> removeBoxes [
	expandBox ifNotNil: [expandBox delete. expandBox := nil].
	collapseBox ifNotNil: [collapseBox delete. collapseBox := nil]
]

{ #category : #open/close }
MUDSystemWindow >> silentlyShown [
	| currentPosition |
	self isDisplayed ifTrue: [ ^ self ].
	currentPosition := self position.
	self openAsIs.
	self position: currentPosition. "Restore position to ensure is displayed correctly"
]

{ #category : #open/close }
MUDSystemWindow >> sleep [
	self disable
]

{ #category : #open/close }
MUDSystemWindow >> tkOpenSDL2 [
	super tkOpenSDL2.
	self announce: (WindowOpened new window: self)	
]

{ #category : #open/close }
MUDSystemWindow >> tkOpenWorld [
	super tkOpenWorld.
	self announce: (WindowOpened new window: self)	
]

{ #category : #accessing }
MUDSystemWindow >> toolbarMorph [
	^ toolbarMorph
]

{ #category : #accessing }
MUDSystemWindow >> toolbarMorph: anObject [
	toolbarMorph := anObject
]

{ #category : #open/close }
MUDSystemWindow >> wakeUp [
	self silentlyShown.
	self enable
]
