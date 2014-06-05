building
buildObjectsOn: a
	a list
		title: self class title;
		act: [ :presenter | | newObject |
				newObject := self addObject. 
				presenter update.
				presenter selection: newObject ]
			icon: RpcIcons uniqueInstance newGameIcon
			entitled: 'Add new';
		selectionAct: [ :presenter | 
				(self removeObject: presenter selection)
					ifTrue: [ presenter update ] ]
			entitled: 'Remove';
		display: [ self objects ];
		format: #name.