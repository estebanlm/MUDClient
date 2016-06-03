building
addObjectsMenuOn: aPresentation
	aPresentation 
		selectionAct: [ :list | 
				self 
					moveUp: list selection
					then: [ list update ] ] 
			entitled: 'Move up' 
			when: [ :list | self filters notEmpty and: [ self filters first ~= list selection ] ];
		selectionAct: [ :list | 
				self 
					moveDown: list selection
					then: [ list update ] ] 
			entitled: 'Move down' 
			when: [ :list | self filters notEmpty and: [ self filters last ~= list selection ] ]