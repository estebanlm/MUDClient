private
applyFilterOn: aPlugin pattern: aPattern to: aStream line: aLine in: aTerminal 
	^ aPlugin applyTriggerFilter: self to: aStream line: aLine in: aTerminal
	