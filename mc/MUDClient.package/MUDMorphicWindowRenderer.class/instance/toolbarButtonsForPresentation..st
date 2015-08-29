rendering
toolbarButtonsForPresentation: aPresentation
	^ aPresentation allActions 
		select: [:each | each isButton and: [ each isAvailableOn: aPresentation ]]
		thenCollect: [:each | |actionMorph|
			actionMorph := ((each renderGlamorouslyOn: self renderer)
				enabled: (each isEnabledOn: aPresentation);
				yourself).
			actionMorph arguments 
				ifNil: [ actionMorph arguments: { aPresentation } ]
				ifNotNil: [ actionMorph arguments: ({ aPresentation }, actionMorph arguments) ].
			actionMorph ].
	