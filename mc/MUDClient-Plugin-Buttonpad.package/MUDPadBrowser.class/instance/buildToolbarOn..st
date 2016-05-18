building
buildToolbarOn: aPresentation
	aPresentation 
		act: [ self addPad ] 
			icon: #add asMUDIcon 
			entitled: 'Add';
		act: [ self configure ]
			icon: #configure asMUDIcon
			entitled: 'Configure'.
	