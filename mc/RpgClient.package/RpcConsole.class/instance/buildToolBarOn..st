building
buildToolbarOn: aPresentation
	aPresentation 
		act: [ self doConnect ] 
			icon: RpcIcons uniqueInstance connectIcon
			entitled: 'Connect';
		act: [ self doReconnect ] 
			icon: RpcIcons uniqueInstance reconnectIcon
			entitled: 'Reconnect to last game'
			when: [ self hasPreviousGame and: [ self isConnectedAndRunning not ] ];
		act: [ :presenter | 
				"there is no need to refresh because disconnection will trigger one anyway" 
				self doDisconnect ] 
			icon: RpcIcons uniqueInstance disconnectIcon
			entitled: 'Disconnect'
			when: [ self isConnectedAndRunning ];		
		act: [ self doConfigure ]
			icon: RpcIcons uniqueInstance configureIcon
			entitled: 'Configure'.

	self availablePlugins do: [ :each | 
		aPresentation
			act: [ each executeGame: self game on: self ]
			icon: (each icon ifNil: [ RpcIcons uniqueInstance unknownIcon ])
			entitled: each name
			when: [ each isVisibleFor: self ] ]