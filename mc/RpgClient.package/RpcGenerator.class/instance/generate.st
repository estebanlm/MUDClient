generation
generate 
	^ (self asMagritteMorph 
		addButtons;
		addWindow;
		callInWorldCentered)
			 ifNotNil: [ self createObject ] 
			