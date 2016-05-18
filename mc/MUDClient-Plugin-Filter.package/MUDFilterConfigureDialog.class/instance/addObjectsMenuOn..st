building
addObjectsMenuOn: aList
	aList 
		strongSelectionAct: [ :p | self launch: p selection ];
		act: [ :p | self addObjectThen: [ p update ] ] 
			icon: #add asMUDIcon 
			entitled: 'New Filter';
		selectionAct: [ :p | self launch: p selection ] 
			entitled: 'Launch'
			when: [ :p | p selection notNil and: [ p selection isAlert not ]];
		selectionAct: [ :p | self removeObject: p selection then: [ p update ]] 
			entitled: 'Remove' 
	"aPresentation 
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
			when: [ :list | self filters notEmpty and: [ self filters last ~= list selection ] ]"