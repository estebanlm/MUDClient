building
addAliasMenuOn: aPresenter
	aPresenter 
		act: [ :presenter | self addAliasThen: [ presenter update ] ] 
			icon: #new asMUDIcon 
			entitled: 'Add alias...';
		selectionAct: [ :presenter | 
				self 
					removeAlias: presenter selection 
					then: [ presenter update ] ] 
			entitled: 'Remove'