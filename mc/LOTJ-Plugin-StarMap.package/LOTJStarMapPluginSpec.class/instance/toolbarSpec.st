accessing spec
toolbarSpec 
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self configureStarMapFor: aGame in: aTerminal ]
		icon: #map2 asMUDIcon
		entitled: self name