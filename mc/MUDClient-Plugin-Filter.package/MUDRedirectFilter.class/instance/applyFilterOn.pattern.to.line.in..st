private
applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine in: aTerminal  
	^ aPlugin applyRedirectFilter: self pattern: aPattern to: aStream line: aLine in: aTerminal
	