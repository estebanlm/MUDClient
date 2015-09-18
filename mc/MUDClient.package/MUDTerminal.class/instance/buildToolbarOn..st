building
buildToolbarOn: aPresentation
	aPresentation 
		act: [ self doConnect ] 
			icon: MUDIcons uniqueInstance connectIcon
			entitled: 'Connect';
		act: [ self doReconnect ] 
			icon: MUDIcons uniqueInstance reconnectIcon
			entitled: 'Reconnect to last game'
			when: [ self hasPreviousGame and: [ self isConnectedAndRunning not ] ];
		act: [ :presenter | 
				"there is no need to refresh because disconnection will trigger one anyway" 
				self doDisconnect ] 
			icon: MUDIcons uniqueInstance disconnectIcon
			entitled: 'Disconnect'
			when: [ self isConnectedAndRunning ];		
		act: [ self doConfigure ]
			icon: MUDIcons uniqueInstance configureIcon
			entitled: 'Configure'.

	self availablePlugins do: [ :each | 
		aPresentation
			act: [ each executeGame: self game on: self ]
			icon: (each icon ifNil: [ MUDIcons uniqueInstance unknownIcon ])
			entitled: each name
			when: [ each isVisibleFor: self ] ]