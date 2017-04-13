private
buttonMorph: aModel
	| button |
	
	button := PluggableButtonMorph 
		on: aModel 
		getState: nil 
		action: #execute.
		
	button 
		arguments: { button };
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		label: aModel buttonLabel;
		getEnabledSelector: nil;
		setBalloonText: aModel glamourAction help;
		extent: button minExtent;
		hResizing: #spaceFill;
		vResizing: #rigid;
		getMenuSelector: #buttonMenu:.

	^ button