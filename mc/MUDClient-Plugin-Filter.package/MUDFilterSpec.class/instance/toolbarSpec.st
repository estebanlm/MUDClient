accessing
toolbarSpec 
	^ MUDPluginToolbarSpec 
		act: [ :aTerminal :aGame | self configureFiltersFor: aGame in: aTerminal ]
		icon: self icon
		entitled: self name