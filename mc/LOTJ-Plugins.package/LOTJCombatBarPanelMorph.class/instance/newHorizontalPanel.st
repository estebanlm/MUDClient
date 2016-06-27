private building
newHorizontalPanel
	^ Morph new 
		color: Color transparent;
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #rigid;
		listDirection: #leftToRight;
		cellPositioning: #topLeft;
		borderWidth: 0;
		yourself	