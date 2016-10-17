private
applyAlertFilter: aFilter to: aStream line: aLine in: aTerminal 
	aTerminal alert 
		alertTitle: aFilter name 
		contents: aLine line trimRight
		position: aFilter notifyPosition
		color: aFilter alertColor.
	^ self applyNullFilterTo: aStream line: aLine in: aTerminal 