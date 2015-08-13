building
buildCommandMorph: aCommand
	^ (PluggableButtonMorph 
		on: aCommand 
			getState: nil 
			action: #execute
			label: #title 
			menu: nil)
		hResizing: #spaceFill;
		vResizing: #rigid;
		height: 22;
		yourself
