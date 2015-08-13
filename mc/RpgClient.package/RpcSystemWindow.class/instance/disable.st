accessing
disable 
	"Adds a 'disabling' morph on top"
	self isEnabled ifFalse: [ ^ self ].
	
	self releaseFocusIfContained.
	self contentMorph addMorphFront: (Morph new
		color: (self theme backgroundColor alpha: 0.9);
		layoutFrame: LayoutFrame identity;
		hResizing: #spaceFill; 
		vResizing: #spaceFill;
		setProperty: #disabledArea toValue: true;
		beSticky;
		yourself)