building
buildMorph
	| padMorph |
	
	padMorph := PanelMorph new
		layoutPolicy: TableLayout new;
		listDirection: #topToBottom;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself.
		
	self plugin pads do: [ :each | 
		padMorph addMorphBack: (self buildPadMorph: each) ].	
		
	^ padMorph