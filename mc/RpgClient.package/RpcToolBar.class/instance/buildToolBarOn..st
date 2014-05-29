building
buildToolBarOn: a
	| actionList |

	actionList := a iconActionList beVertical.
	actionList 
		act: [ self doConnect ]
			icon: RpcIcons uniqueInstance connectIcon
			entitled: 'Connect';
		act: [ self doConfigure ]
			icon: RpcIcons uniqueInstance configureIcon
			entitled: 'Configure'.
			
	self availablePlugins do: [ :each | 
		actionList 
			act: [ each execute ]
			icon: (each icon ifNil: [ RpcIcons uniqueInstance unknownIcon ])
			entitled: each name
			when: [ self hasActiveGame ] ]