building
buildToolBarOn: aPresentation
	aPresentation 
		act: [ self connect ] 
			icon: (RpcIcons uniqueInstance iconNamed: #connect)
			entitled: 'Connect';
		act: [ self configure ] 
			icon: (RpcIcons uniqueInstance iconNamed: #configure) 
			entitled: 'Configure'.