*RpgClient-Telnet
disable 
	"Adds a 'disabling' morph on top"
	self addMorphFront: (Morph new
		color: (self theme backgroundColor alpha: 0.9);
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		yourself).