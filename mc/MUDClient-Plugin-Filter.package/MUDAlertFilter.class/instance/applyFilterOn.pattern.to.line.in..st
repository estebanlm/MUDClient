private
applyFilterOn: aPlugin pattern: aPattern to: aStream line: aString in: aTerminal  
	^ aPlugin applyAlertFilter: self to: aStream line: aString in: aTerminal
	