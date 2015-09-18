building
buildObjectsOn: a
	a list
		title: self listTitle;
		act: [ :presenter |
				self addObjectThen: [ :newObject |
					presenter update.
					presenter selection: newObject]]
			icon: MUDIcons uniqueInstance addIcon
			entitled: 'Add new';
		selectionAct: [ :presenter | 
				(self removeObject: presenter selection)
					ifTrue: [ presenter update ] ]
			entitled: 'Remove';
		in: [ :this | self addObjectsMenuOn: this ];
		display: [ self objects ];
		format: #name.