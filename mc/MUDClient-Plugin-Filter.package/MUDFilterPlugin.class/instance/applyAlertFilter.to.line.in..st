private
applyAlertFilter: aFilter to: aStream line: aString in: aTerminal 
	aTerminal alert 
		alertTitle: aFilter name 
		contents: aString 
		color: aFilter alertColor.
	^ self applyNullFilterTo: aStream line: aString in: aTerminal 