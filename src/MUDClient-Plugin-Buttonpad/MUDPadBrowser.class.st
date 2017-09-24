"
I define a pad browser (a visualization of a pad).
"
Class {
	#name : #MUDPadBrowser,
	#superclass : #MUDPluginBrowser,
	#instVars : [
		'preferredExtent'
	],
	#category : 'MUDClient-Plugin-Buttonpad-View'
}

{ #category : #accessing }
MUDPadBrowser class >> preferredExtent [
	^ 800@50
]

{ #category : #accessing }
MUDPadBrowser class >> preferredWidth [ 
	^ self preferredExtent x
]

{ #category : #accessing }
MUDPadBrowser class >> title [
	^ 'Pad'
]

{ #category : #actions }
MUDPadBrowser >> addPad [
	self plugin addNew.
	self hardRefresh
]

{ #category : #building }
MUDPadBrowser >> buildCommand: aCommand [
	^ MUDPadAction new
		title: [ aCommand title ];
		action: [ :presenter | self execute: aCommand then: [ presenter update ] ];
		addAction: (GLMGenericAction new 
			title: 'Edit';
			action: [ :presenter | self requestTextForCommand: aCommand then: [ presenter update ] ];
			yourself);
		addAction: (GLMGenericAction new 
			title: 'Clear';
			action: [ :presenter | self clear: aCommand then: [ presenter update ] ];
			yourself);
		yourself 
]

{ #category : #building }
MUDPadBrowser >> buildOn: browser [ 
	"browser row: #pad.
	browser transmit to: #pad; andShow: [ :a | 
		a morph display: [ self buildMorph ] ]"
	self plugin pads withIndexDo: [ :each :index |
		self 
			buildPad: each 
			port: ('row', index asString) asSymbol
			on: browser ]
]

{ #category : #building }
MUDPadBrowser >> buildPad: aPad port: port on: browser [
	browser row: port. 
	browser transmit 
		to: port; 
		andShow: [ :a |
			a padActionList in: [ :this | 
				aPad commands do: [ :each | 
					this addAction: (self buildCommand: each) ]]]
]

{ #category : #building }
MUDPadBrowser >> buildTitleMorph: aPad [
	^ PanelMorph new 
		hResizing: #spaceFill;
		vResizing: #rigid;
		minWidth: 70;
		height: 22;
		addMorphBack: aPad name asMorph;
		yourself.

]

{ #category : #building }
MUDPadBrowser >> buildToolbarOn: aPresentation [
	aPresentation 
		act: [ self addPad ] 
			icon: #add asMUDIcon 
			entitled: 'Add';
		act: [ self configure ]
			icon: #configure asMUDIcon
			entitled: 'Configure'.
	
]

{ #category : #private }
MUDPadBrowser >> calculatePreferredExtent [
	"65 is the 'base height': the height of the window without any pad.
	 28 is decomposed as is: 24 - pad, 2 + 2 insets"
	preferredExtent := self class preferredWidth@((28 * self plugin padCount) + 65).
]

{ #category : #actions }
MUDPadBrowser >> clear: aCommand then: aBlock [
	aCommand isDefined ifFalse: [ ^ self ].

	aCommand clear.
	aBlock value
]

{ #category : #actions }
MUDPadBrowser >> configure [
	(MUDPadConfigureDialog buttonPad: self plugin) go.
	self hardRefresh
]

{ #category : #actions }
MUDPadBrowser >> execute: aCommand then: aBlock [
	aCommand isDefined
		ifTrue: [ aCommand executeOn: self owner ]
		ifFalse: [ self requestTextForCommand: aCommand then: aBlock ]
]

{ #category : #showing }
MUDPadBrowser >> hardRefresh [
	| newBounds |
	self calculatePreferredExtent.
	newBounds := window bounds withHeight: self preferredExtent y.
	self browserSettings bounds: newBounds.
	super hardRefresh.
	window bounds: newBounds.
]

{ #category : #initialization }
MUDPadBrowser >> initialize [ 
	super initialize.
	self calculatePreferredExtent
]

{ #category : #'as yet unclassified' }
MUDPadBrowser >> installKeyBindingsOn: category [
	self plugin installKeyBindingsOn: category
]

{ #category : #'as yet unclassified' }
MUDPadBrowser >> isMiniWindow [
	^ true
]

{ #category : #accessing }
MUDPadBrowser >> preferredExtent [
	^ preferredExtent
]

{ #category : #actions }
MUDPadBrowser >> requestTextForCommand: aCommand then: aBlock [ 
	| command |
	
	command := (TkMagritteEditor object: aCommand) go.
	command ifNil: [ ^ self ].
	aBlock cull: command
]

{ #category : #accessing }
MUDPadBrowser >> toolbarPosition [
	"The toolbar position for this browser. By default is RpcToolbarPosition top"
	^ #left asToolbarPosition
]
