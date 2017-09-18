private factory
createEditActions
	^ ({ 
		LOTJCartographerDirection north. 
		LOTJCartographerDirection south. 
		LOTJCartographerDirection east. 
		LOTJCartographerDirection west. 
	} collect: [ :each | self createIncrementModifierFor: each ] as: OrderedCollection)
	add: self createRemoveAllConnectionsAction;
	yourself