building
buildToolbarOn: aPresentation
	aPresentation 
		act: [ self doConnect ] 
			icon: #connect asMUDIcon
			entitled: 'Connect';
		act: [ self doReconnect ] 
			icon: #reconnect asMUDIcon
			entitled: 'Reconnect to last game'
			when: [ self hasPreviousGame and: [ self isConnectedAndRunning not ] ];
		act: [ :presenter | self doDisconnect ] 
			icon: #disconnect asMUDIcon
			entitled: 'Disconnect'
			when: [ self isConnectedAndRunning ];		
		act: [ self doConfigure ]
			icon: #configure asMUDIcon
			entitled: 'Configure'.

	MUDPluginSpec allSpecs do: [ :each | 
		| toolbarSpec |
		toolbarSpec := each toolbarSpec.
		toolbarSpec ifNotNil: [ 
			aPresentation 
				act: [ toolbarSpec action cull: self cull: self game ]
				icon: toolbarSpec icon
				entitled: toolbarSpec title
				when: [ each isVisibleFor: self ]]]