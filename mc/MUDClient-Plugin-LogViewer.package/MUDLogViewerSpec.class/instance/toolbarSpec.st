accessing spec
toolbarSpec
	^ MUDPluginToolbarSpec 
		act: [ :aTerminal :aGame | self openLogFor: aGame in: aTerminal ]
		icon: #logViewer asMUDIcon
		entitled: 'Log Viewer'