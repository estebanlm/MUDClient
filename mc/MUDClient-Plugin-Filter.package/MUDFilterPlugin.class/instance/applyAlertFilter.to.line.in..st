private
applyAlertFilter: aFilter to: aStream line: aString in: aTerminal 
	aTerminal alert 
		alertTitle: aFilter name 
		contents: aString 
		position: aFilter notifyPosition
		color: aFilter alertColor.
	^ self applyNullFilterTo: aStream line: aString in: aTerminal 