building
addVariableMenuOn: aPresenter
	aPresenter 
		act: [ :presenter | self addVariableThen: [ presenter update ] ] 
			icon: #new asMUDIcon 
			entitled: 'Add global variable...';
		selectionAct: [ :presenter | 
				self 
					removeVariable: presenter selection 
					then: [ presenter update ] ] 
			entitled: 'Remove'