initialization
initialize
	super initialize.
	self
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		color: self backgroundColor.
	self setNeedsDisplay