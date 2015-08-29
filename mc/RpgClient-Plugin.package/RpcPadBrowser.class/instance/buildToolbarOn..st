building
buildToolbarOn: aPresentation
	aPresentation 
		act: [ self addPad ] 
			icon: RpcIcons uniqueInstance addIcon 
			entitled: 'Add';
		act: [ self configure ]
			icon: RpcIcons uniqueInstance configureIcon
			entitled: 'Configure'.
	