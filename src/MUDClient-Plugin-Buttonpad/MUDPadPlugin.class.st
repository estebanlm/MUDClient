"
I'm a pad plugin. I define different pads, that can be keystroke related (like alt+1... alt+0 definitions), but I also can define ""generic"" pads: matrices that can be triggered as buttons. The key related pads does not need explanation: they are like any other command trigger and are commonly used to trigger combat options. The generic are more meant to change attitudes or posses, for example, tones.

""tone none"" ""tone curious""

etc. The idea is to help a fast choosing of role options.
"
Class {
	#name : #MUDPadPlugin,
	#superclass : #MUDPlugin,
	#instVars : [
		'pads'
	],
	#category : 'MUDClient-Plugin-Buttonpad-Model'
}

{ #category : #accessing }
MUDPadPlugin class >> availableModifiers [
	"Modifiers available to pads. 
	 This actually restricts pads to 4, but for now it will work"
	^ { 
	KMModifier alt.
	KMModifier ctrl.
	KMModifier shift + KMModifier alt.
	KMModifier shift + KMModifier ctrl.
	KMModifier command.
	KMModifier shift + KMModifier command.
	}
]

{ #category : #accessing }
MUDPadPlugin >> add: aPad [ 
	^ self pads add: aPad
]

{ #category : #accessing }
MUDPadPlugin >> addNew [
	^ self add: (MUDPad new 
		name: self nextName;
		owner: self;
		yourself)
]

{ #category : #accessing }
MUDPadPlugin >> freeAvailableModifiers [
	^ self class availableModifiers 
		reject: [ :eachModifier | 
			self pads anySatisfy: [ :each | each modifier = eachModifier ] ]
]

{ #category : #testing }
MUDPadPlugin >> hasPads [
	^ self pads notEmpty
]

{ #category : #initialization }
MUDPadPlugin >> initialize [ 
	super initialize.
	self addNew
]

{ #category : #'as yet unclassified' }
MUDPadPlugin >> installKeyBindingsOn: category [
	self pads do: [ :each | each installKeyBindingsOn: category ]
]

{ #category : #private }
MUDPadPlugin >> nextName [
	| nextName index |
	
	index := 0.
	[ 
		index := index + 1.
		nextName := 'Pad ', index asString.
		self pads anySatisfy: [ :each | each name = nextName ] ]
	whileTrue.
	
	^ nextName
]

{ #category : #accessing }
MUDPadPlugin >> padCount [
	^ self pads size
]

{ #category : #accessing }
MUDPadPlugin >> pads [
	^ pads ifNil: [ pads := OrderedCollection new ]
]

{ #category : #accessing }
MUDPadPlugin >> remove: aPad [ 
	self pads remove: aPad ifAbsent: [].
	^ aPad
]
