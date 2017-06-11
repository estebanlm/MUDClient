accessing spec
toolbarSpec 
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self openCartographerFor: aGame in: aTerminal ]
		icon: #map1 asMUDIcon
		entitled: self name