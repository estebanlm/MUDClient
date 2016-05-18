building
buildToolbarOn: aPresentation
	aPresentation 
		act: [ self addFilter ] 
			icon: #add asMUDIcon 
			entitled: 'Add';
		act: [ self configure ]
			icon: #configure asMUDIcon
			entitled: 'Configure'.