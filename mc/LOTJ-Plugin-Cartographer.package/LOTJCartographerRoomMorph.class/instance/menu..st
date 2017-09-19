accessing
menu: aMorph
	^ TkMenuBuilder new 
		model: self;
		actions: (
			self createTypeActions,
			{ self createNotesAction }, 
			self createEditActions, 
			{ self createInspectAction });
		build