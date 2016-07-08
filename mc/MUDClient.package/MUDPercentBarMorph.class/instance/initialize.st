initialization
initialize 	
	super initialize.
	"self color: Color lightGray lighter lighter lighter."
	self color: self theme backgroundColor.
	self 
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		clipSubmorphs: true.
	self showPercent.