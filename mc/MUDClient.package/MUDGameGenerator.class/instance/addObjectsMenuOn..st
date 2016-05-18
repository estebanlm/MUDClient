building
addObjectsMenuOn: aList
	aList 
		act: [ :p |
				self addObjectThen: [ :newObject | 
					p update. 
					p selection: newObject]]
			icon: #add asMUDIcon
			entitled: 'Add new';
		strongSelectionAct: [ :p | self launch: p selection ];
		selectionAct: [ :p | self launch: p selection ]
			entitled: 'Launch';
		selectionAct: [ :p | self removeObject: p selection then: [ p update ] ]
			entitled: 'Remove'