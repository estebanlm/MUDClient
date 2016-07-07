private
applyFilterOn: aPlugin pattern: aStream to: aString line: aTerminal in: anObject 
	^ aPlugin applyTriggerFilterTo: aStream line: aStream in: aTerminal
	