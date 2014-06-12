rendering actions
renderAction: anAction
	^ (super renderAction: anAction)
		borderWidth: 0;
		yourself