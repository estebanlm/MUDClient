building
buildPanelMorph
	| panelMorph |
	 
	panelMorph := PanelMorph new
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		borderWidth: 0;
		yourself.
	
	panelMorph 
		addMorph: self areaMorph 
		fullFrame: (LayoutFrame identity  
			leftOffset: 0;
			topOffset: 0;
			rightOffset: 0;
			bottomOffset: -24;
			yourself).
			
	panelMorph 
		addMorph: self inputMorph
		fullFrame: ((0@1 corner: 1@1) asLayoutFrame 
			topOffset: self inputMorph height negated).
			
	^ panelMorph