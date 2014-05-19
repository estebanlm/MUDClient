building
addNotesMenuOn: aPresenter
	aPresenter 
		act: [ :presenter | 
			(self addNoteTo: nil) ifNotNil: [ :newNote | 
				presenter update.
				presenter selection: newNote ] ] 
			icon: RpcIcons uniqueInstance newIcon 
			entitled: 'Add note...';
		act: [ :presenter | 
			(self addFolderTo: nil) ifNotNil: [ :newFolder | 
				presenter update.
				presenter selection: newFolder ] ] 
			icon: RpcIcons uniqueInstance newFolderIcon 
			entitled: 'Add folder...';
		selectionAct: [ :presenter | 
			(self addNoteTo: presenter selection) ifNotNil: [ :newNote |
				presenter update.
				presenter selection: newNote ] ] 
			entitled: 'Add note...'
			when: [ :presenter | presenter selection notNil and: [ presenter selection isGroup ] ];
		selectionAct: [ :presenter | 
			(self addFolderTo: presenter selection) ifNotNil: [ :newFolder | 
				presenter update.
				presenter selection: newFolder ] ] 
			entitled: 'Add folder...'
			when: [ :presenter | presenter selection notNil and: [ presenter selection isGroup ] ];
		selectionAct: [ :presenter |
			(self renameNode: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Rename..';
		selectionAct: [ :presenter |
			(self removeNode: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Remove'