private factory
createEditActions
	^ { 
		LOTJCartographerDirection north. 
		LOTJCartographerDirection south. 
		LOTJCartographerDirection east. 
		LOTJCartographerDirection west. 
	} inject: (OrderedCollection with: self createRemoveAllConnectionsAction) 
	into: [ :all :each | 
		all 
			add: (self createIncrementModifierFor: each);
			add: (self createDecrementModifierFor: each);
			yourself ]