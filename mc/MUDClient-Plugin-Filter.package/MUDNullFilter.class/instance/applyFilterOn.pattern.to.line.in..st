private
applyFilterOn: aPlugin pattern: aPattern to: aStream line: aString in: aTerminal  
	^ aPlugin applyNullFilterTo: aStream line: aString in: aTerminal
	