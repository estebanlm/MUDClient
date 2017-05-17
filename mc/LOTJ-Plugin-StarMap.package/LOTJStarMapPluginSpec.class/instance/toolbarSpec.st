accessing spec
toolbarSpec 
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self openStarMapFor: aGame in: aTerminal ]
		icon: #map2 asMUDIcon
		entitled: self name