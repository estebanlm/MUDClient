accessing
toolbarSpec
	^ MUDPluginToolbarSpec
		act: [ :aTerminal :aGame | self openButtonpadFor: aGame in: aTerminal ] 
		icon: #pad asMUDIcon
		entitled: 'Button Pad'