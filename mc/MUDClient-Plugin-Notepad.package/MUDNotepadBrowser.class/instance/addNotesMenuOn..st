building
addNotesMenuOn: aPresenter
	aPresenter 
		act: [ :presenter | 
			(self addNoteTo: nil) ifNotNil: [ :newNote | 
				presenter update.
				presenter selection: newNote ] ] 
			icon: #new asMUDIcon 
			entitled: 'Add note...';
		act: [ :presenter | 
			(self addFolderTo: nil) ifNotNil: [ :newFolder | 
				presenter update.
				presenter selection: newFolder ] ] 
			icon: #newFolder asMUDIcon 
			entitled: 'Add folder...';
		selectionAct: [ :presenter | 
			(self addNoteTo: presenter selection closestGroup) ifNotNil: [ :newNote |
				presenter update.
				presenter selection: newNote ] ] 
			entitled: 'Add note...';
		selectionAct: [ :presenter | 
			(self addFolderTo: presenter selection closestGroup) ifNotNil: [ :newFolder | 
				presenter update.
				presenter selection: newFolder ] ] 
			entitled: 'Add folder...';
		selectionAct: [ :presenter |
			(self renameNode: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Rename..';
		selectionAct: [ :presenter |
			(self removeNode: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Remove'