as yet unclassified
buttonMenu: aMenuMorph
	self glamourAction allActions 
		do: [ :each | self addMenu: each to: aMenuMorph ].
	^ aMenuMorph