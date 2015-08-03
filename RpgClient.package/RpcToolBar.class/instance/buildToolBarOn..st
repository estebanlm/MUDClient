building
buildToolBarOn: a
	| actionList |

	actionList := a iconActionList beVertical.
	actionList 
		act: [ :presenter | self doConnect ifTrue: [ presenter pane browser update ] ]
			icon: RpcIcons uniqueInstance connectIcon
			entitled: 'Connect';
		act: [ :presenter | 
				"there is no need to refresh because disconnection will trigger one anyway" 
				self doDisconnect ] 
			icon: RpcIcons uniqueInstance disconnectIcon
			entitled: 'Disconnect'
			when: [ self client isConnectedAndRunning ];
		act: [ self doConfigure ]
			icon: RpcIcons uniqueInstance configureIcon
			entitled: 'Configure'.
			
	self availablePlugins do: [ :each | 
		actionList 
			act: [ self executePlugin: each ]
			icon: (each icon ifNil: [ RpcIcons uniqueInstance unknownIcon ])
			entitled: each name
			when: [ each isVisibleFor: self client ] ]