building
addObjectsMenuOn: aList 
	aList
		act: [ :presenter |
				self addObjectThen: [ :newObject |
					presenter update.
					presenter selection: newObject]]
			icon: #add asMUDIcon
			entitled: 'Add new';
		selectionAct: [ :presenter | 
				(self removeObject: presenter selection)
					ifTrue: [ presenter update ] ]
			entitled: 'Remove'