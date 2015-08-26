generation
generate 
	^ (self asMagritteMorph 
		addButtons;
		addWindowWithTitle: self title extent: self preferredExtent;
		callInWorldCentered)
			 ifNotNil: [ self createObject ] 
			