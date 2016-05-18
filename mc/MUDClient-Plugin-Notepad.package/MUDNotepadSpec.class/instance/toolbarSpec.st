accessing spec
toolbarSpec 
	^ MUDPluginToolbarSpec 
		act: [ :aTerminal :aGame | self openNotepadFor: aGame in: aTerminal ] 
		icon: #notepad asMUDIcon
		entitled: 'Notepad'