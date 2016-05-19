building
buildOn: browser
	browser row: #area.

	browser transmit 
		to: #area; 
		andShow: [ :a | 
			a morph morph: [ self buildPanelMorph ]].
