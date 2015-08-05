showing
openModal
	^ (self asMagritteMorph 
		addButtons;
		addWindow;
		callInWorldCentered)
			 ifNotNil: [ self pad ] 