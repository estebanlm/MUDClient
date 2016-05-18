building
buildToolbarOn: aPresentation
	aPresentation 
		act: [ self edit ] 
			icon: #edit asMUDIcon 
			entitled: 'Edit filter'; 
		act: [ self clearAreaMorph ] 
			icon: #clear asMUDIcon 
			entitled: 'Clear'
