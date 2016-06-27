private building
newVerticalPanel
	^ Morph new 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #rigid;
		listDirection: #topToBottom;
		cellPositioning: #topLeft;
		borderWidth: 0;
		yourself	