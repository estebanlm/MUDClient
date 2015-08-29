*MUDClient
openModalCentered
	self 
		fullBounds;
		openInWorld;
		position: Display extent - self extent // 2.	
	Smalltalk ui theme runModal: self.