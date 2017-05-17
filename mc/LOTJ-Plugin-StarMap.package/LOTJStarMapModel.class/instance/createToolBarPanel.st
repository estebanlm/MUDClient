private factory
createToolBarPanel
	^ ToolDockingBarMorph new
		borderWidth: 0;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		clipSubmorphs: true;
		yourself