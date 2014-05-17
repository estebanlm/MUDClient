building
addNotesMenuOn: aPresenter
	aPresenter 
		act: [ :presenter | 
			(self addNoteTo: nil) ifTrue: [ presenter update ] ] 
			icon: RpcIcons uniqueInstance newIcon 
			entitled: 'Add note';
		act: [ :presenter | 
			(self addFolderTo: nil) ifTrue: [ presenter update ] ] 
			icon: RpcIcons uniqueInstance newFolderIcon 
			entitled: 'Add folder';
		selectionAct: [ :presenter | 
			(self addNoteTo: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Add note'
			when: [ :presenter | presenter selection notNil and: [ presenter selection isGroup ] ];
		selectionAct: [ :presenter | 
			(self addFolderTo: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Add folder'
			when: [ :presenter | presenter selection notNil and: [ presenter selection isGroup ] ];
		selectionAct: [ :presenter |
			(self removeNode: presenter selection) ifTrue: [ presenter update ] ] 
			entitled: 'Remove'
			