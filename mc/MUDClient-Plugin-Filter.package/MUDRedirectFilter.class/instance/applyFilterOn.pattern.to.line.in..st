private
applyFilterOn: aPlugin pattern: aPattern to: aStream line: aString in: aTerminal  
	^ aPlugin applyRedirectFilter: self pattern: aPattern to: aStream line: aString in: aTerminal
	