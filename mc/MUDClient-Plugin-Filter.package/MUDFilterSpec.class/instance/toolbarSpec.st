accessing
toolbarSpec 
	^ MUDPluginToolbarSpec 
		act: [ :aTerminal :aGame | self configureFiltersFor: aGame in: aTerminal ]
		icon: #filter asMUDIcon
		entitled: 'Filters'