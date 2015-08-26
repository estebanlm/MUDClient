building
buildTitleMorph: aPad
	^ PanelMorph new 
		hResizing: #spaceFill;
		vResizing: #rigid;
		minWidth: 70;
		height: 22;
		addMorphBack: aPad name asMorph;
		yourself.
