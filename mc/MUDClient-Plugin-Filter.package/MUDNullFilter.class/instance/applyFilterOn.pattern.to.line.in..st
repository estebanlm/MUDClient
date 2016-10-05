private
applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine in: aTerminal  
	^ aPlugin applyNullFilterTo: aStream line: aLine in: aTerminal
	