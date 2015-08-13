building
buildPadMorph: aPad
	| padMorph |
	
	padMorph := PanelMorph new
		layoutPolicy: TableLayout new;
		listDirection: #leftToRight;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself.
		
	aPad commands do: [ :each | 
		padMorph addMorphBack: (self buildCommandMorph: each) ].
	
	^ padMorph
