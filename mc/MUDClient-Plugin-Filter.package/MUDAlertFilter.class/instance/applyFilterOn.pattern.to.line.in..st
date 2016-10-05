private
applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine in: aTerminal  
	^ aPlugin applyAlertFilter: self to: aStream line: aLine in: aTerminal
	