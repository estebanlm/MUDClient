building
buildToolbarOn: aPresentation
	aPresentation 
		act: [ self addPad ] 
			icon: MUDIcons uniqueInstance addIcon 
			entitled: 'Add';
		act: [ self configure ]
			icon: MUDIcons uniqueInstance configureIcon
			entitled: 'Configure'.
	