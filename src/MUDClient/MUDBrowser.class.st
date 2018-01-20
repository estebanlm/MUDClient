"
I'm a generic UI for app.
"
Class {
	#name : #MUDBrowser,
	#superclass : #GLMCompositePresentation,
	#traits : 'TMUDLogueable',
	#classTraits : 'TMUDLogueable classTrait',
	#instVars : [
		'game',
		'window'
	],
	#category : #'MUDClient-View'
}

{ #category : #showing }
MUDBrowser class >> open [ 
	^ self new open
]

{ #category : #accessing }
MUDBrowser class >> preferredExtent [
	^ 800@600
]

{ #category : #accessing }
MUDBrowser class >> title [ 
	^ self subclassResponsibility
]

{ #category : #'system startup' }
MUDBrowser >> applicationDidStart: app [
]

{ #category : #'system startup' }
MUDBrowser >> applicationWillShutdown: app [
	game := nil
]

{ #category : #showing }
MUDBrowser >> basicOpen: aWindow [
	self window: aWindow.
	self window extent: self preferredExtent.
	self window announcer
		when: WindowOpened send: #windowOpened: to: self;
		when: WindowWillClose send: #windowWillClose: to: self;
		when: WindowClosed send: #windowClosed: to: self.
	self window tkOpen.
	self postOpen
]

{ #category : #'private settings' }
MUDBrowser >> browserSettings [
	^ self settingsClass findMatchCreateIfNoneFor: self
]

{ #category : #building }
MUDBrowser >> buildContentsOn: aPresentation [
	aPresentation tabulator 
		with: [ :browser | self buildOn: browser ]
	
]

{ #category : #building }
MUDBrowser >> buildOn: browser [
	^ self subclassResponsibility
]

{ #category : #building }
MUDBrowser >> buildToolbarOn: aPresentation [
	"By default, browsers do not have toolbars. See children for implementations."
]

{ #category : #showing }
MUDBrowser >> close [
	self window ifNil: [ ^ self ].
	self window delete.
	self resetWindow
]

{ #category : #showing }
MUDBrowser >> closeBySessionTerminate [
	"Called when sessions are terminated (not a regular close)"
	| isOpened |
	self window ifNil: [ ^ self ].
	isOpened := self window isDisplayed.
	self close.
	isOpened ifTrue: [ self browserSettings opened ]
	
]

{ #category : #building }
MUDBrowser >> compose [
	self buildToolbarOn: self.
	self buildContentsOn: self.
]

{ #category : #'private settings' }
MUDBrowser >> createSettings [
	^ MUDBrowserSettings browserClass: self class game: self game
]

{ #category : #accessing }
MUDBrowser >> game [
	^ game
]

{ #category : #private }
MUDBrowser >> game: aGame [
	game := aGame
]

{ #category : #showing }
MUDBrowser >> hardRefresh [
	"This is a hard refresh... it forces a re-calculation of all contents.
	 Ideally is not really used, but there are certain cases where I need to re-think everything. 
	 Look for senders to understand its uses"
	self clear.
	self buildContentsOn: self. 
	self startOn: self startValue.
	self refresh
]

{ #category : #testing }
MUDBrowser >> hasToolbar [
	^ self allActions anySatisfy: #isButton
]

{ #category : #'as yet unclassified' }
MUDBrowser >> installKeyBindingsOn: category [
]

{ #category : #testing }
MUDBrowser >> isPluginBrowser [
	^ false
]

{ #category : #'private settings' }
MUDBrowser >> isSettingsMatching: aSetting [
	^ aSetting game = self game 
		and: [ aSetting browserClass = self class ]
]

{ #category : #building }
MUDBrowser >> miniWindowRendererClass [
	^ TkMiniWindowRenderer
]

{ #category : #showing }
MUDBrowser >> open [
	"Creates and open window"
	self startOn: self startValue.
	self basicOpen: (TkPlatform current renderBrowser: self)
]

{ #category : #showing }
MUDBrowser >> openMiniWindow [
	"Creates and open window"
	self startOn: self startValue.
	self basicOpen: (TkPlatform current renderMiniBrowser: self)
]

{ #category : #showing }
MUDBrowser >> postOpen [
]

{ #category : #accessing }
MUDBrowser >> preferredExtent [
	"Not using #initialExtent to not collide with morphic stuff"
	^ self class preferredExtent
]

{ #category : #showing }
MUDBrowser >> refresh [
	self refreshWith: self defaultRenderer
]

{ #category : #showing }
MUDBrowser >> refreshWith: aRenderer [
	aRenderer refreshWindow: self window: self window
]

{ #category : #private }
MUDBrowser >> resetWindow [
	window := nil
]

{ #category : #'private settings' }
MUDBrowser >> restoreWindowSettings: aWindow [
	| settings |
	settings := self browserSettings.
	settings opened.
	settings bounds 
		ifNotNil: [ :b | aWindow rootWindow bounds: b ]
		ifNil: [ aWindow rootWindow extent: self preferredExtent ]
]

{ #category : #'private settings' }
MUDBrowser >> settingsClass [
	^ MUDBrowserSettings
]

{ #category : #accessing }
MUDBrowser >> startValue [ 
	^ Object new
]

{ #category : #'private settings' }
MUDBrowser >> storeWindowSettings: aWindow [
	| settings |
	settings := self browserSettings.
	settings closed.
	aWindow isRestored 
		ifTrue: [ settings bounds: aWindow rootWindow bounds ]
]

{ #category : #accessing }
MUDBrowser >> title [
	^ super title ifNil: [ self class title ]
]

{ #category : #accessing }
MUDBrowser >> window [
	^ window 
]

{ #category : #private }
MUDBrowser >> window: aWindow [
	window := aWindow
]

{ #category : #private }
MUDBrowser >> windowClosed: ann [
	
]

{ #category : #private }
MUDBrowser >> windowOpened: ann [
	self restoreWindowSettings: ann window
]

{ #category : #building }
MUDBrowser >> windowRendererClass [
	^ TkSystemWindowRenderer
]

{ #category : #private }
MUDBrowser >> windowWillClose: ann [
	self storeWindowSettings: ann window
]
