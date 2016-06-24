accessing
toolbarSpec 
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self configureAliasesFor: aGame in: aTerminal ]
		icon: #alias asMUDIcon
		entitled: self name