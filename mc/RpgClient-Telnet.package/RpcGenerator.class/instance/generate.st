generation
generate 
	^ (self asMagritteMorph 
		addButtons;
		addWindow;
		callInWorld)
			 ifNotNil: [ self createObject ] 
			