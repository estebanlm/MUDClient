Class {
	#name : #MUDPadButtonModel,
	#superclass : #GLMButtonModel,
	#category : 'MUDClient-Plugin-Buttonpad-View'
}

{ #category : #'as yet unclassified' }
MUDPadButtonModel >> addMenu: anAction to: aMenuMorph [
	(aMenuMorph 
		add: anAction title
		target: anAction
		selector: #actOn:
		argument: self glamourPresentation)
		icon: anAction icon;
		keyText: (anAction hasShortcut 
			ifTrue: [ anAction shortcutAsString ]
			ifFalse: [ nil ])
]

{ #category : #'as yet unclassified' }
MUDPadButtonModel >> buttonLabel [
	"Label can also be a block"
	^ super buttonLabel value 
]

{ #category : #'as yet unclassified' }
MUDPadButtonModel >> buttonMenu: aMenuMorph [
	self glamourAction allActions 
		do: [ :each | self addMenu: each to: aMenuMorph ].
	^ aMenuMorph
]
