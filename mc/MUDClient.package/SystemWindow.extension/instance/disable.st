*MUDClient
disable 
	"Adds a 'disabling' morph on top"
	self isEnabled ifFalse: [ ^ self ].
	self releaseFocusIfContained.
	"self withAllSubmorphsDo: [ :each | each enabled: false ]."
	self addMorphFront: (Morph new
		color: (self theme backgroundColor alpha: 0.9);
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		setProperty: #disabledArea toValue: true;
		yourself).