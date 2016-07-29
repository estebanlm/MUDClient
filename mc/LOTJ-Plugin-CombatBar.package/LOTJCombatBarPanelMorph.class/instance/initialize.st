initialization
initialize
	super initialize.
	self 
		color: (Smalltalk ui theme backgroundColor alpha: 0.6);
		layoutPolicy: TableLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		listDirection: #topToBottom;
		cellPositioning: #topLeft;
		layoutInset: 10; 
		addMorphBack: self buildEnemyPanel;
		addMorphBack: self buildCharacterPanel;
		width: self class width;
		yourself.
		
	self height: (self submorphs sum: #height) + 20