as yet unclassified
addMenu: anAction to: aMenuMorph
	(aMenuMorph 
		add: anAction title
		target: anAction
		selector: #actOn:
		argument: self glamourPresentation)
		icon: anAction icon;
		keyText: (anAction hasShortcut 
			ifTrue: [ anAction shortcutAsString ]
			ifFalse: [ nil ])