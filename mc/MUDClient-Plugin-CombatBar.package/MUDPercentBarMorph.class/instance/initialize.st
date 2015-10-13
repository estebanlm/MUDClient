initialization
initialize 	
	super initialize.
	self color: Color lightGray lighter lighter lighter.
	self 
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill.
	self showPercent.